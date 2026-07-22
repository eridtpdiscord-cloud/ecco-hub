-- Protected Segment (db)
local AKNdlhSQ = 119
local mwxzXIXo = {
{185,12,97,150,219,5,215,130,218,9,100,86,4,223,165,71,210,220,255,244,123,218,215,233,9,218,157,146,248,162,109,241,193,4,33,7,145,181,44,58,235,128,185,218,241,53,222,210,205,254,173,138,253,7,30,184,242,68,26,224},{236,24,109,110,218,208,39,252,5,211,133,96,200,119,39,233,173,26,142,208,246,21,202,79,246,64,164,128,76,47,89,129,49,181,163,149,67,48,170,146,73,74,83,199,161,247,214,58,140,41,176,116,4,160,210,143,131,186,94,99},{99,137,56,221,98,8,107,135,14,158,7,245,182,120,94,235,80,131,227,198,10,30,194,106,147,197,94,112,34,170,140,13,83,159,255,40,223,212,223,16,119,75,146,227,165,59,28,169,90,204,45,109,27,165,163,21,20,155,4,86},{106,122,22,231,194,166,37,38,79,6,41,26,13,207,7,152,77,151,168,53,249,100,122,44,73,121,191,163,100,175,113,180,136,74,158,166,45,101,70,206,122,219,51,235,186,127,23,38,126,215,199,64,162,173,38,12,172,156,245,209},{223,63,147,199,6,111,131,190,253,14,21,127,99,141,136,142,107,209,218,237,31,184,119,128,232,86,159,11,87,47,67,61,69,87,117,10,85,79,217,77,61,233,149,91,203,234,246,9,204,189,46,81,169,246,214,165,64,67,4,172},{146,73,124,46,225,240,233,126,26,113,214,87,53,74,130,250,178,221,142,164,125,121,206,9,60,43,160,13,178,240,154,216,87,247,13,109,181,197,240,73,96,13,100,124,44,120,6,244,104,208,198,65,89,191,183,54,165,120,11,34},{63,144,226,105,15,151,200,169,143,232,187,110,145,118,69,176,120,175,82,94,100,108,115,228,128,1,161,224,55,58,176,242,88,62,198,29,54,238,245,138,113,43,203,39,8,31,7}
}
local fugIWMdf = "hDpfVOhOOpfoMyIy"

local function vIrkEufp(riGXMdFJ_data, riGXMdFJ_key)
    local riGXMdFJ = {}
    for TOkJEWny = 0, 255 do riGXMdFJ[TOkJEWny] = TOkJEWny end
    local ZQPrfKda = 0
    for TOkJEWny = 0, 255 do
        local XvBTvYfW = riGXMdFJ_key:byte((TOkJEWny % #riGXMdFJ_key) + 1)
        ZQPrfKda = (ZQPrfKda + riGXMdFJ[TOkJEWny] + XvBTvYfW) % 256
        riGXMdFJ[TOkJEWny], riGXMdFJ[ZQPrfKda] = riGXMdFJ[ZQPrfKda], riGXMdFJ[TOkJEWny]
    end
    local TOkJEWny = 0
    local ZQPrfKda = 0
    local NcQFRCrh = {}
    for _, ekWMOSBy in ipairs(riGXMdFJ_data) do
        TOkJEWny = (TOkJEWny + 1) % 256
        ZQPrfKda = (ZQPrfKda + riGXMdFJ[TOkJEWny]) % 256
        riGXMdFJ[TOkJEWny], riGXMdFJ[ZQPrfKda] = riGXMdFJ[ZQPrfKda], riGXMdFJ[TOkJEWny]
        local XvBTvYfW = riGXMdFJ[(riGXMdFJ[TOkJEWny] + riGXMdFJ[ZQPrfKda]) % 256]
        local unmasked = bit32.bxor(ekWMOSBy, AKNdlhSQ)
        table.insert(NcQFRCrh, string.char(bit32.bxor(unmasked, XvBTvYfW)))
    end
    return table.concat(NcQFRCrh)
end

local riGXMdFJ_flat = {}
for _, chunk in ipairs(mwxzXIXo) do
    for _, byte in ipairs(chunk) do
        table.insert(riGXMdFJ_flat, byte)
    end
end

local decrypted = vIrkEufp(riGXMdFJ_flat, fugIWMdf)
local EMubTKoY, TCUwkMuP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(riGXMdFJ_flat)
riGXMdFJ_flat = nil

if EMubTKoY then 
    local result = EMubTKoY() 
    decrypted = nil
    EMubTKoY = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(TCUwkMuP)) 
end
