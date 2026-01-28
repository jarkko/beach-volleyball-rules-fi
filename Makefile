# Makefile for building Beach Volleyball Rules documents with Pandoc

PANDOC = pandoc
LATEX_ENGINE = xelatex
SOURCES = src-rules/rules-combined.md src-rules/guidelines-combined.md src-rules/casebook-combined.md
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
		--resource-path=.:src-rules \
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
		--resource-path=.:src-rules \
		--template=$(HTML_TEMPLATE) \
		--lua-filter=$(FILTERS) \
		--standalone \
		--css=assets/styles/html-margin-refs.css \
		--output=$@

# Markdown is the authoritative source on main.

# Combine main files with includes
combine: src-rules/rules-combined.md src-rules/guidelines-combined.md src-rules/casebook-combined.md

RULES_MD_SOURCES = $(filter-out src-rules/%-combined.md,$(wildcard src-rules/*.md))
GUIDELINES_MD_SOURCES = $(filter-out src-rules/guidelines-combined.md,$(wildcard src-rules/guidelines/*.md))

src-rules/rules-combined.md: src-rules/rules.md $(RULES_MD_SOURCES)
	python3 scripts/combine_includes.py $< $@

src-rules/guidelines-combined.md: src-rules/guidelines/guidelines.md $(GUIDELINES_MD_SOURCES)
	python3 scripts/combine_includes.py $< $@

src-rules/casebook-combined.md: src-rules/casebook/casebook.md $(wildcard src-rules/casebook/*.md)
	python3 scripts/combine_includes.py $< $@

refresh-docs: combine
	cp src-rules/chapter-1.md docs/beach/rules/chapter-1.md
	cp src-rules/chapter-2.md docs/beach/rules/chapter-2.md
	cp src-rules/chapter-3.md docs/beach/rules/chapter-3.md
	cp src-rules/chapter-4.md docs/beach/rules/chapter-4.md
	cp src-rules/chapter-5.md docs/beach/rules/chapter-5.md
	cp src-rules/chapter-6.md docs/beach/rules/chapter-6.md
	cp src-rules/chapter-7.md docs/beach/rules/chapter-7-8.md
	cp src-rules/guidelines-combined.md docs/beach/guidelines/index.md
	cp src-rules/casebook-combined.md docs/beach/casebook/index.md

check-untranslated:
	python3 scripts/check_untranslated_content.py

clean:
	rm -rf output
	rm -f src-rules/*-combined.md

test:
	@echo "Testing Pandoc setup..."
	@which $(PANDOC) || (echo "Error: pandoc not found" && exit 1)
	@which $(LATEX_ENGINE) || (echo "Error: $(LATEX_ENGINE) not found" && exit 1)
	@echo "Pandoc setup OK"

# Copy generated outputs into docs/ so branch-based GitHub Pages (Source: /docs)
# serves them from the site root as /saannot.pdf etc.
.PHONY: docs-artifacts
docs-artifacts: pdf html
	@mkdir -p docs
	cp output/rules-combined.pdf docs/saannot.pdf
	cp output/guidelines-combined.pdf docs/tuomariohjeet.pdf
	cp output/casebook-combined.pdf docs/tapausesimerkit.pdf
	cp output/rules-combined.html docs/saannot.html
	cp output/guidelines-combined.html docs/tuomariohjeet.html
	cp output/casebook-combined.html docs/tapausesimerkit.html
