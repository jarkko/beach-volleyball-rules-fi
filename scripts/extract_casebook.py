import pypdf
import os

pdf_path = "documents/english/2025-BVB-Illustrated-Casebook_Feb-2025.pdf"
output_path = "corpus/english/2025-BVB-Illustrated-Casebook_Feb-2025.txt"

reader = pypdf.PdfReader(pdf_path)
text = ""
for page in reader.pages:
    text += page.extract_text() + "\n\n"

os.makedirs(os.path.dirname(output_path), exist_ok=True)
with open(output_path, "w", encoding="utf-8") as f:
    f.write(text)

print(f"Extracted text to {output_path}")

