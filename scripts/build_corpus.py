import os
from pypdf import PdfReader

def extract_text_from_pdfs(source_dir, target_dir):
    for root, dirs, files in os.walk(source_dir):
        # Determine relative path to mirror structure
        rel_path = os.path.relpath(root, source_dir)
        target_path = os.path.join(target_dir, rel_path)

        # Create target directory if it doesn't exist
        if not os.path.exists(target_path):
            os.makedirs(target_path)

        for file in files:
            if file.lower().endswith('.pdf'):
                source_file = os.path.join(root, file)
                target_filename = os.path.splitext(file)[0] + ".txt"
                target_file = os.path.join(target_path, target_filename)

                print(f"Extracting: {file} -> {target_filename}")

                try:
                    reader = PdfReader(source_file)
                    text = []
                    for i, page in enumerate(reader.pages):
                        page_text = page.extract_text()
                        if page_text:
                            # Add page marker for easier reference
                            text.append(f"\n--- Page {i+1} ---\n")
                            text.append(page_text)

                    with open(target_file, 'w', encoding='utf-8') as f:
                        f.write("".join(text))

                except Exception as e:
                    print(f"Error extracting {file}: {e}")

if __name__ == "__main__":
    source_directory = "documents"
    corpus_directory = "corpus"

    print(f"Building corpus from {source_directory} to {corpus_directory}...")
    extract_text_from_pdfs(source_directory, corpus_directory)
    print("Corpus build complete.")

