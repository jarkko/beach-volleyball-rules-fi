# Makefile for building Beach Volleyball Rules documents with Pandoc

PANDOC = pandoc
LATEX_ENGINE = xelatex
SOURCES = $(wildcard src-rules/*.md)
PDF_OUTPUTS = $(SOURCES:src-rules/%.md=output/%.pdf)
HTML_OUTPUTS = $(SOURCES:src-rules/%.md=output/%.html)

# Filters
FILTERS = filters/margin-refs.lua filters/rules-blocks.lua

# Templates
PDF_TEMPLATE = templates/pdf-template.tex
HTML_TEMPLATE = templates/html-template.html

.PHONY: all pdf html clean test

all: pdf html

pdf: $(PDF_OUTPUTS)

html: $(HTML_OUTPUTS)

# Build PDF from Markdown
output/%.pdf: src-rules/%.md
	@mkdir -p output
	$(PANDOC) $< \
		-f markdown+smart+raw_html \
		-t pdf \
		--pdf-engine=$(LATEX_ENGINE) \
		--template=$(PDF_TEMPLATE) \
		--lua-filter=$(FILTERS) \
		--output=$@ \
		--variable=geometry:margin=2.5cm,right=5cm,top=2.5cm,bottom=2.5cm

# Build HTML from Markdown
output/%.html: src-rules/%.md
	@mkdir -p output
	$(PANDOC) $< \
		-f markdown+smart+raw_html \
		-t html5 \
		--template=$(HTML_TEMPLATE) \
		--lua-filter=$(FILTERS) \
		--standalone \
		--css=styles/html-margin-refs.css \
		--output=$@

# Convert Typst to Markdown (individual files)
convert: $(wildcard src-rules/*.md src-rules/*/*.md)

src-rules/%.md: src/%.typ
	@mkdir -p $(dir $@)
	python3 scripts/convert_typst_to_markdown.py $< $@

src-rules/%/%.md: src/%/%.typ
	@mkdir -p $(dir $@)
	python3 scripts/convert_typst_to_markdown.py $< $@

# Combine main files with includes
combine: src-rules/rules-combined.md src-rules/guidelines-combined.md src-rules/casebook-combined.md

src-rules/rules-combined.md: src-rules/rules.md
	python3 scripts/combine_includes.py $< $@

src-rules/guidelines-combined.md: src-rules/guidelines/guidelines.md
	python3 scripts/combine_includes.py $< $@

src-rules/casebook-combined.md: src-rules/casebook/casebook.md
	python3 scripts/combine_includes.py $< $@

clean:
	rm -rf output
	rm -f src-rules/*.md src-rules/*-combined.md
	rm -f src-rules/*/*.md

test:
	@echo "Testing Pandoc setup..."
	@which $(PANDOC) || (echo "Error: pandoc not found" && exit 1)
	@which $(LATEX_ENGINE) || (echo "Error: $(LATEX_ENGINE) not found" && exit 1)
	@echo "Pandoc setup OK"


