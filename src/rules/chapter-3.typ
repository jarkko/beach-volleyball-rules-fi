#import "../lib/utils.typ": *

= LUKU 3: PELITAPA

#rule("6", "PISTEEN SAAMINEN, ERÄN JA OTTELUN VOITTAMINEN")[
]

#subrule("6.1", "PISTEEN SAAMINEN")[
  #r("6.1.1")[Piste]
  Joukkue saa pisteen:
  #r("6.1.1.1")[saadessaan pallon koskettamaan vastapuolen kenttää;]
  #r("6.1.1.2")[jos vastapuolen joukkue tekee virheen;]
  #r("6.1.1.3")[jos vastapuolen joukkueelle määrätään rangaistus.]

  #r("6.1.2")[Virhe]
  Joukkue tekee virheen, kun se tekee näiden sääntöjen vastaisen pelisuorituksen (tai muuten rikkoo sääntöjä). Tuomarit arvioivat virheet ja määräävät niille rangaistukset näiden sääntöjen mukaan:
  #r("6.1.2.1")[Jos kaksi tai useampia virheitä tehdään peräkkäin, vain ensimmäinen niistä otetaan huomioon.]
  #r("6.1.2.2")[Jos molemmat joukkueet tekevät virheen samanaikaisesti, tuomitaan KAKSOISVIRHE, ja pallo pelataan uudelleen.]

  #r("6.1.3")[Palloralli ja päättynyt palloralli]
  Palloralliksi nimitetään sarjaa pelitapahtumia, jotka alkavat aloittajan aloituslyöntihetkestä ja päättyvät siihen, kun pallo on poissa pelistä. Päättynyt palloralli on sarja pelitapahtumia, joka johtaa pisteen saamiseen. Tämä pitää sisällään:
  - rangaistuksen saamisen
  - syötön menetyksen aloitusvirheen vuoksi.

  #r("6.1.3.1")[Jos aloituksen suorittanut joukkue voittaa pallorallin, se saa pisteen ja jatkaa aloittamista.]
  #r("6.1.3.2")[Jos aloituksen vastaanottanut joukkue voittaa pallorallin, se saa pisteen ja suorittaa seuraavan aloituksen.]
]

#subrule("6.2", "ERÄN VOITTAMINEN")[
  #refs("D9 (9)")
  Erän (paitsi ratkaisevan 3. erän) voittaa joukkue, joka ensin saavuttaa 21 pistettä vähintään kahden pisteen erolla vastapuoleensa. Jos tilanne on tasan 20-20, peli jatkuu kunnes saavutetaan kahden pisteen ero (22-20; 23-21; jne.).
]

#subrule("6.3", "OTTELUN VOITTAMINEN")[
  #refs("D9 (9)")
  #r("6.3.1")[Ottelun voittaa joukkue, joka ensin voittaa kaksi erää.]

  #r("6.3.2")[Kun erätilanne on 1-1, ratkaiseva erä (kolmas) pelataan 15 pisteeseen vähintään kahden pisteen erolla vastapuoleen.]
]

#subrule("6.4", "LUOVUTUS JA JOUKKUEEN JÄÄMINEN VAJAAKSI")[
  #r("6.4.1")[Jos joukkue kieltäytyy kehotuksen jälkeenkin pelaamasta, se julistetaan hävinneeksi ottelu luovutuksella, tuloksella 0-2 ja jokainen erä numeroin 0-21.]
  #refs("6.2", "6.3")

  #r("6.4.2")[Joukkueen, joka ilman asianmukaista syytä jää saapumatta pelipaikalle ajoissa, katsotaan luovuttaneen ottelun; seuraukset kuten edellä, säännössä 6.4.1.]

  #r("6.4.3")[Joukkue, joka todetaan VAJAAKSI erässä tai koko ottelussa menettää vastaavasti erän tai koko ottelun. Vastapuolelle annetaan erän tai ottelun voittoon tarvittavat pisteet, tai pisteet ja erät. Vajaaksi jäänyt joukkue säilyttää pisteensä ja eränsä.]
  #refs("7.3.1")
]

#rule("7", "PELIN RAKENNE")[
]

#subrule("7.1", "ARVONTA")[
  Ennen ottelua päätuomari suorittaa arvonnan ensimmäisen erän ensimmäisen aloittajan ja kenttäpuolten määräämiseksi. Jos joudutaan ratkaisevaan erään, arvonta suoritetaan uudelleen.
  #refs("12.1.1")

  #r("7.1.1")[Arvonnassa ovat mukana joukkueiden kapteenit.]

  #r("7.1.2")[Arvonnan voittaja valitsee JOKO:]
  a) aloituksen tai aloituksen vastaanoton, TAI
  b) kenttäpuolen.
  Hävinnyt saa jäljelle jäävän valinnan.
]

#subrule("7.2", "LÄMMITTELY ENNEN OTTELUA")[
  Ennen ottelun alkua kummallakin joukkueella on käytettävissään verkkolämmittelyyn 3 minuuttia, jos heillä on ollut käytössään muu pelikenttä lämmittelyyn, mutta 5 minuuttia, jos ei ole.
]

#subrule("7.3", "JOUKKUEEN KOKOONPANO")[
  #r("7.3.1")[Molempien pelaajien on oltava pelissä koko ajan.]
]

#subrule("7.4", "SIJOITTUMISET")[
  #refs("D4", "12.2.2")
  Aloitushetkellä molempien joukkueiden on oltava omalla kenttäpuolellaan (aloittajaa lukuun ottamatta).

  #r("7.4.1")[Pelaajat voivat olla millä tahansa paikalla kenttäpuolellaan (ei määrättyjä pelipaikkoja).]
]

#subrule("7.5", "SIJOITTUMISVIRHE")[
  #r("7.5.1")[Sijoittumisvirheitä EI OLE.]
]

#subrule("7.6", "SYÖTTÖJÄRJESTYS")[
  #r("7.6.1")[Joukkueen aloituskokoonpano määrää sen syöttöjärjestyksen. Tätä järjestystä on noudatettava koko erän ajan.]
  #refs("5.1.1")

  #r("7.6.2")[Kun aloituksen vastaanottanut joukkue on saanut aloitusoikeuden, sen pelaajat suorittavat kiertovaihdon: pelaaja, joka ei syöttänyt edellisellä kerralla, suorittaa aloituksen.]
]

#subrule("7.7", "VÄÄRÄ SYÖTTÖJÄRJESTYS")[
  #r("7.7.1")[Virhe syöttöjärjestyksessä tapahtuu, kun aloitusta ei suorita se pelaaja, jonka vuoro on syöttää. Joukkuetta rangaistaan antamalla piste ja seuraava aloitus vastapuolelle.]
  #refs("D9 (13)")

  #r("7.7.2")[Kirjurin on valvottava syöttöjärjestystä ja ilmoitettava virheestä tuomareille ennen aloitusvihellystä.]
]

