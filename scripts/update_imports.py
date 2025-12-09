import os

chapters_dir = "src/chapters"

for filename in os.listdir(chapters_dir):
    if filename.endswith(".typ"):
        filepath = os.path.join(chapters_dir, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        # Replace old import
        new_content = content.replace('#import "../template.typ": *', '#import "../lib/utils.typ": *')

        if new_content != content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Updated imports in {filename}")

