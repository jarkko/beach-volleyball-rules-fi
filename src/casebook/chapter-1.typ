#import "../lib/utils.typ": *

= LUKU 1

#case(
  "1.1.1",
  [Jos ottelun aikana pelaaja löytää vaarallisen esineen hiekan alta, täytyykö tuomarin pysäyttää peli ja antaa tarkistaa kenttä ennen pelin jatkamista?],
  [Kyllä, pelaajien turvallisuuden tulee aina olla etusijalla.],
  ("1.2.1", "1.2.3", "D1a", "D1b", "D2"),
)

#case(
  "1.1.2",
  [Onko tuomarilla lupa viivästyttää ottelua, jos kentän kulmissa käytetään metalliankkureita ja metallivaijerit kiinnittävät tolpan ja verkon?],
  [Kyllä. Ottelua edeltävässä tarkastuksessa hänen tulee aina huomioida pelaajien turvallisuus.],
  ("1.2.1", "1.2.3", "1.3.2", "D1a", "D1b", "D2"),
)

#case(
  "1.1.3",
  [Jos pelaaja vetää pelin aikana kentän rajaa niin, että yksi ankkureista irtoaa, tulisiko tuomarin pysäyttää peli?],
  [Kyllä, päätuomarin tulee välittömästi viheltää ja määrätä palloralli pelattavaksi uudelleen, koska kenttä ei ole säännön 1.1.1 mukainen. Kaikki osat tulee korjata ennen pelin jatkamista.],
  "1.1.1",
)

#case(
  "1.1.4",
  [Pelaaja loukkaa itsensä osuessaan ankkuriin niin, ettei pysty jatkamaan peliä. Mitä tuomarin olisi pitänyt tehdä etukäteen estääkseen tilanteen alun perin?],
  [Tuomarien olisi pitänyt ottelua edeltävässä kenttätarkastuksessaan havaita tämä mahdollinen vaara pelaajille ja ratkaista ongelma.],
  ("1.2.1", "1.3.2"),
)

#case(
  "1.1.5",
  [Onko kapteenin sallittua valittaa päätuomarille, että kenttä tulisi lanata ja tasoittaa oikein vaaran välttämiseksi molemmille joukkueille?],
  [Kyllä, kapteenilla on oikeus kysyä tuomarilta. Tuomarin tulisi aluksi varmistaa joukkueen pyynnön oikeellisuus ja sallia lanaus, jos tarkastus paljastaa kapteenin valituksen olevan perusteltu.],
  "1.2.1",
)

#case(
  "1.1.6",
  [Syöttämään menevä pelaaja seisoo mainosaitojen välissä, jotka eivät ympäröi kenttää kokonaan. Voiko tuomari antaa luvan syöttöön, kun pelaaja seisoo mainosaitojen linjan ulkopuolella?],
  [Ei, päätuomari ei saa antaa lupaa syöttöön, vaan hänen tulisi vaatia pelaajaa siirtymään mainosaitojen linjan sisäpuolelle.],
  ("1.1.1", "1.1.2"),
)

