# Agent Guidelines - Terminology Enforcement

**⚠️ CRITICAL: Read this before editing any Finnish text in this repository**

## The Problem

Agents often create incorrect translations because they don't check the corpus first. This leads to inconsistencies like:
- Using "Tapauskirja" instead of "Beach volleyn tapausesimerkit"
- Using "Beach Volley" instead of "beach volley" (lowercase)
- Using made-up translations instead of corpus-approved terms

## The Solution

This repository now has **automatic terminology validation** that agents MUST use.

## Mandatory Workflow for Agents

### Before Editing Finnish Text:

1. **Look up terminology first:**
   ```bash
   # Check a specific term
   python3 scripts/get_term.py "Beach Volleyball"
   
   # Get all document names (critical!)
   python3 scripts/get_term.py --doc-names
   
   # List all terms
   python3 scripts/get_term.py --list
   ```

2. **Validate proposed text BEFORE writing:**
   ```bash
   # Validate text string
   echo "Tapauskirja" | python3 scripts/validate_terminology.py
   
   # Validate a file
   python3 scripts/validate_terminology.py README.md
   ```

3. **After editing, verify with Vale:**
   ```bash
   vale README.md docs/
   ```

## Critical Document Names

These are the EXACT forms that must be used (from corpus):

- ✅ "viralliset beach volleyn säännöt 2025-2028"
- ✅ "Beach volleyn tuomariohjeet ja -ohjeistukset"
- ✅ "Beach volleyn tapausesimerkit 2025"
- ✅ "beach volley" (always lowercase, except at start of sentence)

## What Happens Automatically

1. **Pre-commit hooks** (if installed): Validate terminology before commits
2. **CI/CD**: Vale runs automatically on every push
3. **Vale rules**: Generated automatically from `data/memory.json`

## Source of Truth

- **`data/memory.json`** - All approved terminology
- **`corpus/finnish/`** - Reference corpus showing correct usage
- **`styles/BeachVolley/FinnishDocNames.yml`** - Vale rules for document names

## Quick Reference

```bash
# Look up a term
python3 scripts/get_term.py "Refereeing Guidelines"

# Check document names  
python3 scripts/get_term.py --doc-names

# Validate before committing
python3 scripts/validate_terminology.py <file>

# Run full Vale check
vale README.md docs/
```

## Files Created for Agents

- **`.cursorrules`** - Instructions for Cursor AI
- **`scripts/get_term.py`** - Quick terminology lookup
- **`scripts/validate_terminology.py`** - Validate text before writing
- **`.pre-commit-config.yaml`** - Pre-commit hooks (install with `pre-commit install`)

## Integration with Editors

If using Cursor or similar AI-powered editors, the `.cursorrules` file provides context. For other editors, agents should:

1. Always read `.cursorrules` or `AGENT_GUIDELINES.md` first
2. Use `get_term.py` for every translation decision
3. Validate with `validate_terminology.py` before writing files
4. Run Vale after edits to catch any missed issues

## Example: Correct Workflow

```bash
# Agent wants to write "Beach volleyn tuomariohjeet ja -ohjeistukset"

# Step 1: Look it up
python3 scripts/get_term.py "Refereeing Guidelines"
# Output: Refereeing Guidelines and Instructions → Beach volleyn tuomariohjeet ja -ohjeistukset

# Step 2: Validate the text
echo "Beach volleyn tuomariohjeet ja -ohjeistukset" | python3 scripts/validate_terminology.py
# Output: ✅ No terminology violations found

# Step 3: Make the edit (now safe)

# Step 4: Final check
vale README.md
# Output: ✔ 0 errors
```

## Remember

**Never translate on the fly. Always check the corpus first.**
