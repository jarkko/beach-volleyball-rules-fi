#import "../lib/utils.typ": *

= LUKU 4: PELAAMINEN

#rule("8", "PELIN TILANTEET")[
]

#subrule("8.1", "PALLO PELISSÄ")[
  Pallo on pelissä aloitussyötön suoritushetkestä lähtien, kun päätuomari on antanut siihen luvan.
  #refs("12", "12.3")
]

#subrule("8.2", "EI PELISSÄ OLEVA PALLO")[
  Pallo on poissa pelistä sillä hetkellä, kun jompikumpi tuomareista viheltää virheen; virheen puuttuessa vihellyshetkellä.
]

#subrule("8.3", "PALLO \"SISÄLLÄ\"")[
  Pallo on "sisällä", jos se koskettaa pelialustaa niin, että jokin osa pallosta koskettaa kenttää rajat mukaan lukien.
  #refs("D9 (14)", "D10 (1)")
]

#subrule("8.4", "PALLO \"ULKONA\"")[
  Pallo on "ulkona", kun se:
  #r("8.4.1")[putoaa maahan kokonaan rajojen ulkopuolelle (koskettamatta niitä);]
  #refs("1.3.2", "D9 (15)", "D10 (2)")

  #r("8.4.2")[koskettaa esinettä kentän ulkopuolella tai pelin ulkopuolella olevaa henkilöä;]
  #refs("D9 (15)", "D10 (4)")

  #r("8.4.3")[koskettaa antenneja, köysiä, pylväitä tai verkkoa itseään sivunauhojen ulkopuolella;]
  #refs("2.3", "D3", "D4a", "D9 (15)", "D10 (4)")

  #r(
    "8.4.4",
  )[ylittää verkon pystytason osittain tai kokonaan ylityskaistan ulkopuolelta aloituksessa tai joukkueen toisen tai kolmannen lyönnin aikana (poikkeus: Sääntö 10.1.2).]
  #refs("2.3", "10.1.2.2", "D4a", "D9 (15)", "D10 (4)")

  #r("8.4.5")[ylittää kokonaan verkon alla olevan tilan.]
  #refs("D4a", "D9 (22)", "22")
]

#rule("9", "PALLON PELAAMINEN")[
  Joukkueen on pelattava omalla pelialueellaan ja omassa pelitilassaan (paitsi sääntö 10.1.2).
  #refs("10.1.2")

  Pallo voidaan kuitenkin hakea oman vapaa-alueen ulkopuolelta ja kirjuripöydän yli koko sen laajuudelta.
]

#subrule("9.1", "JOUKKUEEN LYÖNNIT")[
  Lyönti on mikä tahansa pelissä olevan pelaajan kosketus palloon.

  Joukkueella on oikeus enintään kolmeen lyöntiin palauttaakseen pallon verkon yli. Jos lyöntejä on enemmän, joukkue tekee virheen: "NELJÄ LYÖNTIÄ".

  Näihin joukkueen lyönteihin lasketaan paitsi pelaajien tahalliset lyönnit, myös tahattomat kosketukset palloon.

  #r("9.1.1")[PERÄKKÄISET KOSKETUKSET]
  Pelaaja ei saa koskettaa palloa kaksi kertaa peräkkäin (poikkeukset, katso Säännöt: 9.2.2.2, 9.2.2.3, 14.2 ja 14.4.2).
  #refs("9.2.2.1", "14.2", "14.4.2", "D9 (17)")

  #r("9.1.2")[SAMANAIKAISET KOSKETUKSET]
  Kaksi pelaajaa voi koskettaa palloa samanaikaisesti.

  #r(
    "9.1.2.1",
  )[Kun kaksi joukkuetoveria koskettaa palloa samanaikaisesti, se lasketaan kahdeksi lyönniksi (paitsi torjunnassa).]
  #refs("14.2")

  Jos he tavoittelevat palloa, mutta vain toinen koskettaa sitä, lasketaan yksi lyönti.
  Jos pelaajat törmäävät toisiinsa, virhettä ei tuomita.

  #r(
    "9.1.2.2",
  )[Kun kaksi vastustajaa koskettaa palloa samanaikaisesti verkon päällä ja pallo jää peliin, pallon vastaanottavalla joukkueella on oikeus uusiin kolmeen lyöntiin. Jos tällainen pallo menee "ulos", virhe on vastapuolen.]

  #r(
    "9.1.2.3",
  )[Jos vastustajien samanaikaiset osumat verkon päällä johtavat pitkittyneeseen kosketukseen palloon, peli jatkuu, vaikka kosketus päättyisi vastustajan puolella.]
  #refs("9.1.2.2")

  #r(
    "9.1.2.4",
  )[Jos pallo osuu antenniin kahden vastustajan samanaikaisen, verkon päällä tapahtuneen lyönnin jälkeen, palloralli pelataan uudelleen.]

  #r("9.1.3")[AVUSTETTU LYÖNTI]
  Pelialueella pelaaja ei saa tukeutua joukkuetoveriinsa tai mihinkään rakenteeseen/esineeseen lyödäkseen palloa.

  Pelaaja, joka on tekemässä virhettä (koskettamassa verkkoa tai häiritsemässä vastustajaa jne.), voidaan kuitenkin pysäyttää tai vetää takaisin joukkuetoverin toimesta.
]

