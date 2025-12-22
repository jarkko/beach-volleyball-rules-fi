#!/usr/bin/env python3
"""
Convert Typst files to Markdown format for Pandoc processing.

Converts Typst-specific functions to Markdown equivalents:
- #rule() -> custom block with attributes
- #subrule() -> custom block
- #r() -> inline rule items
- #diagram() -> custom block
- #refs() -> inline span with margin-ref class
- #case() -> custom block for casebook
"""

import re
import sys
from pathlib import Path

def convert_rule(match):
    """Convert #rule("num", "title")[...] to Markdown block"""
    number = match.group(1)
    title = match.group(2)
    body = match.group(3)

    # Convert body recursively
    body = convert_typst_to_markdown(body)

    return f'\n\n[rule,number="{number}",title="{title}"]\n====\n{body}\n====\n\n'

def convert_subrule(match):
    """Convert #subrule("num", "title")[...] to Markdown block"""
    number = match.group(1)
    title = match.group(2)
    body = match.group(3)

    body = convert_typst_to_markdown(body)

    return f'\n\n[subrule,number="{number}",title="{title}"]\n====\n{body}\n====\n\n'

def convert_rule_item(match):
    """Convert #r("num")[content] to formatted paragraph"""
    number = match.group(1)
    content = match.group(2)

    content = convert_typst_to_markdown(content)

    return f'\n\n{number} {content}\n'

def convert_diagram(match):
    """Convert #diagram("num", "title")[...] to Markdown block"""
    number = match.group(1)
    title = match.group(2)
    body = match.group(3)

    body = convert_typst_to_markdown(body)

    return f'\n\n[diagram,number="{number}",title="{title}"]\n====\n{body}\n====\n\n'

def convert_refs(match):
    """Convert #refs("ref1", "ref2") to inline span with margin-ref class"""
    args = match.group(1)

    # Parse arguments (handle both single and multiple refs)
    # Remove quotes and extract refs
    refs = re.findall(r'"([^"]+)"', args)
    refs_str = ','.join(refs)

    return f'{{.refs data-refs="{refs_str}"}}'

def convert_case(match):
    """Convert #case("num", question, ruling, rules) to Markdown block"""
    number = match.group(1)
    question = match.group(2)
    ruling = match.group(3)
    rules = match.group(4) if match.group(4) else ""

    question = convert_typst_to_markdown(question)
    ruling = convert_typst_to_markdown(ruling)

    result = f'\n\n[case,number="{number}"]\n====\n'
    result += f'**Tapaus {number}**\n\n'
    result += f'{question}\n\n'
    result += f'**Päätös**\n\n{ruling}\n'

    if rules:
        rules_refs = re.findall(r'"([^"]+)"', rules)
        if rules_refs:
            refs_str = ','.join(rules_refs)
            result += f'\n*Säännöt: {refs_str}*\n'

    result += '\n====\n\n'
    return result

def find_matching_bracket(text, start_pos):
    """Find the matching closing bracket for an opening bracket at start_pos"""
    depth = 0
    i = start_pos
    while i < len(text):
        if text[i] == '[':
            depth += 1
        elif text[i] == ']':
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return -1

