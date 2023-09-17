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

licznik = 0
koleczko = false

function doPrzodu()
    if licznik <= iloscKrokow then
        Note("krok numer: " ..licznik)
Send(sciezka[licznik])
licznik += 1
    else 
        if koleczko == true then
Note("kolejne koleczko")
licznik = 0
doPrzodu()
        end
end
end

function doTylu()
    if licznik >= 0 then
licznik -= 1
wyjscie = sciezka[licznik]
odwrotny = kierunki[wyjscie]
Note("idziesz na " ..odwrotny)
Send(odwrotny)
end
end

function regeneruj()
    Note("rozpoczynam regeneracje")
doTylu()
do tylu()
    AddTimer("regeneracja-many", 0, 0, 11, "mwypowiedz odnowienie mocy z ksiegi wskazujac siebie", timer_flag.Enabled + timer_flag.OneShot, "")
    EnableGroup("regen", true)
end

function koniecRegeneracji()
    EnableGroup("regen", false)
    nastepnaSekwencja()
Note("zakonczylem regeneracje, ide dalej")
end

function nastepnaSekwencja()
doPrzodu()
Send(cel)
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
EnableGroup("")
end

function koniec()
Note("koniec expa, biegne do konca sciezki")
    EnableGroup("powrot", true)
end

function powrot()
if licznik <= iloscKrokow then
Send(sciezka[licznik])
else
    EnableGroup("powrot", false)
end
end