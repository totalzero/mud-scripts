cel = ""
rozkazy = false

function ustawCel(n, l, w)
cel = table.concat(w)
Note("ustawiono cel:"..cel)
end

function odpalCel()
    Note("wskaz "..cel.." jako cel ataku")
    Note("zabij cel ataku")
    if rozkazy == true then
        Note("rozkaz druzynie zabij cel ataku")
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