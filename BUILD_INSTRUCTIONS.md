# Build Instructions for Pandoc-Based Document Generation

This document explains how to build the Beach Volleyball Rules documents using the new Pandoc-based system.

## Prerequisites

1. **Pandoc** (version 2.19 or later recommended)
   - macOS: `brew install pandoc`
   - Linux: Install via package manager (e.g., `apt-get install pandoc`)
   - Windows: Download from https://pandoc.org/installing.html

2. **XeLaTeX** (for PDF generation)
   - macOS: Install MacTeX or BasicTeX (`brew install --cask basictex`)
   - Linux: `apt-get install texlive-xetex texlive-fonts-recommended`
   - Windows: Install MiKTeX or TeX Live

3. **Python 3** (for conversion scripts)
   - Should already be installed on most systems

## Building Documents

### Step 1: Combine Includes

Combine main files with their included chapters:

```bash
# Combine all main files
make combine

# This creates:
# - src-rules/rules-combined.md
# - src-rules/guidelines-combined.md
# - src-rules/casebook-combined.md
```

### Step 2: Build PDFs

Build PDFs from the combined Markdown files:

```bash
# Build all PDFs
make pdf

# Or build a specific one:
pandoc src-rules/rules-combined.md \
  -f markdown+smart+raw_html \
  -t pdf \
  --pdf-engine=xelatex \
  --template=templates/pdf-template.tex \
  --lua-filter=filters/margin-refs.lua \
  --lua-filter=filters/rules-blocks.lua \
  --output=output/saannot.pdf \
  --variable=geometry:margin=2.5cm,right=5cm
```

### Step 3: Build HTML

Build HTML from the combined Markdown files:

```bash
# Build all HTML files
make html

# Or build a specific one:
pandoc src-rules/rules-combined.md \
  -f markdown+smart+raw_html \
  -t html5 \
  --template=templates/html-template.html \
  --lua-filter=filters/margin-refs.lua \
  --lua-filter=filters/rules-blocks.lua \
  --standalone \
  --css=styles/html-margin-refs.css \
  --output=output/saannot.html
```

## File Structure

- `src-rules/` - Markdown source files
- `src-rules/*-combined.md` - Combined files ready for building
- `output/` - Generated PDF and HTML files
- `filters/` - Pandoc Lua filters for custom blocks
- `templates/` - LaTeX and HTML templates

## Custom Blocks

The conversion script translates Typst functions to AsciiDoc-style blocks:

- `#rule("1", "TITLE")[...]` → `[rule,number="1",title="TITLE"]\n====\n...\n====`
- `#subrule("1.1", "TITLE")[...]` → `[subrule,number="1.1",title="TITLE"]\n====\n...\n====`
- `#r("1.1.1")[...]` → `1.1.1 ...`
- `#refs("1.1", "D1")` → `{.refs data-refs="1.1,D1"}`
- `#diagram("D1", "TITLE")[...]` → `[diagram,number="D1",title="TITLE"]\n====\n...\n====`

The Lua filters then convert these blocks to appropriate LaTeX/HTML output.

## Troubleshooting

### Pandoc not found

- Install Pandoc using your system's package manager
- Verify with: `pandoc --version`

### XeLaTeX not found

- Install a TeX distribution (MacTeX, TeX Live, or MiKTeX)
- Verify with: `xelatex --version`

### Font issues in PDF

- Ensure system fonts are accessible
- The template uses Helvetica/Liberation Sans/DejaVu Sans

### Filter errors

- Check that Lua filters are in the `filters/` directory
- Verify filter syntax with: `pandoc --lua-filter=filters/margin-refs.lua --help`
