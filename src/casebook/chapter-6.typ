#import "../lib/utils.typ": *

= LUKU 6

#case(
  "6.1.1",
  [Onko joukkueen sallittua jäädä pelikentälle pyydettyään aikalisää?],
  [Ei, tämä ei ole sallittua. Kaikkien säännöllisten katkojen ja erätaukojen aikana (mukaan lukien tekniset aikalisät) pelaajien on mentävä heille osoitetulle pelaaja-alueelle.],
  ("15.4.4", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.1.2",
  [Kun 2. tuomari viheltää aikalisän päättyneeksi, ja pelaajat eivät liiku kentälle, onko 1. tuomarin oikein antaa viivytysrangaistus?],
  [Jos pelaajat eivät ole palanneet kentälle 15 sekunnin kuluttua, viivytys on merkittävä. On erittäin tärkeää, että 2. tuomari on erittäin aktiivinen aikalisän lopussa kannustaen molempia joukkueita palaamaan pelikentälle. Näin ollen 1. tuomarin tulisi antaa viivytysrangaistus.],
  ("15.4.1", "16.1.1", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.1.3",
  [Onko toisen joukkueen sallittua pyytää aikalisää vastustajan aikalisän lopussa? Viite: Tapaus 10.7],
  [Tuomarien tulisi hyväksyä tämä aikalisäpyyntö viheltämällä pilliin ja toistamalla viralliset käsimerkit. 30 sekunnin ajanoton tulisi alkaa, kun molemmat joukkueet ovat takaisin nimetyillä tuoleillaan (tai asianmukaisesti). 30 sekunnin päätyttyä tuomarien tulisi viheltää, näyttää merkki ja pyytää sanallisesti joukkueita palaamaan pelikentälle. 2. tuomarin tulisi tällöin ilmoittaa molemmille joukkueille, että ne ovat käyttäneet sallitut aikalisänsä.],
  ("15.2.1", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.1.4",
  [Ottelun aikana joukkueen A kapteeni pyysi toista aikalisää erässä. 2. tuomari hyväksyi sen, samalla kun hän totesi kirjurille, että ensimmäinen aikalisä oli merkitty joukkueelle B. Kun kirjuri oli korjannut pöytäkirjan, myöhemmin erässä joukkue B pyysi (ensimmäistä) aikalisäänsä. Kun 2. tuomari hylkäsi pyynnön ja joukkue B protestoi, 2. tuomari tajusi, että joukkueelle A oli myönnetty kaksi aikalisää erässä. Mikä olisi ratkaisu otteluhetkellä?],
  [Vaikka joukkueen A kapteenin toisen pyynnön oikea hetki voitaisiin jäljittää, seuraavan pallorallin pelaamisen jälkeen tätä voidaan pitää vain kyseisen tuomarin virheenä. Joukkueella B ei ole oikeutta palata ajassa taaksepäin ja pelata ottelua uudelleen siitä pisteestä, kun joukkue A sai toisen aikalisänsä. (Tuolloin se olisi pitänyt kirjata virheelliseksi pyynnöksi tai viivytysrangaistukseksi.)],
  ("15.5.3", "15.5.4", "16.1", "16.2.1", "16.2.2", "16.2.3"),
)

#case(
  "6.1.5",
  [Onko sallittua antaa virheellinen pyyntö aiemmin samassa ottelussa annetun viivytysvaroituksen tai -rangaistuksen jälkeen?],
  [Joukkueen ensimmäinen virheellinen pyyntö ottelussa, joka ei vaikuta peliin tai viivytä sitä, hylätään ilman muita seurauksia. Säännössä ei mainita mitään aiemmista tapahtumista ennen virheellistä pyyntöä. Jos pyyntö on virheellinen ensimmäistä kertaa joukkueelta, se tulisi katsoa "virheelliseksi pyynnöksi"; sillä ei ole väliä, onko joukkue aiemmin saanut viivytysrangaistuksen. Joten viivytysvaroituksen (DW) tai -rangaistuksen (DP) jälkeen "virheellinen pyyntö" voidaan silti tehdä – ja kirjata pöytäkirjaan.],
  "15.11.2",
)

#case(
  "6.1.6",
  [Ottelun aikana kävellessään suoraan joukkuealueelleen, joukkueen A pelaaja, joka ei ollut kapteeni, pyysi aikalisää. 2. tuomari ei hyväksynyt pyyntöä, ja joukkueelle A merkittiin "virheellinen pyyntö". Samaan aikaan joukkueen A kapteeni pyysi aikalisää samalla katkolla, jota 2. tuomari ei myöskään hyväksynyt. Oliko 2. tuomari oikeassa?],
  [Tuomari on oikeassa antaessaan "virheellisen pyynnön". Se hylätään ilman rangaistusta, ellei se toistu tai vaikuta peliin tai viivytä sitä. Kuitenkin olosuhteista riippuen kuvattu skenaario voi johtaa yhteen kahdesta seuraavasta seurauksesta: 1) Jos viivytysrangaistusta ei sovelleta, mikään sääntö ei estä kapteenia tekemästä laillista pyyntöä saman katkon aikana. Joten tällaisessa tilanteessa 2. tuomarin olisi pitänyt hyväksyä kapteenin aikalisäpyyntö. 2) Jos sovellettiin viivytysrangaistusta, kapteenin aikalisäpyyntöä ei sallittaisi samalla katkolla.],
  ("15.3", "15.5.2", "15.5.4"),
)

