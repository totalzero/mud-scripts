cel = ""
rozkazy = false
zaslona = ""

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