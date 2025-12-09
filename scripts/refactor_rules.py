import re
import os

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Pattern: Look for lines starting with a rule number (e.g. "1.1.1 " or "21.2.3.1 ")
    # But NOT inside a #subrule or #rule definition (those are handled differently).
    # We want to catch lines in the body.

    # Regex explanation:
    # ^(\s*) - Capture leading whitespace (indentation)
    # (\d+(\.\d+)+) - Capture the number (e.g. 1.2.3)
    # \s+ - Separator
    # (.*)$ - The rest of the line content

    # We need to be careful not to match #subrule("1.1"...
    # So we ensure the line doesn't start with #

    pattern = re.compile(r'^(\s*)(\d+(?:\.\d+)+)\s+(.*)$', re.MULTILINE)

    def replacer(match):
        indent = match.group(1)
        number = match.group(2)
        text = match.group(3)
        # Wrap in #r function
        return f'{indent}#r("{number}")[{text}]'

    new_content = pattern.sub(replacer, content)

    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Processed {filepath}")

# Process all chapter files
chapters_dir = "chapters"
for filename in os.listdir(chapters_dir):
    if filename.endswith(".typ"):
        process_file(os.path.join(chapters_dir, filename))

