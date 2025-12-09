import json
import os
import yaml

def generate_vale_rules(memory_path, styles_dir):
    with open(memory_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
        memory = data.get("terms", {})
    
    # 1. Create a Terminology Rule (English -> Finnish suggestion)
    # This detects if an English source term is left in the text
    
    # We want to match whole words, case-insensitive
    # Rule: BeachVolley/Terms.yml
    
    terms_rule = {
        "extends": "substitution",
        "message": "Use '%s' instead of '%s'",
        "level": "error",
        "ignorecase": True,
        "swap": {}
    }
    
    # Populate swap: "English Term" : "Finnish Term"
    
    for en, fi in memory.items():
        if en and fi and len(en) > 3: # Ignore short words to avoid false positives
            terms_rule["swap"][en] = fi
            
    # Write rule file
    rule_path = os.path.join(styles_dir, "BeachVolley", "EnglishTerms.yml")
    os.makedirs(os.path.dirname(rule_path), exist_ok=True)
    
    with open(rule_path, 'w', encoding='utf-8') as f:
        yaml.dump(terms_rule, f, sort_keys=True)
        
    print(f"Generated Vale rules at {rule_path}")

if __name__ == "__main__":
    generate_vale_rules("data/memory.json", "styles")

