import os
from PIL import Image

def convert_images(directory):
    print(f"Converting images in {directory}...")
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)
        name, ext = os.path.splitext(filename)
        ext = ext.lower()

        if ext in ['.jp2', '.tif', '.tiff']:
            try:
                with Image.open(filepath) as img:
                    if img.mode == 'CMYK':
                        img = img.convert('RGB')

                    new_filepath = os.path.join(directory, name + ".png")
                    img.save(new_filepath, "PNG")
                    print(f"  Converted {filename} to {name}.png")
                # Optional: remove original file
                # os.remove(filepath)
            except Exception as e:
                print(f"  Failed to convert {filename}: {e}")

def main():
    dirs = [
        "src/assets/images/rules",
        "src/assets/images/guidelines",
        "src/assets/images/casebook"
    ]

    for d in dirs:
        if os.path.exists(d):
            convert_images(d)

if __name__ == "__main__":
    main()
