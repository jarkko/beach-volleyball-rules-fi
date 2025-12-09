#import "../lib/utils.typ": *

= LUKU 1: PELIOLOSUHTEET JA -VÄLINEET

#rule("1", "PELIALUE")[
  Pelialueeseen kuuluvat pelikenttä ja vapaa-alue. Sen on oltava suorakulmainen ja symmetrinen.
  #refs("1.1", "D1")
]

#subrule("1.1", "MITAT")[
  #r("1.1.1")[Pelikenttä on suorakulmio kooltaan 16 x 8 m. Sitä ympäröi vapaa-alue, joka on vähintään 3 m leveä kaikilla sivuilla.]
  #refs("D2")

  Vapaa pelitila on pelialueen yläpuolella oleva tila, jossa ei saa olla mitään esteitä. Vapaan pelitilan on oltava vähintään 7 m korkea pelialustasta mitattuna.

  #r("1.1.2")[FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa vapaa-alue on vähintään 5 m ja enintään 6 m pääty- ja sivurajoista. Vapaan pelitilan on oltava vähintään 12,5 m korkea pelialustasta mitattuna.]
]

#subrule("1.2", "PELIALUSTA")[
  #r("1.2.1")[Alustan on oltava tasoitettua hiekkaa, mahdollisimman tasainen ja yhtenäinen, vapaa kivistä, simpukankuorista ja kaikesta muusta, mikä voi aiheuttaa loukkaantumisriskin pelaajille.]

  #r("1.2.2")[FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa hiekan on oltava vähintään 40 cm syvää ja koostuttava hienojakoisista, löyhästi pakkautuneista rakeista.]

  #r("1.2.3")[Pelialusta ei saa aiheuttaa loukkaantumisvaaraa pelaajille.]

  #r("1.2.4")[FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa hiekka on myös seulottava sopivaan raekokoon, ei liian karkeaksi, ja sen on oltava vapaa kivistä ja vaarallisista hiukkasista. Se ei saa olla liian hienoa, jotta se ei aiheuta pölyä ja tartu ihoon.]

  #r("1.2.5")[FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa suositellaan keskuskentän peittämistä pressulla sateen varalta.]
]

#subrule("1.3", "KENTÄN RAJAT")[
  #r("1.3.1")[Kaikki rajat ovat 5 cm leveitä. Rajojen värin on erotuttava selvästi hiekan väristä.]
  #refs("D2")

  #r("1.3.2")[Rajaviivat]
  Kaksi sivurajaa ja kaksi päätyrajaa rajaavat pelikentän. Keskirajaa ei ole. Sekä sivu- että päätyrajat sijoitetaan pelikentän mittojen sisäpuolelle.

  Kentän rajojen tulisi olla kestävästä materiaalista valmistettuja nauhoja, ja kaikkien näkyvien kiinnikkeiden tulisi olla pehmeää, joustavaa materiaalia.
]

#subrule("1.4", "ALUEET")[
  Pelialueella on vain pelikenttä, aloitusalue ja vapaa-alue, joka ympäröi pelikenttää.

  #r("1.4.1")[Aloitusalue on 8 m leveä alue päätyrajan takana, joka ulottuu vapaa-alueen reunaan asti.] #label("rule-1.4.2")
]

#subrule("1.5", "SÄÄ")[
  Sää ei saa aiheuttaa loukkaantumisvaaraa pelaajille.
]

#subrule("1.6", "VALAISTUS")[
  FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa, jotka pelataan yöllä, pelialueen valaistuksen tulisi olla 1 000 - 1 500 luksia mitattuna 1 m korkeudella pelialueen pinnasta.
]

#rule("2", "VERKKO JA PYLVÄÄT")[
  #refs("D3")
]

#subrule("2.1", "VERKON KORKEUS")[
  #r("2.1.1")[Pystysuoraan kentän keskikohdan yläpuolelle asetetaan verkko, jonka yläreuna on 2,43 m korkeudella miehillä ja 2,24 m naisilla.]

  Huom: Verkon korkeutta voidaan muuttaa tietyissä ikäryhmissä seuraavasti:

  #table(
    columns: (2fr, 1fr, 1fr),
    [Ikäryhmät], [Naiset], [Miehet],
    [16 vuotta ja alle], [2.24 m], [2.24 m],
    [14 vuotta ja alle], [2.12 m], [2.12 m],
    [12 vuotta ja alle], [2.00 m], [2.00 m],
  )

  #r("2.1.2")[Verkon korkeus mitataan pelikentän keskeltä mittatankolla. Verkon korkeuden (molempien sivurajojen kohdalla) on oltava täsmälleen sama, eikä se saa ylittää virallista korkeutta enempää kuin 2 cm.]
]

