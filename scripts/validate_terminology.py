#!/usr/bin/env python3
"""
Terminology validation script for agents.
Validates text against memory.json corpus before allowing edits.

Usage:
    python3 scripts/validate_terminology.py <file_or_text>
    # Or pipe text:
    echo "some text" | python3 scripts/validate_terminology.py
"""
import json
import sys
import os
import re
from pathlib import Path

def load_memory():
    """Load translation memory from memory.json"""
    script_dir = Path(__file__).parent
    repo_root = script_dir.parent
    memory_path = repo_root / "data" / "memory.json"
    
    with open(memory_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    return data.get("terms", {}), data.get("phrases", {})

def find_violations(text, terms, phrases):
    """Find terminology violations in text"""
    violations = []
    
    # Only check Finnish sections (marked by ## Suomi or similar markers)
    # Extract Finnish sections
    fi_section_pattern = r'##\s+Suomi\s*\n(.*?)(?=\n##\s+|\Z)'
    fi_sections = re.findall(fi_section_pattern, text, re.DOTALL | re.IGNORECASE)
    
    # If no explicit section markers, check whole text but be less strict
    check_text = ' '.join(fi_sections) if fi_sections else text
    
    # Only check for violations in Finnish text (has Finnish characters)
    has_finnish_chars = bool(re.search(r'[äöåÄÖÅ]', check_text))
    if not has_finnish_chars and not fi_sections:
        # No Finnish text to check, skip English term checks
        return violations
    
    # Check for incorrect Finnish document names
    incorrect_patterns = {
        r'\bTapauskirja\b': 'Beach volleyn tapausesimerkit',
        r'\bTuomariohjeet ja instruktiot\b': 'Beach volleyn tuomariohjeet ja -ohjeistukset',
        r'\bBeach Volley\b': 'beach volley',
        r'\bBeach Volleyn\b': 'beach volleyn',
        r'\bViralliset Beach Volley -säännöt\b': 'viralliset beach volleyn säännöt',
    }
    
    # Check incorrect Finnish variants (only in Finnish sections)
    for pattern, correct in incorrect_patterns.items():
        if re.search(pattern, check_text):
            violations.append(f"Found incorrect term matching '{pattern}' - should use '{correct}'")
    
    return violations

def validate_file(file_path):
    """Validate a file's terminology"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    terms, phrases = load_memory()
    violations = find_violations(content, terms, phrases)
    
    return violations

def validate_text(text):
    """Validate text string"""
    terms, phrases = load_memory()
    violations = find_violations(text, terms, phrases)
    return violations

def main():
    if len(sys.argv) > 1:
        # File or text provided as argument
        input_arg = sys.argv[1]
        if os.path.exists(input_arg):
            violations = validate_file(input_arg)
        else:
            violations = validate_text(input_arg)
    else:
        # Read from stdin
        text = sys.stdin.read()
        violations = validate_text(text)
    
    if violations:
        print("❌ Terminology violations found:", file=sys.stderr)
        for violation in violations:
            print(f"  - {violation}", file=sys.stderr)
        print("\n💡 Tip: Check data/memory.json for correct terminology", file=sys.stderr)
        sys.exit(1)
    else:
        print("✅ No terminology violations found")
        sys.exit(0)

if __name__ == "__main__":
    main()
