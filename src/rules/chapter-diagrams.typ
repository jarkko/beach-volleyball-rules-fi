#import "../lib/utils.typ": *

// Global styling for all table cells in diagrams: left-aligned, no justification
#show table.cell: it => {
  set par(justify: false)
  align(left)[it]
}

= OSA 2 - JAKSO 3: KAAVIOT

#diagram("1", "PELIALUE")[
  Liittyvät säännöt: 1, 22.1, 23.1, 26.1, 27.1, 28.1

  #image("../assets/images/rules_diagrams/diagram-1.png", width: 95%)
]

#diagram("2", "PELIKENTTÄ")[
  Liittyvät säännöt: 1.1, 1.3, 2.5

  #image("../assets/images/rules_diagrams/diagram-2.png", width: 95%)
]

#diagram("3", "VERKON RAKENNE")[
  Liittyvät säännöt: 2, 8.4.3

  #image("../assets/images/rules_diagrams/diagram-3.png", width: 95%)
]

#diagram("4a", "PALLO YLITTÄÄ VERKON PYSTYTASON VASTUSTAJAN KENTÄLLE")[
  Liittyvät säännöt: 8.4.3, 8.4.4, 8.4.5, 10.1.1, 10.1.3, 23.3.2.4, 28.2.1.3, 28.2.1.7 #label("rule-D4")

  #image("../assets/images/rules_diagrams/diagram-4a.png", width: 95%)
]

#diagram("4b", "PALLO YLITTÄÄ VERKON PYSTYTASON VASTUSTAJAN VAPAA-ALUEELLE")[
  Liittyvät säännöt: 10.1.2, 10.1.2.1, 10.1.2.2

  #image("../assets/images/rules_diagrams/diagram-4b.png", width: 95%)
]

#diagram("5", "PEITTÄMINEN")[
  Liittyvät säännöt: 12.5.1, 12.5.2, 12.6.2.3, 22.3.2.3

  #image("../assets/images/rules_diagrams/diagram-5.png", width: 95%)
]

#diagram("6", "SUORITETTU TORJUNTA")[
  Liittyvät säännöt: 14.1.3

  #image("../assets/images/rules_diagrams/diagram-6.png", width: 95%)
]

#diagram("7", "SEURAAMUKSET")[
  7a: KÄYTTÄYTYMISRIKKEIDEN VAROITUKSET JA RANGAISTUSASTEIKKO SEKÄ NIIDEN SEURAUKSET
  Liittyvät säännöt: 20.3, 20.4, 20.5

  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 2fr),
    [LUOKAT], [TAPAHTUMA], [TEKIJÄ], [SEURAAMUS], [KORTIT], [SEURAUS],

    table.cell(colspan: 6, fill: luma(240))[*LIEVÄT RIKKEET*],

    [Vaihe 1], [Mikä tahansa], [Kuka tahansa], [Ei rangaistusta], [Ei korttia], [Vain ennaltaehkäisy],
    [Vaihe 2], [Toistaminen], [Kuka tahansa], [Varoitus (Huomautus)], [Keltainen], [Varoitus, ei rangaistusta],

    table.cell(colspan: 6, fill: luma(240))[*RANGAISTAVAT RIKKEET*],

    [*RÄIKEÄ KÄYTÖS*\ (samassa erässä)],
    [Ensimmäinen],
    [Kuka tahansa],
    [Rangaistus],
    [Punainen],
    [Piste ja aloitus vastustajalle],
    [], [Toinen], [Sama pelaaja], [Rangaistus], [Punainen], [Piste ja aloitus vastustajalle],
    [], [Kolmas], [Sama pelaaja], [Erästä poistaminen], [Pun + Kelt\ yhdessä], [Joukkue vajaa erän ajaksi],

    [*RÄIKEÄ KÄYTÖS*\ (uusi erä)],
    [Ensimmäinen],
    [Kuka tahansa],
    [Rangaistus],
    [Punainen],
    [Piste ja aloitus vastustajalle],

    [*LOUKKAAVA KÄYTÖS*],
    [Ensimmäinen],
    [Kuka tahansa],
    [Erästä poistaminen],
    [Pun + Kelt\ yhdessä],
    [Joukkue vajaa erän ajaksi],
    [], [Toinen], [Sama pelaaja], [Ottelusta poistaminen], [Pun + Kelt\ erillään], [Joukkue vajaa ottelun ajaksi],

    [*VÄKIVALTAINEN KÄYTÖS*],
    [Ensimmäinen],
    [Kuka tahansa],
    [Ottelusta poistaminen],
    [Pun + Kelt\ erillään],
    [Joukkue vajaa ottelun ajaksi],
  )

  #v(1em)

  7b: VIIVYTYSSEURAAMUSASTEIKKO JA SEURAUKSET
  Liittyvät säännöt: 16.2.2, 16.2.3

  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 2fr),
    [LUOKAT], [TAPAHTUMA], [TEKIJÄ], [SEURAAMUS], [KORTIT], [SEURAUS],

    [*VIIVYTYS*],
    [Ensimmäinen],
    [Kuka tahansa],
    [Viivytysvaroitus],
    [Kelt. kortti ranteessa],
    [Ennaltaehkäisy - ei rangaistusta],

    [],
    [Toinen ja seuraavat],
    [Kuka tahansa],
    [Viivytysrangaistus],
    [Pun. kortti ranteessa],
    [Piste ja aloitus vastustajalle],
  )
]

#diagram("8", "TUOMARISTON SIJAINTI")[
  Liittyvät säännöt: 3.3, 21.1, 22.1, 23.1, 26.1, 27.1, 28.1

  #image("../assets/images/rules_diagrams/diagram-8.png", width: 95%)
]

#diagram("9", "TUOMARIEN VIRALLISET KÄSIMERKIT")[
  Liittyvät säännöt: 29.1

  #image("../assets/images/rules_diagrams/diagram-9-page-58.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-9-page-59.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-9-page-60.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-9-page-61.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-9-page-62.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-9-page-63.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-9-page-64.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-9-page-65.png", width: 95%)
]

#diagram("10", "RAJATUOMARIEN VIRALLISET LIPPUMERKIT")[
  Liittyvät säännöt: 29.2

  #image("../assets/images/rules_diagrams/diagram-10-page-66.png", width: 95%)
  #image("../assets/images/rules_diagrams/diagram-10-page-67.png", width: 95%)
]
