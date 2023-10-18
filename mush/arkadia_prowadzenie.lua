cel = ""
rozkazy = false
zaslona = ""
puszczanie = false

function ustawCel(n, l, w)
cel = table.concat(w)
Note("ustawiono cel:"..cel)
end

function odpalCel()
    Send("wskaz "..cel.." jako cel ataku")
    Send("zabij cel ataku")
    if rozkazy == true then
        Send("rozkaz druzynie zaatakowac cel ataku")
    end
end

function rozkazyOn()
rozkazy = true
Note("rozkazy gotowe")
end

function rozkazyOff()
    rozkazy = false
Note("wylaczam rozkazy")
end

function ustawZaslone(n, l, w)
zaslona = table.concat(w)
Note("ustawiam cel obrony na: "..zaslona)
Send("wskaz "..zaslona.." jako cel obrony")
if rozkazy == true then
Send("rozkaz druzynie zaslonic cel obrony")
end
end

function puszczanieOn()
puszczanie = true
EnableGroup("puszczanie", true)
Note("puszczanie zaslon wlaczylem")
end

function puszczanieOff()
    EnableGroup("puszczanie", false)
puszczanie = false
Note("puszczanie zaslon wylaczylem")
end

function przestanZaslaniac()
    if puszczanie == true then
Send("przestan zaslaniac")
    end
end