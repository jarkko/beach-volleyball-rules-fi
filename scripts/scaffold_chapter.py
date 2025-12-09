import re
import argparse

def load_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def extract_chapter_text(chapter_num, full_text):
    # Locate Chapter start
    start_pattern = re.compile(rf"CHAPTER {chapter_num}\s*\n([^\n]+)", re.MULTILINE)
    matches = list(start_pattern.finditer(full_text))

    if not matches:
        return None

    real_start = -1
    for m in matches:
        line = m.group(0)
        if "...." not in line:
            real_start = m.start()
            break

    if real_start == -1:
        real_start = matches[-1].start()

    next_chapter_pattern = re.compile(rf"CHAPTER {int(chapter_num) + 1}", re.MULTILINE)
    next_match = next_chapter_pattern.search(full_text, real_start + 10)

    if next_match:
        end_pos = next_match.start()
    else:
        end_pos = len(full_text)

    return full_text[real_start:end_pos]

def clean_text(text):
    lines = text.split('\n')
    cleaned = []
    for line in lines:
        line = line.strip()
        if not line: continue
        if re.match(r'^\d+$', line): continue # Page numbers
        if "OFFICIAL BEACH VOLLEYBALL RULES" in line: continue
        if "PART 2 - SECTION" in line: continue
        if line.startswith("--- Page"): continue
        # Keep "See Rules" for now, might filter later

        cleaned.append(line)
    return cleaned

def is_valid_next_number(current_num, next_num):
    """
    Checks if next_num is a valid successor to current_num in a hierarchical outline.
    """
    if not current_num:
        return True # First number

    curr_parts = [int(p) for p in current_num.split('.')]
    next_parts = [int(p) for p in next_num.split('.')]

    # Case 1: Child (1.1 -> 1.1.1)
    # Next must be current + .1 (strictly speaking) or .X
    if len(next_parts) == len(curr_parts) + 1:
        if next_parts[:len(curr_parts)] == curr_parts:
            return True # It is a child, e.g. 12.2 -> 12.2.1

    # Case 2: Sibling (1.1 -> 1.2)
    if len(next_parts) == len(curr_parts):
        # Prefix must match except last digit
        if len(curr_parts) > 1:
             if next_parts[:-1] == curr_parts[:-1] and next_parts[-1] > curr_parts[-1]:
                 return True
        else:
             # Top level rule 8 -> 9
             if next_parts[0] > curr_parts[0]:
                 return True

    # Case 3: Uncle (1.1.1 -> 1.2 or 1.1.1 -> 2)
    if len(next_parts) < len(curr_parts):
        # It's stepping back up.
        # 12.2.2.1 -> 12.3
        # Prefix of next (up to its last part) must match prefix of current
        # And the last part of next must be > corresponding part in current

        # Example 12.2.2.1 (curr) -> 12.3 (next)
        # next len is 2. compare curr[:1] (12) with next[:1] (12). Match.
        # compare curr[1] (2) with next[1] (3). 3 > 2. OK.

        check_len = len(next_parts) - 1
        if next_parts[:check_len] == curr_parts[:check_len]:
            if next_parts[-1] > curr_parts[check_len]:
                return True

    # Case 4: Special case for rules that skip numbers? Unlikely in strictly ordered.
    # But maybe 12.2.2 -> 12.3

    return False

def parse_rules(lines):
    doc = []

    current_block = None
    last_rule_number = None

    for line in lines:
        # Check for Rule (e.g. 12 SERVICE, 22 1st REFEREE)
        # Allow comma and dot in title
        rule_match = re.match(r'^(\d+)\s+([A-Za-z0-9\s\/\-\’\,\.]+)$', line)
        if rule_match:
            num = rule_match.group(1)
            # Basic validation: rules are integers
            if last_rule_number is None or is_valid_next_number(last_rule_number, num):
                # Heuristic: Rule titles are usually short-ish and mostly uppercase
                # But "1st REFEREE" has lowercase.
                # Check uppercase ratio
                title = rule_match.group(2).strip()
                letters = [c for c in title if c.isalpha()]
                upper_count = sum(1 for c in letters if c.isupper())
                if letters and (upper_count / len(letters) > 0.5) and len(title) < 100:
                    doc.append({'type': 'rule', 'number': num, 'title': title, 'content': []})
                    current_block = doc[-1]['content']
                    last_rule_number = num
                    continue

        # Check for Subrule (e.g. 12.1 FIRST SERVICE...)
        # Allow numbers, lowercase, comma in subrule title too just in case
        subrule_match = re.match(r'^(\d+\.\d+)\s+([A-Za-z0-9\s\/\-\’\:\(\)\,\.]+)$', line)
        if subrule_match:
            num = subrule_match.group(1)
            title = subrule_match.group(2).strip()

            # Additional check: Title should be mostly uppercase?
            # Or reliance on strict ordering.
            if is_valid_next_number(last_rule_number, num):
                doc.append({'type': 'subrule', 'number': num, 'title': title, 'content': []})
                current_block = doc[-1]['content']
                last_rule_number = num
                continue

        # Check for numbered Item (e.g. 12.2.2, 12.2.2.1)
        item_match = re.match(r'^(\d+(?:\.\d+)+)\s+(.*)', line)
        if item_match:
            num = item_match.group(1)
            text = item_match.group(2).strip()

            # Strict ordering check is crucial here to avoid "0.50 m"
            if is_valid_next_number(last_rule_number, num):
                doc.append({'type': 'r', 'number': num, 'text': text})
                current_block = None
                last_rule_number = num
                continue

        # Text line
        if current_block is not None:
             if isinstance(current_block, list):
                 current_block.append({'type': 'text', 'text': line})
        else:
            if doc and doc[-1]['type'] == 'r':
                doc[-1]['text'] += " " + line
            elif doc and doc[-1]['type'] in ['rule', 'subrule']:
                doc[-1]['content'].append({'type': 'text', 'text': line})
            else:
                 doc.append({'type': 'text', 'text': line})

    return doc

def generate_typst(doc):
    output = []
    output.append('#import "../lib/utils.typ": *\n')

    for item in doc:
        if item['type'] == 'rule':
            output.append(f'\n#rule("{item["number"]}", "{item["title"]}")[\n')
            for c in item['content']:
                if c['type'] == 'text':
                    output.append(f'  {c["text"]}\n')
            output.append(']\n')

        elif item['type'] == 'subrule':
            output.append(f'\n#subrule("{item["number"]}", "{item["title"]}")[\n')
            for c in item['content']:
                if c['type'] == 'text':
                    output.append(f'  {c["text"]}\n')
            output.append(']\n')

        elif item['type'] == 'r':
            text = item['text']
            output.append(f'  #r("{item["number"]}")[{text}]\n')

        elif item['type'] == 'text':
            output.append(f'{item["text"]}\n')

    return "".join(output)

def main(chapter_num, corpus_path, output_path):
    full_text = load_file(corpus_path)
    chapter_text = extract_chapter_text(chapter_num, full_text)

    if not chapter_text:
        print(f"Chapter {chapter_num} not found in corpus.")
        return

    cleaned_lines = clean_text(chapter_text)
    doc_tree = parse_rules(cleaned_lines)
    typst_content = generate_typst(doc_tree)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(typst_content)
    print(f"Generated scaffold at {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("chapter", help="Chapter number")
    parser.add_argument("--corpus", default="corpus/english/FIVB-BeachVolleyball_Rules2025_2028-EN-v01.txt")
    parser.add_argument("--output", default="scaffold.typ")
    args = parser.parse_args()

    main(args.chapter, args.corpus, args.output)