#subrule("9.2", "LYÖNNIN OMINAISUUDET")[
  #r("9.2.1")[Pallo saa koskettaa mitä tahansa kehon osaa.]

  #r("9.2.2")[Palloa ei saa ottaa kopiksi eikä heittää. Se voi kimmota mihin suuntaan tahansa.]
  #refs("9.3.3")

  #r("9.2.2.1")[Samanaikaiset kosketukset:]
  Pallo voi koskettaa useita kehon osia, edellyttäen että kosketukset tapahtuvat samanaikaisesti.
  #refs("9.2.1")

  #r("9.2.2.2")[Peräkkäiset kosketukset:]
  Joukkueen ensimmäisessä lyönnissä (edellyttäen ettei sitä suoriteta sormilyöntinä), peräkkäiset kosketukset ovat sallittuja, kunhan ne tapahtuvat yhden suorituksen aikana.

  Jos joukkueen ensimmäinen lyönti suoritetaan sormilyöntinä, pallo EI saa koskettaa sormia/käsiä peräkkäin, vaikka kosketukset tapahtuisivat yhden suorituksen aikana.
  #refs("9.3.4")

  #r("9.2.2.3")[Poikkeukset:]
  Torjunnassa peräkkäiset kosketukset (nopeat ja jatkuvat) yhdeltä tai useammalta torjujalta ovat sallittuja, edellyttäen että kosketukset tapahtuvat yhden suorituksen aikana.
  #refs("14.2")
]

#subrule("9.3", "VIRHEET PALLON PELAAMISESSA")[
  #r("9.3.1")[NELJÄ LYÖNTIÄ: Joukkue lyö palloa neljä kertaa ennen sen palauttamista.]
  #refs("9.1")

  #r(
    "9.3.2",
  )[AVUSTETTU LYÖNTI: Pelaaja tukeutuu joukkuetoveriin tai johonkin rakenteeseen/esineeseen pelialueella lyödäkseen palloa.]
  #refs("9.1.3")

  #r(
    "9.3.3",
  )[KOPPI: Pallo otetaan kopiksi ja/tai heitetään; se ei kimpoa lyönnistä. (Poikkeukset: Säännöt 9.2.2.1, 9.2.2.2).]
  #refs("9.2.2", "D9 (16)")

  #r("9.3.4")[KAKSOISKOSKETUS: Pelaaja lyö palloa kaksi kertaa peräkkäin tai pallo koskettaa eri kehon osia peräkkäin.]
  #refs("9.1.1", "9.2.2.2", "D9 (17)")
]

#rule("10", "PALLO VERKOLLA")[
]

#subrule("10.1", "PALLO YLITTÄÄ VERKON")[
  #r(
    "10.1.1",
  )[Pallo, joka lähetetään vastustajan kentälle, on mentävä verkon yli ylityskaistan kautta. Ylityskaista on osa verkon pystytasoa ja sitä rajoittavat:]
  #r("10.1.1.1")[alhaalta verkon yläreuna;]
  #r("10.1.1.2")[sivuilta antennit ja niiden kuvitteelliset jatkeet;]
  #r("10.1.1.3")[ylhäältä katto tai muu este (jos on).]

  #r(
    "10.1.2",
  )[Pallo, joka on ylittänyt verkkotason (kokonaan tai osittain) ylityskaistan ulkopuolelta, voidaan palauttaa peliin joukkuetoverin toimesta, edellyttäen että:]
  #refs("D5b")
  #r("10.1.2.1")[joukkue ei ole käyttänyt kolmea lyöntiään;]
  #r("10.1.2.2")[pallo koskettaa verkkotasoa ylittäessään jälleen ylityskaistan ulkopuolella samalla puolella kenttää.]

  Vastustajajoukkue ei saa estää tätä toimintaa.

  #r("10.1.3")[Pallo on "ulkona", kun se ylittää verkon kokonaan alapuolitse.]
  #refs("8.4.5")

  #r(
    "10.1.4",
  )[Pelaaja saa kuitenkin mennä vastustajan kentälle pelatakseen palloa ennen kuin se ohittaa verkon ylityskaistan ulkopuolelta tai ennen kuin se ylittää kokonaan verkon alitse.]
  #refs("10.1.3", "11.2.1")
]

