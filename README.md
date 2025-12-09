# Beach Volleyball Rules - Finnish Translation

Official Finnish translation of the FIVB Beach Volleyball Rules 2025-2028, Refereeing Guidelines, and Casebook.

## Generated Documents

The compiled documents are available in this repository and on [GitHub Pages](https://jarkko.github.io/beach-volleyball-rules-fi/):

**PDFs:**
- [`rules.pdf`](rules.pdf) - Viralliset beach volleyn säännöt 2025-2028
- [`guidelines.pdf`](guidelines.pdf) - Beach volleyn tuomariohjeet ja -ohjeistukset
- [`casebook.pdf`](casebook.pdf) - Beach volleyn tapausesimerkit 2025

**HTML (automatically published to GitHub Pages on each push):**
- [Rules (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/rules.html)
- [Guidelines (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/guidelines.html)
- [Casebook (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/casebook.html)

## Structure

- `src/rules/` - Official Beach Volleyball Rules (Viralliset beach volleyn säännöt)
- `src/guidelines/` - Refereeing Guidelines and Instructions (Tuomariohjeet ja -ohjeistukset)
- `src/casebook/` - Illustrated Casebook (Tapausesimerkit)
- `documents/` - Source PDFs (English and Finnish indoor volleyball for reference)
- `scripts/` - Utility scripts for extraction, translation, and image processing
- `data/` - Translation memory and learning corpus
- `src/assets/` - Images and diagrams extracted from source documents

## Building

The documents are written in [Typst](https://typst.app/). To compile to PDF:

```bash
typst compile src/rules.typ rules.pdf
typst compile src/guidelines.typ guidelines.pdf
typst compile src/casebook.typ casebook.pdf
```

To compile to HTML:

```bash
typst compile --format html src/rules.typ rules.html
typst compile --format html src/guidelines.typ guidelines.html
typst compile --format html src/casebook.typ casebook.html
```

**Automatic Publishing:** The documents are automatically compiled to both PDF and HTML and published to GitHub Pages on each push to the `main` branch.

## Translation Workflow

This project uses a learning-based translation approach:
- Terminology is maintained in `data/memory.json`
- Finnish indoor volleyball rules are used as a reference corpus for idiomatic Finnish
- Scripts in `scripts/` help extract and scaffold content from source PDFs

## License

This translation is based on the official FIVB Beach Volleyball Rules and related documents. Please refer to FIVB for official rules and regulations.
