
// Global styling for all table cells in diagrams: left-aligned, no justification
#show table.cell: it => {
  set par(justify: false)
  align(left)[it]
}

# OSA 2 - JAKSO 3: KAAVIOT

[diagram,number="1",title="PELIALUE"]
====

  Liittyvät säännöt: 1, 22.1, 23.1, 26.1, 27.1, 28.1

  ![Image](../assets/images/rules_diagrams/diagram-1.png)

====

[diagram,number="2",title="PELIKENTTÄ"]
====

  Liittyvät säännöt: 1.1, 1.3, 2.5

  ![Image](../assets/images/rules_diagrams/diagram-2.png)

====

[diagram,number="3",title="VERKON RAKENNE"]
====

  Liittyvät säännöt: 2, 8.4.3

  ![Image](../assets/images/rules_diagrams/diagram-3.png)

====

[diagram,number="4a",title="PALLO YLITTÄÄ VERKON PYSTYTASON VASTUSTAJAN KENTÄLLE"]
====

  Liittyvät säännöt: 8.4.3, 8.4.4, 8.4.5, 10.1.1, 10.1.3, 23.3.2.4, 28.2.1.3, 28.2.1.7 #label("rule-D4")

  ![Image](../assets/images/rules_diagrams/diagram-4a.png)

====

[diagram,number="4b",title="PALLO YLITTÄÄ VERKON PYSTYTASON VASTUSTAJAN VAPAA-ALUEELLE"]
====

  Liittyvät säännöt: 10.1.2, 10.1.2.1, 10.1.2.2

  ![Image](../assets/images/rules_diagrams/diagram-4b.png)

====

[diagram,number="5",title="PEITTÄMINEN"]
====

  Liittyvät säännöt: 12.5.1, 12.5.2, 12.6.2.3, 22.3.2.3

  ![Image](../assets/images/rules_diagrams/diagram-5.png)

====

[diagram,number="6",title="SUORITETTU TORJUNTA"]
====

  Liittyvät säännöt: 14.1.3

  ![Image](../assets/images/rules_diagrams/diagram-6.png)

====

[diagram,number="7",title="SEURAAMUKSET"]
====

  7a: KÄYTTÄYTYMISRIKKEIDEN VAROITUKSET JA RANGAISTUSASTEIKKO SEKÄ NIIDEN SEURAUKSET
  Liittyvät säännöt: 20.3, 20.4, 20.5

  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 2fr),
    [LUOKAT
====

, [TAPAHTUMA], [TEKIJÄ], [SEURAAMUS], [KORTIT], [SEURAUS],

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

[diagram,number="8",title="TUOMARISTON SIJAINTI"]
====

  Liittyvät säännöt: 3.3, 21.1, 22.1, 23.1, 26.1, 27.1, 28.1

  ![Image](../assets/images/rules_diagrams/diagram-8.png)

====

[diagram,number="9",title="TUOMARIEN VIRALLISET KÄSIMERKIT"]
====

  Liittyvät säännöt: 29.1

  ![Image](../assets/images/rules_diagrams/diagram-9-page-58.png)
  ![Image](../assets/images/rules_diagrams/diagram-9-page-59.png)
  ![Image](../assets/images/rules_diagrams/diagram-9-page-60.png)
  ![Image](../assets/images/rules_diagrams/diagram-9-page-61.png)
  ![Image](../assets/images/rules_diagrams/diagram-9-page-62.png)
  ![Image](../assets/images/rules_diagrams/diagram-9-page-63.png)
  ![Image](../assets/images/rules_diagrams/diagram-9-page-64.png)
  ![Image](../assets/images/rules_diagrams/diagram-9-page-65.png)

====

[diagram,number="10",title="RAJATUOMARIEN VIRALLISET LIPPUMERKIT"]
====

  Liittyvät säännöt: 29.2

  ![Image](../assets/images/rules_diagrams/diagram-10-page-66.png)
  ![Image](../assets/images/rules_diagrams/diagram-10-page-67.png)

====

