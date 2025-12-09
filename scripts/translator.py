import json
import os
import re
import sys
import argparse

class Translator:
    def __init__(self, memory_path, indoor_en_path=None, indoor_fi_path=None):
        self.memory_path = memory_path
        self.load_memory()
        # Corpus loading skipped for now to focus on memory

    def load_memory(self):
        if os.path.exists(self.memory_path):
            with open(self.memory_path, 'r', encoding='utf-8') as f:
                self.memory = json.load(f)
        else:
            self.memory = {"terms": {}, "phrases": {}}

    def save_memory(self):
        with open(self.memory_path, 'w', encoding='utf-8') as f:
            json.dump(self.memory, f, indent=4, ensure_ascii=False)

    def update_memory(self, source_term, target_term):
        source_key = source_term.lower().strip()
        self.memory["terms"][source_key] = target_term
        self.save_memory()
        print(f"Learned: '{source_key}' -> '{target_term}'")

    def translate_text(self, text):
        translated = text
        # Sort terms by length (descending) to avoid partial matches
        sorted_terms = sorted(self.memory["terms"].keys(), key=len, reverse=True)

        for term in sorted_terms:
            target = self.memory["terms"][term]
            # Regex for Case-Insensitive replacement
            pattern = re.compile(re.escape(term), re.IGNORECASE)

            # Function to preserve case
            def replace_case(match):
                g = match.group(0)
                if g.isupper():
                    return target.upper()
                elif g.istitle():
                    return target.capitalize()
                else:
                    return target

            translated = pattern.sub(replace_case, translated)

        return translated

def process_file(file_path, translator):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    translated_content = translator.translate_text(content)

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(translated_content)

    print(f"Translated {file_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Translate or Teach')
    parser.add_argument('--file', help='File to translate')
    parser.add_argument('--teach', nargs=2, help='Teach a term: source target')

    args = parser.parse_args()

    translator = Translator("data/memory.json")

    if args.teach:
        translator.update_memory(args.teach[0], args.teach[1])

    if args.file:
        process_file(args.file, translator)