def convert_typst_to_markdown(content):
    """Main conversion function"""
    # Convert imports (remove them)
    content = re.sub(r'#import[^\n]*\n', '', content)

    # Convert headings (= -> #)
    content = re.sub(r'^=+ (.+)$', lambda m: '#' * (len(m.group(0).split()[0])) + ' ' + m.group(1), content, flags=re.MULTILINE)

    # Convert rule items FIRST (before blocks, since they're nested inside)
    # Need to handle nested brackets properly
    i = 0
    result = []
    while i < len(content):
        # Look for #r("pattern")
        match = re.match(r'#r\("([^"]+)"\)\[', content[i:])
        if match:
            number = match.group(1)
            # Find the matching bracket
            bracket_start = i + match.end() - 1  # Position of [
            bracket_end = find_matching_bracket(content, bracket_start)
            if bracket_end > 0:
                # Extract content between brackets
                body = content[bracket_start + 1:bracket_end]
                # Recursively convert the body
                body = convert_typst_to_markdown(body)
                # Replace with markdown format
                result.append(f'\n\n{number} {body}\n')
                i = bracket_end + 1
                continue
        result.append(content[i])
        i += 1
    content = ''.join(result)

    # Convert rule blocks - need to handle nested brackets
    # Use a more sophisticated approach
    i = 0
    result = []
    while i < len(content):
        # Look for #rule("pattern", "pattern")[
        match = re.match(r'#rule\("([^"]+)",\s*"([^"]+)"\)\[', content[i:])
        if match:
            number = match.group(1)
            title = match.group(2)
            bracket_start = i + match.end() - 1
            bracket_end = find_matching_bracket(content, bracket_start)
            if bracket_end > 0:
                body = content[bracket_start + 1:bracket_end]
                body = convert_typst_to_markdown(body)
                result.append(f'\n\n[rule,number="{number}",title="{title}"]\n====\n{body}\n====\n\n')
                i = bracket_end + 1
                continue

        # Look for #subrule("pattern", "pattern")[
        match = re.match(r'#subrule\("([^"]+)",\s*"([^"]+)"\)\[', content[i:])
        if match:
            number = match.group(1)
            title = match.group(2)
            bracket_start = i + match.end() - 1
            bracket_end = find_matching_bracket(content, bracket_start)
            if bracket_end > 0:
                body = content[bracket_start + 1:bracket_end]
                body = convert_typst_to_markdown(body)
                result.append(f'\n\n[subrule,number="{number}",title="{title}"]\n====\n{body}\n====\n\n')
                i = bracket_end + 1
                continue

        result.append(content[i])
        i += 1
    content = ''.join(result)

    # Convert diagrams
    content = re.sub(
        r'#diagram\("([^"]+)",\s*"([^"]+)"\)\[(.*?)\]',
        convert_diagram,
        content,
        flags=re.DOTALL
    )

    # Convert refs (margin references)
    # Handle #refs("ref1", "ref2") or #refs("ref1")
    content = re.sub(
        r'#refs\((.*?)\)',
        convert_refs,
        content
    )

    # Convert case blocks (simplified - may need better parsing)
    content = re.sub(
        r'#case\("([^"]+)",\s*(.*?),\s*(.*?)(?:,\s*(.*?))?\)',
        convert_case,
        content,
        flags=re.DOTALL
    )

    # Convert images
    content = re.sub(
        r'#image\("([^"]+)",\s*(.*?)\)',
        lambda m: f'![Image]({m.group(1)})',
        content
    )

    # Convert labels (for cross-references) - remove them as Pandoc handles IDs differently
    content = re.sub(r'#label\("([^"]+)"\)', lambda m: f'{{#{m.group(1)}}}', content)

    # Convert pagebreaks
    content = re.sub(r'#pagebreak\(\)', '\n\n\\pagebreak\n\n', content)

    # Convert tables (Typst table syntax is complex, may need manual conversion)
    # For now, leave as-is and handle separately

    # Clean up multiple blank lines
    content = re.sub(r'\n{3,}', '\n\n', content)

    return content

def convert_file(input_path, output_path):
    """Convert a Typst file to Markdown"""
    with open(input_path, 'r', encoding='utf-8') as f:
        typst_content = f.read()

    markdown_content = convert_typst_to_markdown(typst_content)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(markdown_content)

    print(f"Converted: {input_path} -> {output_path}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 convert_typst_to_markdown.py <input.typ> [output.md]")
        sys.exit(1)

    input_path = Path(sys.argv[1])
    if not input_path.exists():
        print(f"Error: {input_path} does not exist")
        sys.exit(1)

    if len(sys.argv) >= 3:
        output_path = Path(sys.argv[2])
    else:
        output_path = input_path.with_suffix('.md')

    convert_file(input_path, output_path)

if __name__ == "__main__":
    main()