#case(
  "6.1.7",
  [Aikalisän kesto on asetettu 30 sekuntiin. Voidaanko tätä säätää?],
  [Kyllä. Aikalisien kestoa voidaan säätää kilpailun tarpeiden mukaan. Tämä on eri asia kuin pelaajien salliminen palata kentälle ennen vihellystä, joka päättää aikalisän (mikä olosuhteista riippuen voidaan myös sallia).],
  "15.4.1",
)

#case(
  "6.2.1",
  [Onko sallittua antaa kahta viivytysvaroitusta samalle joukkueelle yhdessä erässä? Viite: Tapaus 10.8],
  [
    1. tuomarin ei tulisi antaa kahta viivytysvaroitusta yhdelle joukkueelle samassa erässä tai samassa ottelussa. Viivytysvaroitukset kirjataan pöytäkirjaan, joten kirjurin tulisi välittömästi ilmoittaa 1. tuomarille (2. tuomarin kautta) tästä virheestä.
  ],
  ("16.2.1", "16.2.1.1", "16.2.1.2", "16.2.2", "16.2.3"),
)

#case(
  "6.2.2",
  [Onko pelaajien sallittua mennä usein hitaasti paikoilleen, pyyhkiä lasejaan ja puhdistaa hiekkaa kehostaan, ja siten pidentää aikaa pallorallien välillä yli 12 sekunnin?],
  [
    1. tuomarin tulisi säilyttää ottelun tahdin hallinta, eikä antaa pelaajien hallita sitä. Pidentämällä aikaa pallorallien välillä yli 12 sekunnin on tapahtunut viivytys. Tuomarin on hallittava pallorallien välistä aikaa varoittaen sanallisesti tarvittaessa. Sitten kun pelaaja tahallisesti tai toistuvasti viivyttää ottelua, anna virallinen viivytysvaroitus joukkueelle.
  ],
  "16.1.3",
)

