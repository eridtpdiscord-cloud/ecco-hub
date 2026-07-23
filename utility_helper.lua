-- Protected Segment (utility_helper)
local iIvsHyUW = 138
local KqBTGOii = {
{77,236,231,13,202,67,10,82,132,15,227,133,200,104,83,109,0,9,41,203,12,126,191,9,62,56,235,76,199,254,33,50,11,25,112,6,151,133,28,97,201,72,40,126,16,99,71,80,98,29,115,175,50,30,216,177,238,82,109,150},{90,32,163,47,36,220,214,66,128,165,109,147,53,14,64,62,241,133,214,125,146,161,100,92,44,82,191,133,128,55,103,167,62,101,213,22,7,247,241,255,97,66,246,246,233,176,126,28,231,192,26,148,183,193,92,242,234,54,92,56},{64,116,200,84,95,48,142,52,170,227,159,227,38,241,19,142,68,109,200,214,156,90,170,175,232,67}
}
local HVWUhLsW = "GGFIQJoscLafSwHn"

local function nWyeSLxt(TmOqyhcd_data, TmOqyhcd_key)
    if type(TmOqyhcd_key) ~= "string" or #TmOqyhcd_key == 0 then return "" end
    local TmOqyhcd = {}
    for aoXHHMLV = 0, 255 do TmOqyhcd[aoXHHMLV] = aoXHHMLV end
    local exTiJoHC = 0
    for aoXHHMLV = 0, 255 do
        local ORZsNqcL = TmOqyhcd_key:byte((aoXHHMLV % #TmOqyhcd_key) + 1)
        exTiJoHC = (exTiJoHC + TmOqyhcd[aoXHHMLV] + ORZsNqcL) % 256
        TmOqyhcd[aoXHHMLV], TmOqyhcd[exTiJoHC] = TmOqyhcd[exTiJoHC], TmOqyhcd[aoXHHMLV]
    end
    local aoXHHMLV = 0
    local exTiJoHC = 0
    local cKjtJWlq = {}
    for _, LEORFBpP in ipairs(TmOqyhcd_data) do
        aoXHHMLV = (aoXHHMLV + 1) % 256
        exTiJoHC = (exTiJoHC + TmOqyhcd[aoXHHMLV]) % 256
        TmOqyhcd[aoXHHMLV], TmOqyhcd[exTiJoHC] = TmOqyhcd[exTiJoHC], TmOqyhcd[aoXHHMLV]
        local ORZsNqcL = TmOqyhcd[(TmOqyhcd[aoXHHMLV] + TmOqyhcd[exTiJoHC]) % 256]
        local unmasked = bit32.bxor(LEORFBpP, iIvsHyUW)
        table.insert(cKjtJWlq, string.char(bit32.bxor(unmasked, ORZsNqcL)))
    end
    return table.concat(cKjtJWlq)
end

local TmOqyhcd_flat = {}
for _, chunk in ipairs(KqBTGOii) do
    for _, byte in ipairs(chunk) do
        table.insert(TmOqyhcd_flat, byte)
    end
end

local decrypted = nWyeSLxt(TmOqyhcd_flat, HVWUhLsW)
local yOXIcJUO, chFWrOuL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(TmOqyhcd_flat)
TmOqyhcd_flat = nil

if yOXIcJUO then 
    local result = yOXIcJUO() 
    decrypted = nil
    yOXIcJUO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(chFWrOuL)) 
end