#subrule("10.2", "PALLO KOSKETTAA VERKKOA")[
  Pallo saa koskettaa verkkoa ylittäessään sen.
]

#subrule("10.3", "PALLO VERKOSSA")[
  #r("10.3.1")[Verkkoon osunutta palloa saa pelata, kunhan joukkueen kolmea lyöntiä ei ole käytetty.]

  #r("10.3.2")[Jos pallo repii verkon tai pudottaa sen, palloralli mitätöidään ja pelataan uudelleen.]
]

#rule("11", "PELAAJA VERKOLLA")[
]

#subrule("11.1", "VERKON YLI KUROTTAUTUMINEN")[
  #r(
    "11.1.1",
  )[Torjunnassa on sallittua koskea palloa verkon toisella puolella, kunhan sillä ei puututa vastustajan peliin ennen sen hyökkäyslyöntiä.]
  #refs("14.1", "14.3")

  #r(
    "11.1.2",
  )[Hyökkäyslyönnin jälkeen on sallittua viedä käsi verkon yli, kunhan kosketus on tapahtunut omassa pelitilassa.]
]

#subrule("11.2", "TUNKEUTUMINEN VASTUSTAJAN TILAAN, KENTÄLLE JA/TAI VAPAA-ALUEELLE")[
  #r(
    "11.2.1",
  )[Pelaaja saa tunkeutua vastustajan tilaan, kentälle ja/tai vapaa-alueelle, edellyttäen että se ei häiritse vastustajan peliä.]
  #refs("10.1.4")
]

#subrule("11.3", "VERKKOKOSKETUS")[
  #r("11.3.1")[Pelaajan verkkokosketus antennien välissä pallon pelaamisen aikana on virhe.]
  Pelaaminen pallolla sisältää (muun muassa) ponnistuksen, lyönnin (tai yrityksen) ja alastulon.
  #refs("11.4.3")

  #r(
    "11.3.2",
  )[Pelaajat saavat koskettaa pylväitä, köysiä tai mitä tahansa esinettä antennien ulkopuolella, mukaan lukien verkkoa itseään, edellyttäen ettei se häiritse peliä.]

  #r("11.3.3")[Kun pallo lyödään verkkoon, ja se aiheuttaa verkon osumisen vastustajaan, virhettä ei tuomita.]
]

#subrule("11.4", "PELAAJAN VIRHEET VERKOLLA")[
  #r(
    "11.4.1",
  )[Pelaaja koskettaa palloa tai vastustajaa vastustajan tilassa ennen vastustajan hyökkäyslyöntiä tai sen aikana.]
  #refs("11.1.1", "D9 (20)")

  #r("11.4.2")[Pelaaja häiritsee vastustajan peliä tunkeutuessaan vastustajan tilaan verkon alla.]
  #refs("11.2.1")

  #r(
    "11.4.3",
  )[Pelaaja häiritsee vastustajan peliä (esim. koskettamalla verkkoa antennien välissä pelatessaan palloa).]
  #refs("11.3.1", "D9 (19)")
]

#rule("12", "ALOITUSSYÖTTÖ")[
  Aloitussyöttö on pallon saattamista peliin oikeanpuoleisen takapelaajan toimesta, joka lyö palloa aloitusalueella.
]

#subrule("12.1", "ERÄN ENSIMMÄINEN ALOITUSSYÖTTÖ")[
  #r("12.1.1")[Erän ensimmäisen aloitussyötön suorittaa joukkue, joka on saanut siihen oikeuden arvonnassa.]
  #refs("6.3.2", "7.1")
]

#subrule("12.2", "SYÖTTÖJÄRJESTYS")[
  #r("12.2.1")[Pelaajien on noudatettava pöytäkirjaan merkittyä syöttöjärjestystä.]
  #refs("7.6")

  #r("12.2.2")[Erän ensimmäisen aloitussyötön jälkeen syöttävä pelaaja määräytyy seuraavasti:]

  #r("12.2.2.1")[kun aloitussyötön suorittanut joukkue voittaa pallorallin, sama pelaaja syöttää uudelleen.]

  #r(
    "12.2.2.2",
  )[kun aloitussyötön vastaanottanut joukkue voittaa pallorallin, se saa aloitussyöttöoikeuden ja pelaaja, joka ei syöttänyt edellisellä kerralla, suorittaa aloituksen.]
  #refs("7.6.2")
]