#case(
  "6.2.3",
  [Kun pelaajat ovat paikallaan vastaanottaakseen seuraavan syötön, toinen heistä pyytää 1. tuomarilta lupaa pyyhkiä kasvonsa. Pitäisikö 1. tuomarin hyväksyä tämä pyyntö?],
  [Tässä tapauksessa tuomarin tulisi hylätä pyyntö, koska pelaaja pidentää aikaa pallorallien välillä yli 12 sekunnin. Rallin päätyttyä pelaajan olisi pitänyt poistua kentältä nopeasti pyyhkimään kasvonsa. Tuomarin tulisi hyväksyä tämä pyyntö vain, jos: 1) pelaajalle on olemassa merkittävä vaara, ja 2) pelaaja ei tahallisesti aiheuttanut tätä viivytystä.],
  ("16.1.3", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.2.4",
  [Onko pelaajan sallittua pyyhkiä päätään ja käsiään verkkopylväässä roikkuvalla pienellä pyyhkeellä, joka on tarkoitettu pelaajien lasien puhdistamiseen? Viite: Tapaus 10.9],
  [Ei, tämä ei ole sallittua. 1. tuomarin tulisi katsoa tämä pelin tahalliseksi viivyttämiseksi ja hänen tulisi antaa viivytysrangaistus.],
  ("16.1.3", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.2.5",
  [Jos joukkue viivyttää ottelun alkua jättämällä tulematta kentälle tuomarien pyynnöstä huolimatta, mikä olisi 1. tuomarin oikea menettelytapa? Viite: Tapaus 10.12],
  [1. tuomarin tulisi antaa viivytysrangaistus ennen pelin alkua.],
  "16.2.2",
)

#case(
  "6.2.6",
  [Ottelun aikana joukkueen A kapteeni pyytää toista aikalisää erässä. 2. tuomari hyväksyy sen. Kun pelaajat kävelevät tuoleilleen, kirjuri ilmoittaa 2. tuomarille, että joukkueella A oli jo yksi aikalisä kyseisessä erässä. 2. tuomari kutsuu molemmat joukkueet takaisin pelipaikoilleen, ja 1. tuomari antaa viivytysrangaistuksen joukkueelle A. Oliko tämä oikea menettelytapa?],
  [Tämä on kulunut aika huomioiden oikea ratkaisu. 2. tuomarin on aina oltava tietoinen käytettyjen aikalisien määrästä, ja hänen olisi pitänyt hylätä pyyntö ja ohjeistaa kirjuria kirjaamaan virheellinen pyyntö pöytäkirjaan.],
  ("15.5.3", "15.5.4", "16.1", "16.2.1", "16.2.2", "16.2.3"),
)

#case(
  "6.3.1",
  [Mitä tuomarin tulisi tehdä, jos pelaaja loukkaantumisen jälkeen poistuu kentältä eikä palaa 5 minuutin kuluessa? Viite: Tapaus 10.10],
  [Heti kun 1. tuomari (nykyisten säännösten rajoissa) toteaa, että lääkintäapua tarvitaan, hänen on varmistettava: 1) että akkreditoitua lääkintähenkilöstöä ja delegaattia (delegaatteja) pyydetään tulemaan kentälle välittömästi. Huomaa, että varotoimenpiteenä akkreditoitua lääkintähenkilöstöä on pyydettävä tulemaan kentälle kaikissa loukkaantumistapauksissa riippumatta siitä, pyytääkö pelaaja sitä vai ei. 2) että pelaaja(t) pysyvät pelialueella tai kyseisen joukkueen alueella. 3) että jos tuomari sallii loukkaantuneen pelaajan poistua pelialueelta tai kyseisen joukkueen alueelta, tuomarin tulisi aluksi saattaa tätä pelaajaa. 4) että kirjuri on kirjannut kaikki tärkeät tiedot oikein. 5) että muille pelaajille tiedotetaan kaikista asiaankuuluvista tiedoista. Tässä tapauksessa pelaajan joukkue olisi pitänyt julistaa vajaalukuiseksi ja ottelu päättyneeksi.],
  "17.1.2",
)

