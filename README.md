# Beach Volleyball Rules - Finnish Translation / Beach volleyn sääntöjen suomennos

**English** | [Suomeksi](#suomi)

---

## English

Official Finnish translation of the FIVB Beach Volleyball Rules 2025-2028, Refereeing Guidelines, and Casebook.

### Generated Documents

The compiled documents are available in this repository and on [GitHub Pages](https://jarkko.github.io/beach-volleyball-rules-fi/):

**PDFs:**
- [saannot.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/saannot.pdf) - Official Beach Volleyball Rules 2025-2028
- [tuomariohjeet.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/tuomariohjeet.pdf) - Refereeing Guidelines and Instructions
- [tapausesimerkit.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/tapausesimerkit.pdf) - Casebook

**HTML (automatically published to GitHub Pages on each push):**
- [Rules (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/saannot.html)
- [Guidelines (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/tuomariohjeet.html)
- [Casebook (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/tapausesimerkit.html)

### Structure

- `src/rules/` - Official Beach Volleyball Rules
- `src/guidelines/` - Refereeing Guidelines and Instructions
- `src/casebook/` - Casebook
- `documents/` - Source PDFs (English and Finnish indoor volleyball for reference)
- `scripts/` - Utility scripts for extraction, translation, and image processing
- `data/` - Translation memory and learning corpus
- `src/assets/` - Images and diagrams extracted from source documents

### Building

The documents are written in [Typst](https://typst.app/). To compile to PDF:

```bash
typst compile src/rules.typ saannot.pdf
typst compile src/guidelines.typ tuomariohjeet.pdf
typst compile src/casebook.typ tapausesimerkit.pdf
```

To compile to HTML (experimental feature):

```bash
typst compile --format html --features html src/rules.typ saannot.html
typst compile --format html --features html src/guidelines.typ tuomariohjeet.html
typst compile --format html --features html src/casebook.typ tapausesimerkit.html
```

**Automatic Publishing:** The documents are automatically compiled to both PDF and HTML and published to GitHub Pages on each push to the `main` branch.

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

Käännettyjä dokumentteja on saatavilla tässä repositoriossa ja [GitHub Pagesissa](https://jarkko.github.io/beach-volleyball-rules-fi/):

**PDF-tiedostot:**
- [saannot.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/saannot.pdf) - Viralliset beach volleyn säännöt 2025-2028
- [tuomariohjeet.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/tuomariohjeet.pdf) - Beach volleyn tuomariohjeet ja -ohjeistukset
- [tapausesimerkit.pdf](https://jarkko.github.io/beach-volleyball-rules-fi/tapausesimerkit.pdf) - Beach volleyn tapausesimerkit 2025

**HTML (julkaistaan automaattisesti GitHub Pagesiin jokaisella push-operaatiolla):**
- [Säännöt (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/saannot.html)
- [Tuomariohjeet (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/tuomariohjeet.html)
- [Beach volleyn tapausesimerkit (HTML)](https://jarkko.github.io/beach-volleyball-rules-fi/tapausesimerkit.html)

### Rakenne

- `src/rules/` - Viralliset beach volleyn säännöt
- `src/guidelines/` - Beach volleyn tuomariohjeet ja -ohjeistukset
- `src/casebook/` - Beach volleyn tapausesimerkit
- `documents/` - Lähde-PDF-tiedostot (englanninkieliset ja suomenkieliset viralliset lentopallon säännöt viitteeksi)
- `scripts/` - Apuohjelmien skriptit sisällön poimimiseen, kääntämiseen ja kuvien käsittelyyn
- `data/` - Käännösmuisti ja oppimiskorpus
- `src/assets/` - Lähdedokumenteista poimitut kuvat ja diagrammit

### Kääntäminen

Dokumentit on kirjoitettu [Typst](https://typst.app/)-muodossa. PDF-tiedostojen kääntäminen:

```bash
typst compile src/rules.typ saannot.pdf
typst compile src/guidelines.typ tuomariohjeet.pdf
typst compile src/casebook.typ tapausesimerkit.pdf
```

HTML-tiedostojen kääntäminen (kokeellinen ominaisuus):

```bash
typst compile --format html --features html src/rules.typ saannot.html
typst compile --format html --features html src/guidelines.typ tuomariohjeet.html
typst compile --format html --features html src/casebook.typ tapausesimerkit.html
```

**Automaattinen julkaisu:** Dokumentit käännetään automaattisesti sekä PDF- että HTML-muotoon ja julkaistaan GitHub Pagesiin jokaisella `main`-haaraan tehdyssä push-operaatiossa.

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
