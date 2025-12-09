#import "../lib/utils.typ": *

= LUKU 5: KATKOT, VIIVYTYKSET JA ERÄTAUOT

#rule("15", "KATKOT")[
  Katko on aika, joka kuluu päättyneen pallorallin ja päätuomarin seuraavan aloitusvihellyksen välillä.

  Ainoat sääntömääräiset pelikatkot ovat AIKALISÄT.
  #refs("D9 (4)")
]

#subrule("15.1", "SÄÄNTÖMÄÄRÄISTEN PELIKATKOJEN MÄÄRÄ")[
  Kummallakin joukkueella on oikeus enintään yhteen aikalisään erässä.
]

#subrule("15.2", "SÄÄNTÖMÄÄRÄISTEN PELIKATKOJEN JÄRJESTYS")[
  #r("15.2.1")[Molempien joukkueiden aikalisäpyynnöt voivat seurata toisiaan saman katkon aikana.]

  #r("15.2.2")[Pelaajavaihtoja ei ole.]

  #r("15.2.3")[Ei ole sallittua pyytää mitään sääntömääräistä pelikatkoa sen jälkeen, kun pyyntö on hylätty ja sanktioitu viivytysvaroituksella saman katkon aikana (ts. ennen seuraavan päättyneen pallorallin loppua).]
]

#subrule("15.3", "SÄÄNTÖMÄÄRÄISTEN PELIKATKOJEN PYYTÄMINEN")[
  Sääntömääräisiä pelikatkoja saa pyytää vain kapteeni.
]

#subrule("15.4", "AIKALISÄT JA TEKNISET AIKALISÄT")[
  #r("15.4.1")[Aikalisäpyynnöt on tehtävä näyttämällä vastaavaa käsimerkkiä, kun pallo on poissa pelistä ja ennen aloitusvihellystä. Kaikki pyydetyt aikalisät kestävät 30 sekuntia.]
  #refs("D9 (4)")

  #r("15.4.2")[FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa erissä 1 ja 2 pidetään yksi ylimääräinen 30 sekunnin "tekninen aikalisä" automaattisesti, kun joukkueiden pisteiden summa on 21 pistettä. Aikalisien ja teknisten aikalisien pituutta voidaan säätää, jos FIVB hyväksyy järjestäjän pyynnön.]

  #r("15.4.3")[Ratkaisevassa (3.) erässä ei ole teknisiä aikalisä; kumpikin joukkue voi pyytää vain yhden 30 sekunnin aikalisän.]

  #r("15.4.4")[Kaikkien sääntömääräisten katkojen (mukaan lukien tekniset aikalisät) ja erätaukojen aikana pelaajien on mentävä heille osoitetulle pelaaja-alueelle.]
  #refs("15.5", "16.1")
]

#subrule("15.5", "VIRHEELLISET PYYNNÖT")[
  Aikalisän pyytäminen on virheellistä muun muassa:
  #r("15.5.1")[pallorallin aikana tai aloitusvihellyksen hetkellä tai sen jälkeen;]
  #refs("6.1.3")
  #r("15.5.2")[jos sen tekee muu kuin valtuutettu joukkueen jäsen;]
  #r("15.5.3")[sen jälkeen, kun sallitut aikalisät on käytetty.]
  #refs("15.1")

  #r("15.5.4")[Joukkueen ensimmäinen virheellinen pyyntö ottelussa, joka ei vaikuta peliin tai viivytä sitä, hylätään, mutta se on merkittävä pöytäkirjaan ilman muita seuraamuksia.]
  #refs("16.1.2", "26.2.2.4", "26.2.2.6")

  #r("15.5.5")[Mikä tahansa myöhempi virheellinen pyyntö samassa ottelussa saman joukkueen toimesta katsotaan viivytykseksi.]
  #refs("D9 (25)")
]

#rule("16", "PELIN VIIVYTTÄMINEN")[
]

#subrule("16.1", "VIIVYTYSTYYPIT")[
  Joukkueen sopimaton toiminta, joka viivyttää pelin jatkamista, on viivytystä ja sisältää muun muassa:

  #r("16.1.1")[aikalisien pitkittämisen sen jälkeen, kun on kehotettu jatkamaan peliä;]

  #r("16.1.2")[virheellisen pyynnön toistamisen;]
  #refs("15.5")

  #r("16.1.3")[pelin viivyttämisen (12 sekuntia on enimmäisaika pallorallin päättymisestä aloitusvihellykseen normaaleissa peliolosuhteissa);]

  #r("16.1.4")[pelin viivyttämisen joukkueen jäsenen toimesta.]
]