#case(
  "6.3.2",
  [Jos kyseessä on pieni verivamma, saako pelaaja nopeasti puhdistaa ja sitoa haavan? Viite: Tapaus 10.11],
  [Kyllä. Tuomarien on oltava erittäin varovaisia verimääräysten toimeenpanossa kaikkien otteluun osallistujien turvallisuuden vuoksi. Jos vamma on pieni, tuomarit voivat sallia (ilman lääkintäaikalisän määräämistä joukkueelle) riittävästi aikaa vamman hoitamiseen.],
  ("17.1.2", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.3.3",
  [Vaikeissa sääolosuhteissa pelaaja ei pysty jatkamaan pelaamista, koska hänellä on hengitysvaikeuksia astman vuoksi. Miten tuomarien tulisi edetä?],
  [Joukkueella on ensin oikeus aikalisään, jos se on käytettävissä, ja tarvittaessa lääkintäapukatkoon kyseiselle pelaajalle. Joten 2. tuomarin tulisi: 1) ensin hyväksyä joukkueen aikalisä, 2) sitten selvittää, haluaako pelaaja tulla hoidetuksi virallisen lääkintähenkilöstön vai joukkueen akkreditoidun lääkintähenkilöstön toimesta, 3) minkä jälkeen kutsua välittömästi asianomainen lääkintäapu kentälle, 4) sitten, vain jos asia ei ratkea, 2. tuomarin on annettava merkki 1. tuomarille tulla alas tornista ja ilmoittaa pelaajalle, että "toipumiskatko" hyväksytään ja aloitetaan 1. tuomarin toimesta. 1. tuomari tultuaan alas tornista ja ollessaan lähellä kirjurinpöytää: 1) varmistaa, että kaikki olennaiset seikat täyttyvät, eli: virallisen lääkintähenkilöstön saapuminen (jos tämä on ollut loukkaantuneen pelaajan valinta), tai jos virallista lääkintähenkilöstöä ei ole saatavilla, tai jos pelaaja pyysi omaa akkreditoitua lääkintähenkilöstöään, 2) minkä jälkeen aloittaa välittömästi "Toipumiskatko"-protokollan (RIT). 3) tämä tehdään viheltämällä ja näyttämällä numeroa 5 sormet koholla ja pyytämällä kirjuria aloittamaan ajanotto. Samanlainen prosessi toteutetaan, jos pelaajalla on samat oireet ennen ottelun tai erän alkua, koska joukkueella on laillinen oikeus aikalisään ja tarvittaessa lääkintäapukatkoon tietylle pelaajalle, vaikka joukkueet eivät ole aloittaneet pelaamista (ensimmäinen syöttö).],
  ("17.1.2", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.3.4",
  [Kun pelaaja pyytää "Toipumiskatkolla" (RIT) akkreditoitua lääkintähenkilöstöä, onko hänellä oikeus kieltäytyä nopeasti kentälle tulevan ensiapuhenkilön hoidosta?],
  [Kyllä, jos pelaaja pyytää akkreditoitua lääkintähenkilöstöä, ensiapuhenkilöä ei katsota sellaiseksi. Delegaatin (delegaattien) tehtävänä on määrittää akkreditoidun lääkintähenkilöstön soveltuvuus tehtäväänsä.],
  ("17.1.2", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.3.5",
  [Onko pelaajan sallittua olla pyytämättä lääkintäapua pienen vamman jälkeen todeten, että kaikki on kunnossa lyhyessä ajassa?],
  [Kyllä, jos aika, jonka pelaaja tarvitsee, on lyhyt, tuomarien tulisi sallia tämä. 2. tuomarin on valvottava pelaajaa tarkasti tänä aikana. Tuomarien tulisi huomata, että ellei kyseessä ole äärimmäinen tapaus, jossa virallinen lääkintähenkilöstö voi vastustaa sitä, on aina pelaajan lopullinen päätös, onko hän kunnossa jatkamaan ottelua. Tuomarien tulisi kaikissa loukkaantumistapauksissa kutsua valtuutettu lääkintähenkilöstö kentälle riippumatta siitä, toteutetaanko "Lääkintäapu"-protokolla vai ei.],
  ("17.1.2", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.3.6",
  [Joukkue pyytää teknistä delegaattia tarkistamaan valaistuksen puutteen. Delegaatti pysäyttää pelin ja ottelu alkaa uudelleen seuraavana aamuna tilanteesta 0-0. Mitkä ovat kriteerit, joiden perusteella tekninen delegaatti päättää, jatketaanko ottelua? Viite: Tapaus 10.13],
  [Delegaatin tulisi harkita seuraavaa: 1) päiväotteluille ei ole määritelty luonnonvalon maksimi- tai minimimäärää; kuitenkin 1000 luksia 1 metrin korkeudella pelialustasta voidaan käyttää viitteenä. 2) ovatko normaalit peliolosuhteet mahdollisia pelaajille koko loppuottelun ajan. 3) haluavatko kapteenit pysäyttää ottelun. Molemmat joukkueet voivat sopia ottelun jatkamisesta. 4) keinovalojen saatavuus ottelun mahdollista jatkamista varten. 5) seuraavan päivän peliaikataulu.],
  "1.6",
)

