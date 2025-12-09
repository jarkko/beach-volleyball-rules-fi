import os
from PIL import Image

def crop_diagram(input_path, output_path, crop_box):
    """Crop an image to the specified box (left, top, right, bottom)"""
    with Image.open(input_path) as img:
        cropped = img.crop(crop_box)
        cropped.save(output_path, "PNG")
        print(f"  Cropped {os.path.basename(input_path)} -> {os.path.basename(output_path)}")

def main():
    base_dir = "src/assets/images/rules_rendered"
    output_dir = "src/assets/images/rules_diagrams"

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    print("Cropping diagrams from rendered pages...")
    print("Page dimensions: 875x1241 pixels")
    print("Crop boxes: removing ~150px from top, ~141px from bottom, ~50px from sides")

    # Standard crop box for full-page diagrams (removes header/footer/margins)
    # Left, Top, Right, Bottom
    standard_crop = (50, 150, 825, 1100)

    # Diagram 1: Page 50 - Playing Area
    crop_diagram(
        f"{base_dir}/page-50.png",
        f"{output_dir}/diagram-1.png",
        standard_crop
    )

    # Diagram 2: Page 51 - Playing Court
    crop_diagram(
        f"{base_dir}/page-51.png",
        f"{output_dir}/diagram-2.png",
        standard_crop
    )

    # Diagram 3: Page 52 - Net Design
    crop_diagram(
        f"{base_dir}/page-52.png",
        f"{output_dir}/diagram-3.png",
        standard_crop
    )

    # Diagram 4a: Page 53
    crop_diagram(
        f"{base_dir}/page-53.png",
        f"{output_dir}/diagram-4a.png",
        standard_crop
    )

    # Diagram 4b: Page 54
    crop_diagram(
        f"{base_dir}/page-54.png",
        f"{output_dir}/diagram-4b.png",
        standard_crop
    )

    # Diagram 5: Page 55 - TOP HALF (Screen)
    # Split page 55 roughly in half
    crop_diagram(
        f"{base_dir}/page-55.png",
        f"{output_dir}/diagram-5.png",
        (50, 150, 825, 625)  # Top half
    )

    # Diagram 6: Page 55 - BOTTOM HALF (Completed Block)
    crop_diagram(
        f"{base_dir}/page-55.png",
        f"{output_dir}/diagram-6.png",
        (50, 625, 825, 1100)  # Bottom half
    )

    # Diagram 7: Already implemented as tables, skip

    # Diagram 8: Page 57 - Location of Refereeing Team
    crop_diagram(
        f"{base_dir}/page-57.png",
        f"{output_dir}/diagram-8.png",
        standard_crop
    )

    # Diagram 9: Pages 58-65 - Hand Signals (multiple pages)
    for page in range(58, 66):
        crop_diagram(
            f"{base_dir}/page-{page}.png",
            f"{output_dir}/diagram-9-page-{page}.png",
            standard_crop
        )

    # Diagram 10: Pages 66-67 - Line Judge Signals
    for page in range(66, 68):
        crop_diagram(
            f"{base_dir}/page-{page}.png",
            f"{output_dir}/diagram-10-page-{page}.png",
            standard_crop
        )

    print("\nDone! Note: Crop boxes are estimates. You may need to adjust them manually.")

if __name__ == "__main__":
    main()

