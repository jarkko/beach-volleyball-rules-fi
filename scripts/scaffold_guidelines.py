import re
import argparse
import os

def load_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def generate_scaffold(text, output_dir):
    lines = text.split('\n')
    typst_content = []
    typst_content.append('#import "../lib/utils.typ": *\n')
    typst_content.append('= OSA 2 - JAKSO 2: TUOMAROHJEET JA -OHJEISTUKSET\n')
    
    # Tracking state
    in_section = False
    
    for line in lines:
        line = line.strip()
        if not line: continue
        
        # Detect Headers
        if line.startswith("REFEREEING GUIDELINES"):
            continue
            
        # Detect main sections (e.g. "THE REFEREEING CORPS")
        # In this specific PDF text extraction, headers might be hard to distinguish solely by case
        # But let's look for "Rule X" or specific known headers
        
        if line.startswith("Rule ") and " – " in line:
            # e.g. "Rule 1 – Playing Area"
            match = re.match(r"Rule (\d+)\s+–\s+(.*)", line)
            if match:
                r_num = match.group(1)
                r_title = match.group(2)
                typst_content.append(f'\n== Sääntö {r_num} – {r_title}\n') # We can translate title later or keep English placeholder
                continue

        # Detect bullet points or numbered lists
        # The extraction often loses clean bullets, but let's try
        if re.match(r'^\d+\.', line):
            # 1. Something
            typst_content.append(f'\n{line}\n')
        elif re.match(r'^[•-]', line):
            typst_content.append(f'- {line[1:].strip()}\n')
        else:
            typst_content.append(f'{line} ')

    output_path = os.path.join(output_dir, "refereeing-guidelines.typ")
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write("".join(typst_content))
    print(f"Generated scaffold at {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--corpus", default="corpus/english/BeachRefereeingGuidelines.txt")
    parser.add_argument("--output_dir", default="src/chapters")
    args = parser.parse_args()
    
    text = load_file(args.corpus)
    generate_scaffold(text, args.output_dir)