#case(
  "6.3.7",
  [Jos pelaaja pelin aikana teeskentelee loukkaantumista ja saa näin 1. tuomarin pysäyttämään pelin välittömästi, ja sen jälkeen pelaaja toteaa, ettei mikään estä häntä pelaamasta, onko tuomarilla mitään keinoa puuttua tähän epäurheilijamaiseen käytökseen?],
  [Ei. Vihellettyään väitetyn loukkaantumisen vuoksi 1. tuomarilla ei ole keinoa perua päätöstään, ja hänen on annettava pallorallin pelattavaksi uudelleen. Pelisääntöjen mukaan tuomarin on vihellettävä, kun hän uskoo, että vakava loukkaantuminen on tapahtunut ja/tai jos pelaaja voi loukkaantua lisää, jos peli jatkuu. Tämä vihellys (jos se tapahtuu rallin aikana) johtaa pallon uusimiseen. Jos vihellys tapahtuu rallin päättymisen jälkeen, rallin tulos jää voimaan. Tuomarin ei tulisi ryhtyä väittelyyn loukkaantumisen pätevyydestä kummankaan pelaajan kanssa.],
  ("17.1.1", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.3.8",
  [Onko pelaajan sallittua pyytää tuomareilta suoraa apua kivun lievittämiseksi loukkaantumisessa?],
  [Vaikka toimitsijoiden vastuulla on varmistaa turvalliset olosuhteet pelaajille, tämä ei sisällä henkilökohtaisen lääkintäavun antamista. Tuomarin ensisijainen vastuu tällaisissa tilanteissa on varmistaa lääkintähenkilöstön pääsy paikalle mahdollisimman nopeasti (noudattamalla Lääkintäapuprotokollaa).],
  ("17.1.2", "23.2.7"),
)

#case(
  "6.3.9",
  [Onko joukkueen sallittua pyytää lääkintäapua erien väliseksi ajaksi tai aikalisän ja teknisen aikalisän aikana?],
  [Kyllä. Tämä pyyntö on laillinen ja molempien toimitsijoiden tulisi aloittaa se mahdollisimman pian. Pelaajalla on oikeus pyytää ja sitten käyttää lääkintäapua heille osoitetuilla istuimilla koko erien välisen ajan (myös teknisten aikalisien ja aikalisien aikana).],
  "Tuomariohjeet ja -ohjeistukset",
)

#case(
  "6.3.10",
  [Jos puun oksa roikkuu aloitusalueen yläpuolella, ja tekninen delegaatti on aiemmin hyväksynyt tämän ja tiedottanut siitä virallisesti, tekeekö pelaaja virheen, kun hän heittää pallon ilmaan syöttöä varten ja pallo osuu oksaan?],
  [Pelaaja ei tee virhettä. Jos tekninen delegaatti hyväksyi nämä erityisolosuhteet ja tiedotti niistä virallisesti, 1. tuomarin tulisi määrätä syöttö uusittavaksi.],
  ("1.1", "8.4.2", "17.2"),
)

