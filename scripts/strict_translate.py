import re
import sys

def extract_chapter(chapter_num, source_path):
    with open(source_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find start
    start_pattern = f"CHAPTER {chapter_num}"
    try:
        # Find the SECOND occurrence (skip TOC)
        first_idx = content.find(start_pattern)
        start_idx = content.find(start_pattern, first_idx + 1)
        if start_idx == -1: start_idx = first_idx # Fallback
    except ValueError:
        return None

    # Find end (Next Chapter or End of Part)
    next_chapter = int(chapter_num) + 1
    end_pattern = f"CHAPTER {next_chapter}"
    end_idx = content.find(end_pattern, start_idx)
    
    if end_idx == -1:
        # Try finding end of section
        end_idx = content.find("PART 2", start_idx)
        if end_idx == -1:
            end_idx = len(content)

    return content[start_idx:end_idx]

def create_template(chapter_text):
    lines = chapter_text.split('\n')
    output = []
    
    for line in lines:
        line = line.strip()
        # Skip page numbers, empty lines, headers
        if not line or line.startswith('--- Page') or re.match(r'^\d+$', line):
            continue
            
        # Detect Rules (e.g., "1 PLAYING AREA")
        if re.match(r'^\d+\s+[A-Z\s]+$', line):
            output.append(f"\n## {line}\n")
        # Detect Sub-rules (e.g., "1.1 DIMENSIONS")
        elif re.match(r'^\d+\.\d+\s+[A-Z\s]+$', line):
            output.append(f"\n### {line}\n")
        # Detect References (e.g., "1.1, D1", "See Rules", "D9 (4)")
        # Pattern: Starts with D\d, Rule, or numbers/commas only
        elif re.match(r'^(D\d+|See Rules|\d+(\.\d+)*([, ]+\d+(\.\d+)*)*)$', line) or 'D9' in line:
            output.append(f"> *See Rules: {line}*")
        # Detect text content
        else:
            output.append(f"{line}")
            
    return "\n".join(output)

if __name__ == "__main__":
    chapter = sys.argv[1]
    source = "corpus/english/FIVB-BeachVolleyball_Rules2025_2028-EN-v01.txt"
    
    text = extract_chapter(chapter, source)
    if text:
        print(create_template(text))
    else:
        print("Chapter not found")

