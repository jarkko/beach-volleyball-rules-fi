# Beach Volleyball Rules - Finnish Translation / Beach volleyn sääntöjen suomennos

**English** | [Suomeksi](#suomi)

---

## English

Official Finnish translation of the FIVB Beach Volleyball Rules 2025-2028, Refereeing Guidelines, and Casebook.

### Generated Documents

The compiled documents are published on GitHub Pages:

**PDFs:**

- [saannot.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/docs/saannot.pdf) - Official Beach Volleyball Rules 2025-2028
- [tuomariohjeet.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/docs/tuomariohjeet.pdf) - Refereeing Guidelines and Instructions
- [tapausesimerkit.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/docs/tapausesimerkit.pdf) - Casebook

**Single-page HTML (Pandoc):**

- [saannot.html](https://jarkko.github.io/beach-volleyball-rules-fi/docs/saannot.html)
- [tuomariohjeet.html](https://jarkko.github.io/beach-volleyball-rules-fi/docs/tuomariohjeet.html)
- [tapausesimerkit.html](https://jarkko.github.io/beach-volleyball-rules-fi/docs/tapausesimerkit.html)

**HTML Documentation (automatically published to GitHub Pages via MkDocs):**

- [Documentation Site](https://jarkko.github.io/beach-volleyball-rules-fi/docs/)

### Structure

- `src-rules/` - Authoritative Markdown sources
- `docs/` - MkDocs site content (refreshed from src-rules)
- `documents/` - Source PDFs (English and Finnish indoor volleyball for reference)
- `scripts/` - Utility scripts for extraction, translation, and image processing
- `data/` - Translation memory and learning corpus
- `src-rules/assets/` - Images and diagrams extracted from source documents

### Building

The documents are built from Markdown sources using Pandoc.

```bash
make combine
make pdf
make html
```

HTML documentation is also available via [MkDocs](https://www.mkdocs.org/) from the `docs/` directory.

**Automatic Publishing:** The documents are built and published to GitHub Pages on each push to the `main` branch.

### Translation Workflow

This project uses a learning-based translation approach:

- Terminology is maintained in `data/memory.json`
- Finnish indoor volleyball rules are used as a reference corpus for idiomatic Finnish
- Scripts in `scripts/` help extract and scaffold content from source PDFs

**Automatic Terminology Enforcement:** This project uses [Vale](https://vale.sh/) to automatically check terminology consistency. Vale rules are automatically generated from `data/memory.json`.

**For AI Agents/Editors:** Before editing Finnish text, ALWAYS:

1. Look up terms: `python3 scripts/get_term.py <term>` or `--doc-names` for document names
2. Validate text: `python3 scripts/validate_terminology.py <text_or_file>`
3. Run Vale: `vale README.md docs/` after editing

To regenerate Vale rules after updating the memory file:

```bash
python3 scripts/generate_vale_vocab.py
vale README.md docs/
```

### License

This translation is based on the official FIVB Beach Volleyball Rules and related documents. Please refer to FIVB for official rules and regulations.

---

## Suomi

Virallinen suomennos FIVB:n beach volleyn säännöistä 2025-2028, tuomariohjeista ja tapausesimerkeistä.

### Julkaistut dokumentit

Käännettyjä dokumentteja on saatavilla GitHub Pagesissa:

**PDF-tiedostot:**

- [saannot.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/docs/saannot.pdf) - Viralliset beach volleyn säännöt 2025-2028
- [tuomariohjeet.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/docs/tuomariohjeet.pdf) - Beach volleyn tuomariohjeet ja -ohjeistukset
- [tapausesimerkit.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/docs/tapausesimerkit.pdf) - Beach volleyn tapausesimerkit 2025

**HTML-dokumentaatio (julkaistaan automaattisesti GitHub Pagesiin MkDocs:lla):**

- [Dokumentaatiosivusto](https://jarkko.github.io/beach-volleyball-rules-fi/docs/)

### Rakenne

- `src/rules/` - Viralliset beach volleyn säännöt
- `src/guidelines/` - Beach volleyn tuomariohjeet ja -ohjeistukset
- `src/casebook/` - Beach volleyn tapausesimerkit
- `documents/` - Lähde-PDF-tiedostot (englanninkieliset ja suomenkieliset viralliset lentopallon säännöt viitteeksi)
- `scripts/` - Apuohjelmien skriptit sisällön poimimiseen, kääntämiseen ja kuvien käsittelyyn
- `data/` - Käännösmuisti ja oppimiskorpus
- `src-rules/assets/` - Lähdedokumenteista poimitut kuvat ja diagrammit

### Kääntäminen

Dokumentit rakennetaan Markdown-lähteistä Pandocilla.

```bash
make combine
make pdf
make html
```

HTML-dokumentaatio on saatavilla myös [MkDocs](https://www.mkdocs.org/):n kautta `docs/`-kansiosta.

**Automaattinen julkaisu:** Dokumentit rakennetaan ja julkaistaan GitHub Pagesiin jokaisella `main`-haaraan tehdyssä push-operaatiossa.

### Käännösprosessi

Tämä projekti käyttää oppimispohjaista käännöstapaa:

- Terminologia ylläpidetään tiedostossa `data/memory.json`
- Suomenkielisiä lentopallon sääntöjä käytetään viitekorpuksena idiomaattiselle suomelle
- `scripts/`-kansiossa olevat skriptit auttavat sisällön poiminnassa ja käsittelyssä

**Automaattinen terminologian valvonta:** Projekti käyttää [Vale](https://vale.sh/)-työkalua terminologian yhdenmukaisuuden automaattiseen tarkistamiseen. Vale-säännöt luodaan automaattisesti `data/memory.json`-tiedostosta.

**AI-agenttien/editorien käyttöön:** Ennen suomenkielisen tekstin muokkaamista, AINA:

1. Tarkista termit: `python3 scripts/get_term.py <termi>` tai `--doc-names` dokumenttien nimille
2. Validoi teksti: `python3 scripts/validate_terminology.py <teksti_tai_tiedosto>`
3. Muokkauksen jälkeen tarkista Vale:llä: `vale README.md docs/`

Vale-säännöt voidaan luoda uudelleen päivittämällä muistitiedosto:

```bash
python3 scripts/generate_vale_vocab.py
vale README.md docs/
```

### Lisenssi

Tämä käännös perustuu virallisiin FIVB:n beach volleyn sääntöihin ja niihin liittyviin dokumentteihin. Katso FIVB:n viralliset säännöt ja määräykset.