#case(
  "6.3.11",
  [Tilanteessa 22-22 1. erässä ja joukkueen B hyökkäyksen jälkeen joukkueen A puolustava pelaaja ohjaa pallon virheellisesti kohti oman kenttänsä takaosaa (lähelle päätyrajaa). Joukkueen A pari lähtee tavoittelemaan palloa, mutta ennen kuin hän saavuttaa sen, irtopallo tulee vapaa-alueelle mainosaitojen ja saman päätyrajan väliin, kaikkien pelaajien ja tuomarien näkyviin. Molemmat joukkueen B pelaajat reagoivat sanallisesti ja heiluttavat käsiään tuomareille pelialueelle tulevan ulkoisen pallon vuoksi, ja näin ollen epäröivät jatkaa pallorallia, viivyttävät liikkeitään ja menettävät keskittymisensä, mikä sallii joukkueen A lyödä pallon helposti kenttään joukkueen B puolella ja voittaa rallin. Päinvastoin joukkueen A pelaajat eivät missään vaiheessa kyseenalaistaneet irtopallon sijaintia, säilyttivät keskittymisensä eivätkä lopettaneet pelaamista. Vaikka molemmat tuomarit näkivät ulkoisen pallon tulevan pelialueelle rallin aikana sekä joukkueen B pelaajien eleet ja epäröinnin, 1. tuomari myönsi pisteen joukkueelle A, siirtäen tilanteeksi 23-22. (Valitettavasti kirjuri ei siirtänyt pisteitä, ja e-pöytäkirjassa tilanne pysyi 22-22:ssa). Seuranneet toimet johtivat 14 minuutin viivästykseen ottelussa ennen pelin jatkumista. Olisiko tuomarien pitänyt pysäyttää ralli ja uusia se, ja onko kummallakaan joukkueella perusteita vastalauseelle?],
  [Sääntö 17.2 toteaa, että "Jos pelin aikana ilmenee ulkoinen häiriö, peli on pysäytettävä ja palloralli pelattava uudelleen." Tässä tapauksessa molemmat tuomarit näkivät ulkoisen pallon tulevan pelialueelle, ja heidän olisi pitänyt pystyä tunnistamaan joukkueen B pelaajien vaatimus ja epäröinti, mutta silti molemmat tuomarit katsoivat, että toiminta ei häirinnyt peliä. Kuvattu tapaus viittaa ulkoiseen häiriöön, joten säännön suoraviivainen soveltaminen olisi ollut: keskeytä peli ja uusi ralli. Tämä olisi oikeuttanut joukkueen B lailliseen vastalauseprotokollapyyntöön säännön epäillyn väärintulkinnan vuoksi. Jos vastalause perustuu tähän tulkintakysymyksenä (judgment call) eikä säännön väärintulkintana/väärinsoveltamisena, tekninen delegaatti tuomarivalmentajan neuvosta ei voisi hyväksyä vastalauseprotokollaa. Tällä olisi vakavia taloudellisia seurauksia joukkueelle B (\$500). "Fiksu tuomarointi" edellyttää maalaisjärkeä. Jos reaktiota ei ole, mukaan lukien kun pelaajat eivät välitä siitä ja haluavat jatkaa pelaamista, silloin "fiksun tuomaroinnin" tulisi voittaa. Lopuksi, 14 minuutin viivästys liittyen tuomaripäätöksen kiistämiseen on täysin mahdotonta hyväksyä lajissamme.],
  ("16", "17", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "6.3.12",
  [Naisten pääsarjan ottelun aikana järjestelytoimikunta päätti pysäyttää kaikki ottelut ukkosmyrskyn vuoksi. Keskeytys kesti noin 1 tunnin. E-pöytäkirjaan kirjattu tulos keskeytyshetkellä 2. erässä oli 8-6 joukkueen A hyväksi, joukkueen A syöttäessä. Lämmittelyn lopussa ottelun jatkamiseksi, 1. tuomarin ollessa tornissa, joukkue B väitti ensin 2. tuomarille ja kirjurille, että tulos oli väärä, ja sitten kentältä käsin he puhuivat katsomossa olleelle TD/RC:lle sanoen, että he johtivat 8-6, eikä joukkue A. Valitus ei ollut virallinen vastalause. RC päätti mennä pyytämään 2. tuomaria tarkistamaan pöytäkirjan, ja muutaman sekunnin kuluttua 2. tuomari ilmoitti, että tulos oli oikein (8-6 joukkueelle A), ja että hän oli varma siitä. RC kertoi sitten joukkueelle B, että heidän oli jatkettava peliä, minkä he tekivät. Myöhemmin RC päätti ladata ottelun videotallenteen ja pöytäkirjan. Hän tajusi, että kun tilanne oli 7-6 joukkueen A hyväksi, joukkue A oli itse asiassa syöttänyt verkkoon. Tilanteen olisi pitänyt olla 7-7 keskeytyshetkellä joukkueen B syöttäessä. Tarkistamalla pöytäkirjan RC havaitsi, että kirjuri oli myöntänyt pisteen joukkueelle A vahingossa (tehden tilanteeksi 8-6 joukkueelle A). Kukaan kentällä ei tuolla hetkellä tajunnut virhettä, ja kaikki poistuivat ukkosmyrskykeskeytyksen vuoksi. RC:n olisi pitänyt käyttää vain pari minuuttia katsoakseen viralliselta videotallenteelta oikea tilanne ja syöttäjä.],
  [Kirjuri teki selvästi virheen e-pöytäkirjassa, kun joukkue B voitti rallin ja syötön joukkueen A virheellisen syötön jälkeen tilanteessa 7-6, joukkueiden vaihtaessa puolia vaaditusti (puoltenvaihto olisi pitänyt kirjata tilanteessa 7-7). Tapahtui useita muita menettelyvirheitä, jotka olisivat estäneet nolon tilanteen väärällä tuloksella ja väärällä syöttävällä joukkueella pelin jatkuessa. Näitä olivat: 1) välittömästi puoltenvaihdon jälkeen 2. ja 1. tuomari, ennen/tai lopulta sen jälkeen kun he poistuivat kentältä, eivät tarkistaneet kunnolla (kuten vaaditaan), että kaikki oli rekisteröity oikein e-pöytäkirjaan (oikealla tuloksella, oikealla syöttäjällä jne.) 2) kun joukkue B kyseenalaisti tuloksen, jo näin pitkän sääolosuhteista johtuvan tauon jälkeen, RC:n olisi pitänyt käyttää tilaisuus hyväkseen ja käyttää vain pari minuuttia katsoakseen viralliselta videotallenteelta oikea tilanne ja syöttäjä.],
  ("17.3.1", "23.2.3"),
)

