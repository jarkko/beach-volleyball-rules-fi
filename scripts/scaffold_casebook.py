import re
import os
import sys

def parse_casebook(text_path):
    with open(text_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Split into lines
    lines = content.split('\n')

    cases = []
    current_case = None
    capture_mode = None # 'question', 'ruling'

    # Regex for case number (e.g., 1.1.1, 10.12)
    case_num_re = re.compile(r'^(\d+\.\d+(\.\d+)?)\s*$')

    for i, line in enumerate(lines):
        line = line.strip()
        if not line:
            continue

        # Check for Case Number
        match = case_num_re.match(line)
        if match:
            # Save previous case if exists
            if current_case:
                cases.append(current_case)

            current_case = {
                'number': match.group(1),
                'question': [],
                'ruling': [],
                'refs': []
            }
            capture_mode = 'question'
            continue

        if line.lower() == 'ruling':
            capture_mode = 'ruling'
            continue

        if line.startswith('Rules') or line.startswith('Rule '):
            if current_case:
                # Extract refs
                refs_text = line.replace('Rules', '').replace('Rule', '').strip()
                # Split by comma or space
                refs = [r.strip() for r in re.split(r'[,]', refs_text) if r.strip()]
                current_case['refs'] = refs
                capture_mode = None # Stop capturing ruling
            continue

        if current_case and capture_mode:
            if capture_mode == 'question':
                current_case['question'].append(line)
            elif capture_mode == 'ruling':
                current_case['ruling'].append(line)

    if current_case:
        cases.append(current_case)

    return cases

def generate_typst(cases, output_dir):
    os.makedirs(output_dir, exist_ok=True)

    # Group by Chapter (First digit of case number)
    chapters = {}
    for case in cases:
        ch_num = case['number'].split('.')[0]
        if ch_num not in chapters:
            chapters[ch_num] = []
        chapters[ch_num].append(case)

    for ch_num, ch_cases in chapters.items():
        output_path = os.path.join(output_dir, f"chapter-{ch_num}.typ")
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(f'#import "../lib/utils.typ": *\n\n')
            f.write(f'= LUKU {ch_num}\n\n')

            for case in ch_cases:
                q_text = " ".join(case['question']).replace('"', '\\"').replace('#', '\\#')
                r_text = " ".join(case['ruling']).replace('"', '\\"').replace('#', '\\#')
                refs_str = ", ".join([f'"{r}"' for r in case['refs']])

                f.write(f'#case(\n')
                f.write(f'  "{case["number"]}",\n')
                f.write(f'  [{q_text}],\n')
                f.write(f'  [{r_text}],\n')
                f.write(f'  ({refs_str})\n')
                f.write(f')\n\n')
        print(f"Generated {output_path}")

if __name__ == "__main__":
    text_path = "corpus/english/2025-BVB-Illustrated-Casebook_Feb-2025.txt"
    output_dir = "src/casebook"
    cases = parse_casebook(text_path)
    generate_typst(cases, output_dir)

