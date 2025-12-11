#!/usr/bin/env python3
"""
Quick terminology lookup tool for agents.

Usage:
    python3 scripts/get_term.py "Beach Volleyball"  # Look up translation
    python3 scripts/get_term.py --list  # List all terms
    python3 scripts/get_term.py --doc-names  # List document names
"""
import json
import sys
from pathlib import Path

def load_memory():
    """Load translation memory"""
    script_dir = Path(__file__).parent
    repo_root = script_dir.parent
    memory_path = repo_root / "data" / "memory.json"
    
    with open(memory_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def lookup_term(query, terms):
    """Find matching terms (case-insensitive partial match)"""
    query_lower = query.lower()
    matches = []
    
    for en, fi in terms.items():
        if query_lower in en.lower() or query_lower in fi.lower():
            matches.append((en, fi))
    
    return matches

def main():
    memory = load_memory()
    terms = memory.get("terms", {})
    phrases = memory.get("phrases", {})
    
    if len(sys.argv) > 1:
        arg = sys.argv[1]
        
        if arg == "--list":
            print("All terms:")
            for en, fi in sorted(terms.items()):
                print(f"  {en} → {fi}")
            sys.exit(0)
        
        if arg == "--doc-names":
            print("Document names:")
            doc_terms = {
                "Refereeing Guidelines and Instructions": terms.get("Refereeing Guidelines and Instructions"),
                "Casebook": terms.get("Casebook"),
                "Official Beach Volleyball Rules": terms.get("Official Beach Volleyball Rules"),
            }
            for en, fi in doc_terms.items():
                if fi:
                    print(f"  {en}")
                    print(f"    → {fi}")
            sys.exit(0)
        
        # Lookup
        matches = lookup_term(arg, terms)
        if matches:
            print(f"Matches for '{arg}':")
            for en, fi in matches:
                print(f"  {en} → {fi}")
        else:
            print(f"No matches found for '{arg}'")
            print("\nUse --list to see all terms, or --doc-names for document names")
            sys.exit(1)
    else:
        print("Usage: get_term.py <term> | --list | --doc-names")
        sys.exit(1)

if __name__ == "__main__":
    main()
