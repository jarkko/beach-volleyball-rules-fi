import re
import argparse

def load_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def extract_part1(full_text):
    # Locate Part 1 start
    # Find all matches
    start_pattern = re.compile(r"PART 1: PHILOSOPHY OF RULES AND REFEREEING", re.MULTILINE)
    matches = list(start_pattern.finditer(full_text))
    
    if not matches:
        return None
        
    # Heuristic: The content comes later. TOC is early.
    # Take the last match if multiple? Or checking context.
    # Page 11 context has "INTRODUCTION" after it.
    
    start_pos = matches[-1].start()
    
    # End at Part 2
    # Be careful not to match PART 2 in TOC
    end_pattern = re.compile(r"PART 2", re.MULTILINE)
    end_match = end_pattern.search(full_text, start_pos)
    
    if end_match:
        end_pos = end_match.start()
    else:
        end_pos = len(full_text)
        
    return full_text[start_pos:end_pos]

def clean_text(text):
    lines = text.split('\n')
    cleaned = []
    for line in lines:
        line = line.strip()
        if not line: continue
        if re.match(r'^\d+$', line): continue # Page numbers
        if "OFFICIAL BEACH VOLLEYBALL RULES" in line: continue
        if line.startswith("--- Page"): continue
        
        cleaned.append(line)
    return cleaned

def generate_typst(lines):
    output = []
    output.append('#import "../lib/utils.typ": *\n')
    output.append('= OSA 1: SÄÄNTÖJEN JA TUOMARITOIMINNAN FILOSOFIA\n')
    
    current_header = None
    
    for line in lines:
        # Check for headings (All uppercase lines, but exclude PART 1 title)
        if line.isupper() and len(line) > 5 and "PART 1" not in line:
            if line == "INTRODUCTION":
                output.append('\n== JOHDANTO\n')
            elif "COMPETITIVE SPORT" in line:
                output.append('\n== FIVB BEACH VOLLEY ON KILPAILUURHEILUA\n')
            elif "THE RULES TEXT" in line:
                output.append('\n== SÄÄNTÖTEKSTI\n')
            elif "THE REFEREE WITHIN THIS FRAMEWORK" in line:
                output.append('\n== TUOMARI TÄSSÄ VIITEKEHYKSESSÄ\n')
            elif "VOLLEY" in line or "PASSING" in line:
                 # Skip diagram text if it's just words
                 continue
            else:
                # Just bold it if unsure
                output.append(f'\n*{line}*\n')
        elif "PART 1" in line:
            continue
        else:
            # Regular text
            output.append(f'{line} ')
            
    return "".join(output)

def main(corpus_path, output_path):
    full_text = load_file(corpus_path)
    part1_text = extract_part1(full_text)
    
    if not part1_text:
        print("Part 1 not found in corpus.")
        return
        
    cleaned_lines = clean_text(part1_text)
    typst_content = generate_typst(cleaned_lines)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(typst_content)
    print(f"Generated Part 1 scaffold at {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--corpus", default="corpus/english/FIVB-BeachVolleyball_Rules2025_2028-EN-v01.txt")
    parser.add_argument("--output", default="src/chapters/part-1-philosophy.typ")
    args = parser.parse_args()
    
    main(args.corpus, args.output)

