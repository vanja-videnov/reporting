
def napravi_sifarnik_tip identifikator
  SifarnikTip.create! identifikator: identifikator
end

def napravi_sifarnik(type, nazivi)
  nazivi.split("\n").each do |identifikator|
    Sifarnik.create! tip_id: type.id, identifikator: identifikator, aktivno: true
  end
end

nazivi = <<END
muški
ženski
END
puts 'Napravljen sifarnik pol' if napravi_sifarnik(napravi_sifarnik_tip('pol'), nazivi)

nazivi = <<END
Direktni učesnik (odgovorno lice)
Direktni učesnik (osoba koja je pozvana u pomoć)
Indirektni učesnik (posmatrač ili mlađi lekar)
END
puts 'Napravljen sifarnik tip_ucesnika' if napravi_sifarnik(napravi_sifarnik_tip('tip_ucesnika'), nazivi)

nazivi = <<END
1-10
10-18
18-40
40-60
60-80
Preko 80
END
puts 'Napravljen sifarnik starost' if napravi_sifarnik(napravi_sifarnik_tip('starost_bolesnika'), nazivi)

nazivi = <<END
I
II
III
IV
V
hitan pacijent
END
puts 'Napravljen sifarnik asa klasifikacija' if napravi_sifarnik(napravi_sifarnik_tip('asa_klasifikacija'), nazivi)

nazivi = <<END
Univerzitetska bolnica
Klinicki centar
Specijalizovana bolnica
Zdravstveni centar
Privatna bolnica
END
puts 'Napravljen sifarnik tip ustanove' if napravi_sifarnik(napravi_sifarnik_tip('tip_ustanove'), nazivi)

nazivi = <<END
Operaciona sala
Jedinica intenzivnog lečenja
Dijagnostička ordinacija (bronhoskopije, kolonoskopije, LMS is l)
Dnevna hirurgija
END
puts 'Napravljen sifarnik mesto dogadjaja' if napravi_sifarnik(napravi_sifarnik_tip('mesto'), nazivi)

nazivi = <<END
Organizacioni propust
Ljudska greška: greška tokom lečenja, greška u dijagnostici
Tehnički problem sa opremom (kvar aparata, nestanak struje, nestanak dovoda gasova, odsustvo obavezne opreme)
Nepredviđena komplikacija lečenja bolesnika (otežani disajni put, postojanje oboljenja koje nije prepoznato ili registrovano pre operacije, izostanak ključne informacije od strane pacijenta)
END
puts 'Napravljen sifarnik tip incidenta' if napravi_sifarnik(napravi_sifarnik_tip('tip_incidenta'), nazivi)

# nazivi = <<END
# Ljudstvo
# Oprema
# Primena lekova
# END
# puts 'Napravljen sifarnik faktora koji su doprineli dogadjaju' if napravi_sifarnik(napravi_sifarnik_tip('faktori'), nazivi)

nazivi = <<END
Nedovoljna obučenost
Loša komunikacija
Preopterećenost
END
puts 'Napravljen sifarnik faktora ljudstva' if napravi_sifarnik(napravi_sifarnik_tip('ljudstvo'), nazivi)

nazivi = <<END
Neadekvatna
Neispravna
Zastarela
Nedostatak adekvatnog monitoringa
Iznenadni kvar
END
puts 'Napravljen sifarnik faktora opreme' if napravi_sifarnik(napravi_sifarnik_tip('oprema'), nazivi)

nazivi = <<END
Pogrešan lek
Pogrešna doza
Pogrešan put primene
Loše obeležavanje
Loše funkcionisanje tima prilikom davanja lekova
Nedostatak adekvatnog leka
END
puts 'Napravljen sifarnik faktora lekova' if napravi_sifarnik(napravi_sifarnik_tip('primena_lekova'), nazivi)

nazivi = <<END
Nista nije preduzeto
Prepoznati su uzroci koji su doveli do incidenta, ali ništa nije preduzeto u svakodnevnom radu
Unapredjen je postupak lečenja
Implementirani su novi protokoli lečenja
Nabavljena je nova oprema
Nabavljeni su potrebni lekovi i potrošni materijal
Unapređen je način korišćenja postojeće opreme i materijala
Edukacija zaposlenih
Incident je zataškan i o njemu se ni na koji način ne govori
END
puts 'Napravljen sifarnik preduzetih mera' if napravi_sifarnik(napravi_sifarnik_tip('preduzeto'), nazivi)

nazivi = <<END
Bez vidljivog lošeg ishoda po pacijenta
Iznenadni prijem u jedinicu intenzivnog lečenja
Produženo lečenje bez komplikacija
Produženo lečenje sa komlikacijama
Dugotrajno oštrećenje
Smrt
END
puts 'Napravljen sifarnik ishoda' if napravi_sifarnik(napravi_sifarnik_tip('ishod'), nazivi)

nazivi = <<END
Problem se razrešio tokom vremena (sistemsko razrešenje)
Sreća
Pravovremena reakcija ordinirajućeg lekara
Dobra komunikacija medju lekarima i timom uključenim u lečenje
Dobra komunikacija sa pacijentom
Dobra komunikacija sa porodicom pacijenta
END
puts 'Napravljen sifarnik uticaja na razresenje' if napravi_sifarnik(napravi_sifarnik_tip('uticaj_na_razresenje'), nazivi)

nazivi = <<END
Da se razgovara o tome šta može da se desi
Da indirektno dobijem informaciju da li sam negde pogrešio/la
Lakše mi je kad podelim sa nekim (ne mogu to da uradim u kolektivu gde radim)
Da se iskoristi u obrazovne svrhe
Da se iskoristi za podizanje svesti o tome šta sve moše da se dogodi
Da se preduzmu neke mere koje će sprečiti ovakve događaje
Da se dobije informacija o tome koja su moja prava i odgovornosti u ovim i sličnim slučajevima
Ne znam
Ništa
END
puts 'Napravljen sifarnik ocekivanja' if napravi_sifarnik(napravi_sifarnik_tip('ocekivanje'), nazivi)