#subrule("12.3", "ALOITUSSYÖTTÖLUVAN ANTAMINEN")[
  Päätuomari antaa luvan aloitussyöttöön varmistettuaan, että joukkueet ovat valmiina peliin ja aloitussyöttäjällä on pallo hallussaan.
  #refs("D9 (1)")
]

#subrule("12.4", "ALOITUSSYÖTÖN SUORITTAMINEN")[
  #r(
    "12.4.1",
  )[Aloitussyöttö on suoritettava lyömällä palloa yhdellä kädellä tai käsivarren osalla sen jälkeen, kun se on heitetty tai irrotettu kädestä.]
  #refs("D9 (10)")

  #r("12.4.2")[Vain yksi pallon heitto tai irrotus on sallittu. Pallon liikuttelu käsissä on sallittua.]

  #r(
    "12.4.3",
  )[Syöttäjä saa liikkua vapaasti aloitusalueella. Syöttöhetkellä tai ponnistuksessa hyppysyöttöön syöttäjä ei saa koskettaa kenttää (päätyraja mukaan lukien) eikä lattiaa aloitusalueen ulkopuolella. Lyönnin jälkeen hän saa astua tai laskeutua aloitusalueen ulkopuolelle tai kentälle.]
  #refs("1.4.2", "D9 (22)", "D10 (4)")

  #r("12.4.4")[Syöttäjän on lyötävä palloa 5 sekunnin kuluessa päätuomarin vihellyksestä.]
  #refs("D9 (11)")

  #r("12.4.5")[Ennen vihellystä suoritettu syöttö mitätöidään ja uusitaan.]
  #refs("12.3", "D9 (23)")

  #r(
    "12.4.6",
  )[Jos pallo, sen jälkeen kun syöttäjä on heittänyt tai irrottanut sen, putoaa maahan ilman että syöttäjä koskettaa tai ottaa sen kiinni, se katsotaan suoritetuksi syötöksi.]

  #r("12.4.7")[Uutta syöttöyritystä ei sallita.]
]

#subrule("12.5", "PEITTÄMINEN")[
  #refs("D9 (12)")
  #r("12.5.1")[Syöttävän joukkueen pelaaja ei saa peittää vastustajalta näkyvyyttä syöttäjään tai pallon lentorataan.]

  #r(
    "12.5.2",
  )[Syöttävän joukkueen pelaaja tekee peittämisen, jos hän heiluttaa käsiään, hyppii tai liikkuu sivuttain syötön aikana, tai seisoo ryhmässä peittääkseen pallon lentoradan.]

  #r("12.5.3")[Vastaanottavan joukkueen pyynnöstä pelaajan on siirryttävä sivusuunnassa.]
]

#subrule("12.6", "VIRHEET ALOITUSLYÖNNISSÄ")[
  #r("12.6.1")[Aloitusvirheet:]
  Seuraavat virheet johtavat syötön vaihtumiseen. Syöttäjä:
  #r("12.6.1.1")[rikkoo syöttöjärjestystä;]
  #refs("12.2", "D9 (13)")
  #r("12.6.1.2")[ei suorita aloitusta oikein.]
  #refs("12.4")

  #r("12.6.2")[Virheet aloituslyönnin jälkeen:]
  Kun pallo on lyöty oikein, aloitus on virheellinen, jos pallo:
  #r("12.6.2.1")[koskettaa syöttävän joukkueen pelaajaa tai ei ylitä verkkotasoa kokonaan ylityskaistan kautta;]
  #refs("D9 (19)")
  #r("12.6.2.2")[menee "ulos";]
  #refs("8.4", "D9 (15)")
  #r("12.6.2.3")[menee peiton yli.]
  #refs("D5")
]

#rule("13", "HYÖKKÄYSLYÖNTI")[
]

#subrule("13.1", "HYÖKKÄYSLYÖNNIN OMINAISUUDET")[
  #r("13.1.1")[Kaikkea pallon suuntaamista vastapuolelle, paitsi aloitusta ja torjuntaa, pidetään hyökkäyslyöntinä.]

  #r("13.1.2")[Hyökkäyslyönti on suoritettu, kun pallo on ylittänyt verkkotason kokonaan tai koskettanut vastustajaa.]

  #r(
    "13.1.3",
  )[Pelaaja saa lyödä palloa millä tahansa korkeudella, edellyttäen että kosketus tapahtuu omassa pelitilassa (poikkeus: 13.2.4, 13.2.5).]
  #refs("13.2.4", "13.2.5")
]

