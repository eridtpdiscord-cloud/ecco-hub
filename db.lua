-- Compiled secure segment
local bKpmwsdK = {
{176,174,89,16,152,188,157,169,198,133,119,133,161,20,219,46,206,221,144,167,69,237,193,38,41,40,183,121,86,218,186,191,134,95,16,245,244,11,35,159,34,177,142,170,206,44,56,61,142,178,67,133,47,118,11,188,228,101,179,135},{33,245,233,21,87,201,64,239,52,213,49,187,229,197,242,34,172,238,53,245,189,117,17,83,213,127,144,132,52,147,163,77,168,96,213,109,202,5,235,177,140,189,186,253,159,186,229,225,69,53,50,232,61,174,129,175,124,235,142,85},{47,25,57,217,111,119,175,95,127,175,141,125,67,67,214,165,201,206,39,112,106,89,122,116,101,67,156,41,126,202,132,75,100,81,103,163,144,254,111,67,194,81,53,127,132,132,161,250,186,174,188,96,142,22,54,199,48,71,23,17},{89,198,210,52,224,164,17,195,198,3,29,86,130,169,230,231,216,42,44,147,54,225,236,120,153,103,118,227,54,92,80,224,104,30,185,152,176,167,90,173,197,60,136,94,213,143,234,141,157,41,129,135,152,31,178,171}
}
local BONpJJoJ = "AheMoShrohgSqbIf"

local function cvIdOSVL(UYOZhWkT_data, UYOZhWkT_key)
    local UYOZhWkT = {}
    for PYGCiccZ = 0, 255 do UYOZhWkT[PYGCiccZ] = PYGCiccZ end
    local hIkPxMNl = 0
    for PYGCiccZ = 0, 255 do
        local mSnBaOfU = UYOZhWkT_key:byte((PYGCiccZ % #UYOZhWkT_key) + 1)
        hIkPxMNl = (hIkPxMNl + UYOZhWkT[PYGCiccZ] + mSnBaOfU) % 256
        UYOZhWkT[PYGCiccZ], UYOZhWkT[hIkPxMNl] = UYOZhWkT[hIkPxMNl], UYOZhWkT[PYGCiccZ]
    end
    local PYGCiccZ = 0
    local hIkPxMNl = 0
    local Ifmopyqm = {}
    for _, qClvETwX in ipairs(UYOZhWkT_data) do
        PYGCiccZ = (PYGCiccZ + 1) % 256
        hIkPxMNl = (hIkPxMNl + UYOZhWkT[PYGCiccZ]) % 256
        UYOZhWkT[PYGCiccZ], UYOZhWkT[hIkPxMNl] = UYOZhWkT[hIkPxMNl], UYOZhWkT[PYGCiccZ]
        local mSnBaOfU = UYOZhWkT[(UYOZhWkT[PYGCiccZ] + UYOZhWkT[hIkPxMNl]) % 256]
        table.insert(Ifmopyqm, string.char(bit32.bxor(qClvETwX, mSnBaOfU)))
    end
    return table.concat(Ifmopyqm)
end

local UYOZhWkT_flat = {}
for _, chunk in ipairs(bKpmwsdK) do
    for _, byte in ipairs(chunk) do
        table.insert(UYOZhWkT_flat, byte)
    end
end

local decrypted = cvIdOSVL(UYOZhWkT_flat, BONpJJoJ)
local KQHGyFiW, pBqZfyIj = loadstring(decrypted)
if KQHGyFiW then 
    return KQHGyFiW() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(pBqZfyIj)) 
end