#subrule("16.2", "VIIVYTYSSEURAAMUKSET")[
  #r("16.2.1")["Viivytysvaroitus" ja "viivytysrangaistus" ovat joukkuerangaistuksia.]
  #r("16.2.1.1")[Viivytysseuraamukset pysyvät voimassa koko ottelun ajan.]
  #r("16.2.1.2")[Kaikki viivytysseuraamukset merkitään pöytäkirjaan.]

  #r("16.2.2")[Joukkueen jäsenen ensimmäisestä viivytyksestä ottelussa seuraa "VIIVYTYSVAROITUS".]
  #refs("D9 (25)", "D7b")

  #r("16.2.3")[Saman joukkueen minkä tahansa jäsenen toisesta ja seuraavista viivytyksistä samassa ottelussa (riippumatta viivytystyypistä) seuraa "VIIVYTYSRANGAISTUS": piste ja aloitus vastapuolelle.]
  #refs("D9 (25)", "D7b")

  #r("16.2.4")[Ennen erää tai erien välillä määrätyt viivytysseuraamukset sovelletaan seuraavassa erässä.]
]

#rule("17", "PELIN POIKKEUKSELLISET KESKEYTYKSET")[
]

#subrule("17.1", "LOUKKAANTUMINEN/SAIRASTUMINEN")[
  #r("17.1.1")[Jos vakava onnettomuus tapahtuu pallon ollessa pelissä, tuomarin on pysäytettävä peli välittömästi ja sallittava lääkintäavun tulo kentälle.]
  Palloralli pelataan tällöin uudelleen.

  #r("17.1.2")[Loukkaantuneelle/sairastuneelle pelaajalle annetaan enintään 5 minuuttia toipumisaikaa. Tuomarin on annettava asianmukaisesti akkreditoidulle lääkintähenkilöstölle lupa tulla pelikentälle hoitamaan pelaajaa. Vain päätuomari voi antaa pelaajalle luvan poistua pelialueelta ilman rangaistusta.]
  Kun hoito on päättynyt tai jos hoitoa ei voida antaa, pelin on jatkuttava. Päätuomari viheltää ja pyytää pelaajaa jatkamaan. Tällä hetkellä vain pelaaja voi arvioida, onko hän pelikykyinen.

  Jos pelaaja ei toivu tai palaa pelialueelle toipumisajan päätyttyä, hänen joukkueensa julistetaan vajaaksi.
  #refs("6.4.3", "7.3.1")

  Äärimmäisissä tapauksissa kilpailun lääkäri voi vastustaa loukkaantuneen pelaajan paluuta.

  Huom: toipumisaika alkaa, kun kilpailun asianmukaisesti akkreditoitu lääkintähenkilö saapuu pelikentälle hoitamaan pelaajaa. Mikäli akkreditoitua lääkintähenkilöstöä ei ole saatavilla tai tapauksissa, joissa pelaaja valitsee hoidettavaksi omalla lääkintähenkilöstöllään, aika alkaa hetkestä, jolloin tuomari antoi luvan toipumisaikaan.
]

#subrule("17.2", "ULKOPUOLINEN HÄIRIÖ")[
  Jos pelin aikana ilmenee ulkopuolinen häiriö, peli on pysäytettävä ja palloralli pelataan uudelleen.
]

#subrule("17.3", "PITKÄT KESKEYTYKSET")[
  #r("17.3.1")[Jos odottamattomat olosuhteet keskeyttävät ottelun, päätuomari, järjestäjä ja kilpailun jury (jos sellainen on) päättävät toimenpiteistä normaalien olosuhteiden palauttamiseksi.]

  #r("17.3.2")[Jos yksi tai useampi keskeytys ei ylitä yhteensä 4 tuntia, ottelua jatketaan saavutetusta tilanteesta, riippumatta siitä jatketaanko samalla vai toisella pelikentällä.]

  #r("17.3.3")[Jos yksi tai useampi keskeytys ylittää yhteensä 4 tuntia, koko ottelu pelataan uudelleen.]
]

#rule("18", "ERÄTAUOT JA PUOLTENVAIHTO")[
]

#subrule("18.1", "ERÄTAUOT")[
  #r("18.1.1")[Erätauko on erien välinen aika. Kaikki erätauot kestävät yhden minuutin.]
  Tänä aikana suoritetaan puoltenvaihto (jos pyydetty) ja joukkueiden syöttöjärjestyksen merkintä pöytäkirjaan.
  #refs("D9 (3)")

  Ennen ratkaisevaa erää olevalla tauolla tuomarit suorittavat arvonnan säännön 7.1 mukaisesti.
]

#subrule("18.2", "PUOLTENVAIHTO")[
  #r("18.2.1")[Joukkueet vaihtavat puolia jokaisen 7 pelatun pisteen jälkeen (erät 1 ja 2) ja 5 pisteen jälkeen (erä 3).]
  #refs("D9 (3)")

  #r("18.2.2")[Puoltenvaihdon aikana joukkueiden on vaihdettava välittömästi ilman viivytystä.]
  Jos puoltenvaihtoa ei tehdä oikeaan aikaan, se tehdään heti virheen havaitsemisen jälkeen.
  Tilanne puoltenvaihtohetkellä säilyy samana.
]