#subrule("13.2", "VIRHEET HYÖKKÄYSLYÖNNISSÄ")[
  #r("13.2.1")[Pelaaja lyö palloa vastapuolen pelitilassa.]
  #refs("13.1.2", "D9 (20)")

  #r("13.2.2")[Pelaaja lyö pallon "ulos".]
  #refs("8.4", "D9 (15)")

  #r(
    "13.2.3",
  )[Pelaaja suorittaa hyökkäyslyönnin käyttäen "sormilyöntiä" (open-hand tip), jos sormet eivät ole jäykät ja yhdessä.]
  #refs("D9 (21)")

  #r(
    "13.2.4",
  )[Pelaaja suorittaa hyökkäyslyönnin vastustajan syötöstä, kun pallo on kokonaan verkon yläreunan yläpuolella.]
  #refs("D9 (21)")

  #r(
    "13.2.5",
  )[Pelaaja suorittaa hyökkäyslyönnin sormilyöntinä (passina), eikä pallon lentorata ole kohtisuorassa hänen hartialinjaansa nähden (paitsi jos hän yrittää passata joukkuetoverilleen).]
  #refs("D9 (21)")
]

#rule("14", "TORJUNTA")[
]

#subrule("14.1", "TORJUMINEN")[
  #r(
    "14.1.1",
  )[Torjuminen on pelaajien verkon tuntumassa tapahtuvaa toimintaa vastapuolelta tulevan pallon pysäyttämiseksi kurottautumalla verkon yläpuolelle. Pallokosketuksen hetkellä jonkin kehon osan on oltava verkon yläreunan yläpuolella.]

  #r("14.1.2")[Torjuntayritys]
  Torjuntayritys on torjuntatoiminta ilman pallokosketusta.

  #r("14.1.3")[Suoritettu torjunta]
  Torjunta on suoritettu aina, kun torjuja koskettaa palloa.
  #refs("D6")

  #r("14.1.4")[Yhteistorjunta]
  Yhteistorjunnan suorittaa kaksi pelaajaa lähellä toisiaan, ja se on suoritettu, kun toinen heistä koskettaa palloa.
]

#subrule("14.2", "TORJUNTAKOSKETUS")[
  Peräkkäiset (nopeat ja jatkuvat) kosketukset ovat sallittuja yhdeltä tai useammalta torjujalta, edellyttäen että kosketukset tapahtuvat yhden suorituksen aikana. Nämä lasketaan vain yhdeksi joukkueen lyönniksi. Nämä kosketukset voivat tapahtua millä tahansa kehon osalla.
  #refs("9.1.1", "9.2.2.3")
]

#subrule("14.3", "TORJUNTA VASTUSTAJAN TILASSA")[
  Torjunnassa pelaaja saa laittaa kätensä ja käsivartensa verkon yli, edellyttäen että tämä toiminta ei häiritse vastustajan peliä. Siten ei ole sallittua koskettaa palloa verkon toisella puolella ennen kuin vastustaja on suorittanut hyökkäyslyönnin.
  #refs("13.1.1")
]

#subrule("14.4", "TORJUNTA JA JOUKKUEEN LYÖNNIT")[
  #r(
    "14.4.1",
  )[Torjuntakosketus lasketaan joukkueen lyönniksi. Torjuntakosketuksen jälkeen joukkueella on käytettävissään vain kaksi lyöntiä.]

  #r(
    "14.4.2",
  )[Ensimmäisen lyönnin torjunnan jälkeen saa suorittaa kuka tahansa pelaaja, mukaan lukien se, joka kosketti palloa torjunnassa.]
]

#subrule("14.5", "ALOITUKSEN TORJUMINEN")[
  #refs("D9 (12)")
  Vastustajan aloituksen torjuminen on kiellettyä.
]

#subrule("14.6", "TORJUNTAVIRHEET")[
  #r("14.6.1")[Torjuja koskettaa palloa VASTUSTAJAN tilassa ennen vastustajan hyökkäyslyöntiä.]
  #refs("14.3", "D9 (20)")

  #r("14.6.2")[Pallon torjuminen vastustajan tilassa antennin ulkopuolelta.]

  #r("14.6.3")[Pelaaja torjuu vastustajan aloituksen.]
  #refs("D9 (12)")

  #r("14.6.4")[Pallo menee torjunnasta "ulos".]
  #refs("D9 (24)")
]