#subrule("2.2", "VERKON RAKENNE")[
  Verkko on 8,5 m pitkä ja 1 m (+/- 3 cm) leveä kireänä, sijoitettuna pystysuoraan kapean akselin yläpuolelle pelikentän keskelle.
  #refs("D3")

  Se on valmistettu 10 cm:n neliömäisestä verkosta. Sen ylä- ja alareunassa on kaksi 7-10 cm leveää vaakasuoraa nauhaa, jotka on tehty kaksinkertaisesta kankaasta, mieluiten tummansinisestä tai kirkkaista väreistä, ommeltuna koko pituudelta. Ylä- ja alanauhan päissä on reikä, jonka läpi kulkee naru, jolla nauha kiinnitetään pylväisiin ja pidetään verkon yläosa kireänä.

  Nauhojen sisällä on joustava kaapeli yläosassa ja naru alaosassa verkon kiinnittämiseksi pylväisiin ja sen ylä- ja alaosan pitämiseksi kireänä. Verkon vaakasuorissa nauhoissa on sallittua olla mainoksia.

  FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa voidaan käyttää 8,0 m verkkoa, jossa on pienemmät silmukat ja brändäys verkon päiden ja pylväiden välissä, edellyttäen että urheilijoiden ja toimitsijoiden näkyvyys säilyy. Mainoksia voidaan painaa edellä mainittuihin kohtiin FIVB:n säännösten mukaisesti.
]

#subrule("2.3", "SIVUNAUHAT")[
  Kaksi värillistä nauhaa, 5 cm leveitä (sama leveys kuin kentän rajoilla) ja 1 m pitkiä, kiinnitetään pystysuoraan verkkoon ja sijoitetaan suoraan kummankin sivurajan yläpuolelle. Ne katsotaan osaksi verkkoa.
  #refs("14.1.1", "D3")

  Mainonta on sallittua sivunauhoissa.
]

#subrule("2.4", "ANTENNIT")[
  Antenni on joustava tanko, 1,80 m pitkä ja halkaisijaltaan 10 mm, valmistettu lasikuidusta tai vastaavasta materiaalista.

  Antenni kiinnitetään kummankin sivunauhan ulkoreunaan. Antennit sijoitetaan verkon vastakkaisille puolille.

  Kummankin antennin yläosa (80 cm) ulottuu verkon yläpuolelle ja se on merkitty 10 cm:n raidoilla, jotka ovat kontrastivärisiä, mieluiten punaisia ja valkoisia.

  Antennit katsotaan osaksi verkkoa ja ne rajaavat sivusuunnassa ylityskaistan.
]

#subrule("2.5", "PYLVÄÄT")[
  #refs("D2", "D3")
  #r("2.5.1")[Verkkoa kannattelevat pylväät sijoitetaan 0,70-1,00 m etäisyydelle kummastakin sivurajasta. Ne ovat 2,55 m korkeita ja mieluiten säädettäviä.]

  FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa verkkoa kannattelevat pylväät sijoitetaan 1 m etäisyydelle sivurajojen ulkopuolelle.

  #r("2.5.2")[Pylväiden on oltava pyöreitä ja sileitä, ja ne on kiinnitettävä maahan ilman vaijereita. Ei saa olla vaarallisia tai estäviä laitteita. Pylväiden on oltava pehmustettuja.]
]

#subrule("2.6", "LISÄVARUSTEET")[
  Kaikki lisävarusteet määräytyvät FIVB:n säännösten mukaan.
]

#rule("3", "PALLOT")[
]

#subrule("3.1", "STANDARDIT")[
  #refs("3.2")
  Pallo on pallomainen, valmistettu joustavasta materiaalista (nahka, synteettinen nahka tai vastaava), joka ei ime kosteutta, eli sopii paremmin ulko-olosuhteisiin, koska otteluita voidaan pelata sateella. Pallon sisällä on kumista tai vastaavasta materiaalista valmistettu sisäkumi. Synteettisen nahkamateriaalin hyväksyntä määräytyy FIVB:n säännösten mukaan.

  Väri: vaalea yhtenäinen väri tai värien yhdistelmä.
  Ympärysmitta: 66 - 68 cm.
  Paino: 260 - 280 g.
  Sisäpaine: 0,175 - 0,225 kg/cm2 (171 - 221 mbar tai hPa).
]

#subrule("3.2", "PALLOJEN YHDENMUKAISUUS")[
  Kaikkien ottelussa käytettävien pallojen on oltava ominaisuuksiltaan samanlaisia (ympärysmitta, paino, paine, tyyppi, väri jne.).

  FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa on pelattava FIVB:n hyväksymillä palloilla, ellei FIVB toisin sovi.
  #refs("3.1", "23.2.8")
]

#subrule("3.3", "NELJÄN PALLON JÄRJESTELMÄ")[
  FIVB:n, maailmanlaajuisissa ja virallisissa kilpailuissa käytetään neljää palloa. Tässä tapauksessa kuusi pallonpalauttajaa sijoitetaan yksi jokaiseen vapaa-alueen kulmaan ja yksi kummankin tuomarin taakse.
  #refs("D8")
]

