import sys
from translator import Translator

def teach(source, target):
    translator = Translator(
        "data/memory.json",
        None, None # Corpus not needed for teaching
    )
    translator.update_memory(source, target)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python teach.py 'english term' 'finnish translation'")
    else:
        source = sys.argv[1]
        target = sys.argv[2]
        teach(source, target)

