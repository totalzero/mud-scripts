sciezka = {
    "w",
    "w",
    "w",
    "w",
    "nw",
    "e",
    "e",
    "e",
    "e",
    "e",
    "se",
    "n",
    "se",
    "n",
    "se",
    "n",
    "se",
    "n",
    "e",
    "ne",
    "w",
    "w",
    "w",
    "w",
    "w",
    "sw",
    "nw",
    "w",
    "w",
    "w",
    "d",
    "n",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "s",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "sw",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "s",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "n",
    "n",
    "u",
    "w",
    "w",
    "ne",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "e",
    "nw",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "w",
    "s",
    "se",
    "se",
    "se",
    "e"
}
iloscKrokow = 96
cel = "zabij marynarza"
kierunki = {
    ["u"] = "d",
["d"] = "u",
["n"] = "s",
["s"] = "n",
["w"] = "e",
["e"] = "w",
["ne"] = "sw",
["sw"] = "ne",
["se"] = "nw",
["nw"] = "se"
}

licznik = 1
koleczko = false
regenerujemy = false
listacelow = {"zabij splugawionego marynarza", "zabij marynarza"}
ktorycel = 1
ilosccelow = 2

function delay()
DoAfter(3, listacelow[ktorycel])
end

function nastepnyCel()
ktorycel = ktorycel + 1
nastepnaSekwencja()
end

function doPrzodu()
    if licznik <= iloscKrokow then
        Note("krok numer: "..licznik)
Send(sciezka[licznik])
licznik = licznik +1
    else 
        if koleczko == true then
Note("kolejne koleczko")
licznik = 1
delay()
        end
end
end

function doTylu()
if regenerujemy == false then
    if licznik > 1 then
licznik = licznik -1
wyjscie = sciezka[licznik]
odwrotny = kierunki[wyjscie]
Note("idziesz na "..odwrotny)
Send(odwrotny)
end
end
end

function regeneruj()
    Note("rozpoczynam regeneracje")
    doTylu()
doTylu()
regenerujemy = true
DoAfter(180, "zabij marynarza")
AddTimer ("regen_czar", 0, 0, 10.5, "mwypowiedz odnowienie mocy z ksiegi wskazujac siebie", 
          timer_flag.Enabled + timer_flag.OneShot, "")
        end

function koniecRegeneracji(name)
    nastepnaSekwencja()
Note("zakonczylem regeneracje, ide dalej")
end

function nastepnaSekwencja()
regenerujemy = false
if ktorycel < 3 then
delay()
else
ktorycel = 1
    Note("ide dalej")
    doPrzodu()
end
end

function koleczkoOn()
koleczko = true
Note("uruchamiam koleczko")
end

function koleczkoOff()
koleczko = false
Note("wylaczam koleczko")
end

function regenOn()
EnableGroup("regen_czujnik", true)
Note("uruchamiam czujnik regeneracji")
end

function regenOff()
Note("wylaczam czujnik regeneracji")
EnableGroup("regen_czujnik", false)
end

function start()
Note("rozpoczynam expy")
licznik = 1
koleczko = false

EnableGroup("sekwencja", true)
delay()
end

function koniec()
Note("koniec expa, biegne do konca sciezki")
EnableGroup("sekwencja", false)
    EnableGroup("powrot", true)
end

function powrot()
if licznik <= iloscKrokow then
Send(sciezka[licznik])
licznik = licznik +1
else
    EnableGroup("powrot", false)
end
end

function bij()
Send(cel)
end

function wstrzymaj()
    EnableGroup("sekwencja", false)
    ResetTimers()
    Note("wstrzymuje expa")
end

function wznow()
    EnableGroup("sekwencja", true)
    nastepnaSekwencja()
    Note("wznawiam expa")
end

function uciekaj()
        EnableGroup("ucieczka", true)
        Note("o kurwa!!! S P I E R D A A A A L A M Y")
end

function ucieczka()
if licznik >= 1 then
    doTylu()
else
    EnableGroup("ucieczka", false) 
    Note("bylo blisko")
end
end

function koniecExpaOn()
ResetTimers()
EnableGroup("koniecexpa", true)
ResetTimers()
Note("uruchomiono odliczanie do konca expa")
end

function koniecExpaOff()
EnableGroup("koniecexpa", false)
Note("wstrzymano odliczanie czasu do konca expa")
end

function konczymy()
koniec()
DoAfter(305, "zakoncz")
EnableGroup("koniecexpa", false)
Note("uwaga!!! za 300 sekund nastapi wylogowanie")
end
