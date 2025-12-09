import os
from pypdf import PdfReader

def extract_images_from_pdf(pdf_path, output_dir):
    reader = PdfReader(pdf_path)
    count = 0

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    print(f"Extracting images from {pdf_path} to {output_dir}...")

    for page_num, page in enumerate(reader.pages):
        for image_file_object in page.images:
            try:
                # Construct a filename that includes page number for easier mapping
                filename = f"page_{page_num + 1}_{image_file_object.name}"
                filepath = os.path.join(output_dir, filename)

                with open(filepath, "wb") as fp:
                    fp.write(image_file_object.data)

                count += 1
                print(f"  Saved {filename}")
            except Exception as e:
                print(f"  Failed to save image on page {page_num + 1}: {e}")

    print(f"Finished. Extracted {count} images from {pdf_path}.")

def main():
    base_path = "documents/english"

    # Rules
    rules_pdf = os.path.join(base_path, "FIVB-BeachVolleyball_Rules2025_2028-EN-v01.pdf")
    extract_images_from_pdf(rules_pdf, "src/assets/images/rules")

    # Guidelines
    guidelines_pdf = os.path.join(base_path, "2023_FIVB_Beach_Volleyball_Refereeing_Guidelines_and_Instructions.pdf")
    extract_images_from_pdf(guidelines_pdf, "src/assets/images/guidelines")

    # Casebook
    casebook_pdf = os.path.join(base_path, "2025-BVB-Illustrated-Casebook_Feb-2025.pdf")
    extract_images_from_pdf(casebook_pdf, "src/assets/images/casebook")

if __name__ == "__main__":
    main()