#case(
  "1.1.7",
  [Rankkasateen aikana molemmat kapteenit pyytävät päätuomaria pysäyttämään pelin. Mitä tuomarin tulisi tehdä?],
  [Beach volleyssa päätöksen pelin pysäyttämisestä tekee turnauksen järjestelytoimikunta. Vain jos heitä ei ole tavoitettavissa ja tuomari ennakoi merkittävän vaaran pelaajille salamoinnista tai äkillisistä tuulenpuuskista, hän voi pysäyttää pelin ja pyytää pelaajia menemään penkeilleen.],
  ("22.2.3", "22.2.5", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "1.1.8",
  [Kapteeni, sen jälkeen kun päätuomari on kieltäytynyt hänen pyynnöstään kastella kentät ennen ottelua, ottaa myöhemmin itse vesiletkun ja alkaa kastella kenttää omalla puolellaan. Mikä tulisi olla päätuomarin reaktio?],
  [Aluksi päätuomari olisi voinut pyytää teknistä delegaattia tekemään päätöksen ennen ottelua. Ottelun aikana kaikki kentän kastelut voidaan hoitaa tuomarin toimesta erien välillä / aikalisällä / teknisellä aikalisällä, mutta se tulee suorittaa niin, ettei ottelu viivästy, ja sen tulee hyödyttää molempia joukkueita tasapuolisesti. Pelaajaa tulisi rangaista (olettaen, ettei aiempia viivytysrangaistuksia ole) aluksi tuomarien pyyntöjen huomiotta jättämisestä (viivytysvaroitus) ja sitten myöhemmin ottelun viivyttämisestä kenttää kastelemalla (viivytysrangaistus).],
  ("18.2.2", "18.2.3", "22.2.3", "22.2.5", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "1.1.9",
  [Voiko kapteeni protestoida päätuomarille hiekan kuumuudesta pelin aikana, ja täytyykö päätuomarin hyväksyä tällainen protesti?],
  [Päätuomarin olisi pitänyt tehdä parhaansa estääkseen vastalauseprotokollan tarpeen tällaisessa tilanteessa. Hänen olisi pitänyt arvioida hiekan olosuhteet tehden oman arvionsa peliolosuhteista. Jos hän ja joukkue ovat yhtä mieltä siitä, että peliolosuhteet ovat liian vaikeat, hänen tulisi pyytää tekniseltä delegaatilta valtuutus lyhyelle keskeytykselle kentän kastelemiseksi.],
  ("1.1", "1.3", "5.1.2", "5.1.2.2"),
)

#case(
  "1.2.1",
  [Voiko kapteeni lämmittelyn aikana pyytää tuomaria tarkistamaan verkon korkeuden ja kireyden?],
  [Kyllä, hän voi pyytää, ja tuomarien tulisi nopeasti tarkistaa verkko uudelleen.],
  ("22.2.5", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "1.2.2",
  [Mitä tuomarin tulisi tehdä, jos kapteeni ottelun aikana kertoo hänelle verkon olevan liian matalalla ja pyytää häntä tarkistamaan verkon?],
  [Tuomarien tulisi tarkistaa verkko, pyytää kenttäpäällikköä korjaamaan se tarvittaessa, ja jatkaa ottelua.],
  ("22.2.5", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "1.2.3",
  [Jos päätuomari on kytketty TV-mikrofoneihin ja -kuulokkeisiin, ja peli viivästyisi, jos hän laskeutuisi tuomaritornista suorittamaan arvonnan 2. ja 3. erän välillä, voiko verkkotuomari suorittaa tämän arvonnan?],
  [Kyllä, verkkotuomari voi suorittaa 3. erän kolikonheiton. Päätuomarin tulisi selittää tilanne ensimmäisessä kolikonheitossa ja pyytää asianomaiselta tekniseltä delegaatilta lupa sen valtuuttamiseen.],
  ("7.1", "22.3.1.2", "23.2.9", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "1.3.1",
  [Jos turnauksessa käytetään 10 pelikenttää, ja palloista ja avustavista toimitsijoista on pulaa, voidaanko joillakin kentillä käyttää 1 pallon järjestelmää?],
  [Kyllä, turnauksen teknisen delegaatin luvalla ja selkeällä selityksellä asianomaisille pelaajille siitä, mitä pallolle tehdään pallorallien välillä.],
  "3.3",
)

#case(
  "1.3.2",
  [Jos turnauksessa lämpötila on erittäin korkea, onko kapteenilla siinä tapauksessa lupa pyytää päätuomaria tarkistamaan pallon paine?],
  [Kyllä, päätuomarin tulisi pyytää verkkotuomaria tarkistamaan pallo, koska jos pallo altistuu suoralle auringonvalolle pitkiä aikoja, sen paine muuttuu merkittävästi.],
  ("1.5", "Tuomariohjeet ja -ohjeistukset"),
)

#case(
  "1.3.3",
  [Mitä tuomarin tulisi tehdä, jos pallo kastuu pelin aikana?],
  [Tuomarien on varmistettava, ettei pallo tule kovin märäksi tai kosteaksi, mikä muuttaisi sen painetta ja painoa. Joten jokaista erää varten tulisi olla saatavilla toinen setti palloja.],
  ("3.1", "3.2"),
)

#case(
  "1.3.4",
  [Jos verkkotuomari huomaa ottelun aikana, että käytössä on 5 ottelupalloa, mikä tulisi olla hänen reaktionsa?],
  [On selvästi verkkotuomarin vastuulla valvoa ottelupallojen käyttöprosessia. Verkkotuomarin tulisi: 1) aluksi tarkistaa, että neljä ottelupalloa on valmiina käytettäväksi ottelun alussa; 2) aina varmistaa, että vähintään 1 sopiva varapallo on saatavilla, joten hänen tulisi ottaa 1 ottelupallo takaisin pöydälle.],
  "3.3",
)
