import re
import os

def clean_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Split fused words like "erikseenkyseisessä" (Hard to do perfectly without dictionary,
    # but we can fix "word1Word2" or "word1.Word2")

    # Fix: "sana.Toinen" -> "sana. Toinen"
    content = re.sub(r'([a-zäö])\.([A-ZÄÖ])', r'\1. \2', content)

    # Fix: "sana,toinen" -> "sana, toinen"
    content = re.sub(r'([a-zäö]),([a-zäö])', r'\1, \2', content)

    # Fix: "sana1.2" (keep numbers) but "sana1.Sana" -> "sana1. Sana"
    content = re.sub(r'(\d)\.([A-ZÄÖ])', r'\1. \2', content)

    # 2. Fix issues where line numbers/refs are fused: "sääntöjenmukaisesti.Sen"
    content = re.sub(r'([a-zäö])\.([A-ZÄÖ])', r'\1. \2', content)

    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Cleaned {path}")

if __name__ == "__main__":
    clean_file("corpus/finnish/Saannot-A5.txt")