#case(
  "6.4.1",
  [Jos erässä puoltenvaihto huomataan myöhässä pelaajien, kirjurin ja tuomarin toimesta, tulisiko pisteet korjata?],
  [Ei, pisteitä ei tule korjata. Joukkueiden on vaihdettava puolia heti, kun virhe on huomattu.],
  "18.2.2",
)

#case(
  "6.4.2",
  [Jos ottelun aikana pelin tahti kärsii monien TV:n uusintapyyntöjen vuoksi, mitä 1. tuomari voi tehdä?],
  [On tärkeää, että 1. tuomari sopivimmalla hetkellä välittää tämän tiedon tekniselle delegaatille (delegaateille). Vaikka ottelun toimitsijoiden vastuulla on työskennellä yhteistyössä TV-koordinaattorin ja hänen henkilökuntansa kanssa, he edustavat myös FIVB:tä (pelaajien toimitsijat jne.) ja virallisten sääntöjen henkeä. Tekniselle delegaatille tulisi ilmoittaa kaikista olosuhteista, joissa tuomari katsoo otteluolosuhteiden vaarantuvan. Tässä tilanteessa on myös asianmukaista, että 1. tuomari puhuu pelaajille ja selittää tilanteen.],
  ("16.1.3", "Tuomariohjeet ja -ohjeistukset"),
)
