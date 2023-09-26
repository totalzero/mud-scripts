fanty = 0
minuty = 0
czasNaFant = 0

function sprawdzPostepy()
Send("postepy")
minuty = minuty + 1
end

function zaliczFanta()
Note("zdobywasz fantastyczne postepy")
Send("postepy wyczysc")
czasNaFant = minuty
minuty = 0
fanty = fanty + 1
end

function fantyInfo()
Note("ilosc fantastycznych postepow: "..fanty)
Note("zajelo ci to: "..czasNaFant.." minut ")
if czasNaFant > 0 then
    postepNaMinute = czasNaFant /17
    Note("czas na postep: "..postepNaMinute.." minut")
end
end

function fantyOn()
    EnableGroup("fanty", true)
    Note("licznik fantow uruchomiony")
end

function fantyOff()
    fanty = 0
minuty = 0
czasNaFant = 0

    EnableGroup("fanty", false)
    Note("wylaczam licznik fantow")
end