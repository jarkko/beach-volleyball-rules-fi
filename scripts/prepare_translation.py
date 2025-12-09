import re
import os
import argparse
from difflib import SequenceMatcher

def load_text(path):
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def find_best_match(query, corpus_text):
    """
    Finds the paragraph in the corpus that is most similar to the query.
    Returns (similarity_score, paragraph).
    """
    # Split corpus into paragraphs roughly (by double newline)
    paragraphs = re.split(r'\n\s*\n', corpus_text)

    best_ratio = 0
    best_match = ""

    # Simple optimization: only check paragraphs with similar length or keywords
    for p in paragraphs:
        if len(p) < 10: continue

        ratio = SequenceMatcher(None, query, p).ratio()
        if ratio > best_ratio:
            best_ratio = ratio
            best_match = p

    return best_ratio, best_match

def extract_chapter(chapter_num, text):
    start_pattern = f"CHAPTER {chapter_num}"
    next_pattern = f"CHAPTER {int(chapter_num) + 1}"

    try:
        # Find the *second* occurrence of "CHAPTER X" because the first is usually TOC
        first_idx = text.find(start_pattern)
        start_idx = text.find(start_pattern, first_idx + 1)

        if start_idx == -1: # Fallback if only one occurrence
            start_idx = first_idx

        try:
            # Find next chapter after the start_idx
            end_idx = text.find(next_pattern, start_idx)
            if end_idx == -1: end_idx = len(text)
        except ValueError:
            end_idx = len(text)

        return text[start_idx:end_idx]
    except ValueError:
        return f"Chapter {chapter_num} not found."

def clean_content(content):
    # Remove TOC lines (e.g. "1.1 DIMENSIONS ....... 12")
    lines = content.split('\n')
    cleaned_lines = []
    for line in lines:
        # Skip lines that end with a number and have dots
        if re.search(r'\.{4,}\s*\d+\s*$', line):
            continue
        cleaned_lines.append(line)
    return '\n'.join(cleaned_lines)

def main(chapter_num, beach_file, indoor_en_file, indoor_fi_file):
    beach_text = load_text(beach_file)
    indoor_en_text = load_text(indoor_en_file)
    indoor_fi_text = load_text(indoor_fi_file)

    chapter_content = extract_chapter(chapter_num, beach_text)
    chapter_content = clean_content(chapter_content)

    print(f"# Translation Brief: Chapter {chapter_num}\n")

    # Process paragraph by paragraph
    # Split by Rule Number e.g., "6.1" at start of line
    rules = re.split(r'(\n\d+\.\d+.*)', chapter_content)

    for i in range(1, len(rules), 2):
        if i+1 >= len(rules): break

        rule_header = rules[i].strip()
        rule_body = rules[i+1].strip()
        full_rule = f"{rule_header}\n{rule_body}"

        print(f"## Source Rule\n\n```text\n{full_rule}\n```\n")

        # Find match in Indoor EN
        score, match = find_best_match(full_rule, indoor_en_text)

        if score > 0.2: # Lower threshold, show more context
            print(f"### Indoor Reference (Match: {int(score*100)}%)\n")
            print(f"**English:**\n```text\n{match[:500]}...\n```\n")

            # Find corresponding Finnish text
            # Look for the rule number e.g. "6.1"
            rule_num_match = re.search(r'(\d+\.\d+(\.\d+)?)', match)
            if rule_num_match:
                r_num = rule_num_match.group(1)

                # Search for this rule number in Finnish text
                # Try to find "6.1" at start of line or similar
                fi_idx = indoor_fi_text.find(r_num)
                if fi_idx != -1:
                    print(f"**Finnish ({r_num}):**")
                    print(f"```text\n{indoor_fi_text[fi_idx:fi_idx+500]}...\n```\n")
                else:
                    print(f"*(Could not locate Rule {r_num} in Finnish text)*\n")
        else:
            print("*(No close match found in Indoor Rules)*\n")

        print("---\n")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("chapter", help="Chapter number")
    args = parser.parse_args()

    main(args.chapter,
         "corpus/english/FIVB-BeachVolleyball_Rules2025_2028-EN-v01.txt",
         "corpus/english/FIVB-Volleyball_Rules2025_2028-EN-v05.txt",
         "corpus/finnish/Saannot-A5.txt")
