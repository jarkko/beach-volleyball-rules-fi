#!/usr/bin/env python3
"""
Combine Markdown files with #include-like directives.
Replaces include directives with actual file content.
"""

import re
import sys
from pathlib import Path

def combine_includes(content, base_dir):
    """Replace include directives with file content"""
    lines = content.split('\n')
    result = []

    for line in lines:
        # Match #include "path/to/file.md"
        match = re.match(r'#include\s+"([^"]+)"', line)
        if match:
            include_rel = match.group(1)
            # Handle different include path patterns
            # Pattern 1: "rules/chapter-1.typ" -> "src-rules/chapter-1.md" (when base is src-rules/)
            # Pattern 2: "casebook/chapter-1.typ" -> "src-rules/casebook/chapter-1.md"
            # Pattern 3: "guidelines/refereeing-guidelines.typ" -> "src-rules/guidelines/refereeing-guidelines.md"

            include_path_parts = Path(include_rel).parts
            # base_dir is typically one of:
            # - src-rules
            # - src-rules/guidelines
            # - src-rules/casebook
            # We want src_rules_dir to be the src-rules root in all these cases.
            src_rules_dir = base_dir if base_dir.name == 'src-rules' else base_dir.parent

            # Reconstruct path
            if len(include_path_parts) > 1:
                # Has subdirectory (e.g., "rules/chapter-1.typ" or "guidelines/refereeing-guidelines.typ")
                subdir = include_path_parts[0]
                filename = include_path_parts[1]

                # Special case: "rules/" prefix should map to src-rules root (not src-rules/rules/)
                if subdir == 'rules':
                    include_path = src_rules_dir / filename
                elif subdir == 'guidelines' or subdir == 'casebook':
                    include_path = src_rules_dir / subdir / filename
                else:
                    # Unknown subdir, try direct mapping
                    include_path = src_rules_dir / subdir / filename
            else:
                # Just filename (e.g., "chapter-1.typ")
                filename = include_path_parts[0]
                # If base_dir is in a subdirectory (e.g., src-rules/guidelines/), look there first
                if base_dir.name in ['guidelines', 'casebook']:
                    include_path = base_dir / filename
                else:
                    include_path = src_rules_dir / filename

            # Change .typ to .md extension
            include_path = include_path.with_suffix('.md')

            if include_path.exists():
                with open(include_path, 'r', encoding='utf-8') as f:
                    included_content = f.read()
                result.append(included_content)
                result.append('')  # Add blank line after include
            else:
                print(f"Warning: Include file not found: {include_path}", file=sys.stderr)
                result.append(line)  # Keep original line if file not found
        else:
            result.append(line)

    return '\n'.join(result)

def process_file(input_path, output_path):
    """Process a file and combine its includes"""
    base_dir = input_path.parent

    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove show/outline directives that don't translate
    # Remove full multi-line project metadata blocks (we'll use Pandoc metadata instead)
    content = re.sub(r'#show:\s*project\.with\([\s\S]*?\)\s*\n', '', content)
    content = re.sub(r'#show:.*?\n', '', content)
    content = re.sub(r'#outline\(\)\n', '', content)

    # Combine includes
    content = combine_includes(content, base_dir)

    # Clean up multiple blank lines
    content = re.sub(r'\n{3,}', '\n\n', content)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(content)

    print(f"Combined: {input_path} -> {output_path}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 combine_includes.py <input.md> [output.md]")
        sys.exit(1)

    input_path = Path(sys.argv[1])
    if not input_path.exists():
        print(f"Error: {input_path} does not exist")
        sys.exit(1)

    if len(sys.argv) >= 3:
        output_path = Path(sys.argv[2])
    else:
        output_path = input_path.with_name(input_path.stem + '-combined.md')

    process_file(input_path, output_path)

if __name__ == "__main__":
    main()


