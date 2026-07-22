-- Protected Segment (utility_helper)
local mFGNVGIN = 171
local XkQtEuLf = {
{254,224,196,100,68,190,106,164,186,51,220,234,51,115,139,42,5,240,100,47,181,128,154,221,90,120,209,131,227,158,47,89,234,255,32,67,216,103,64,198,222,219,132,155,52,251,101,171,139,170,233,235,213,108,63,173,61,87,209,6},{186,158,216,76,116,251,49,190,194,26,168,2,5,159,196,252,12,61,171,2,114,49,219,58,255,130,118,203,180,166,41,236,112,69,34,198,208,216,33,20,225,123,82,199,62,92,3,154,74,130,24,94,64,96,83,159,213,152,3,61},{127,109,65,113,62,114,202,188,244,3,207,142,57,122,6,253,159,32,190,125,148,124,170,210,79,247}
}
local HgjJTMuS = "fxZadlRbVyZNKRVB"

local function oVxPUosK(AgLpzXIH_data, AgLpzXIH_key)
    local AgLpzXIH = {}
    for BuVrlOvS = 0, 255 do AgLpzXIH[BuVrlOvS] = BuVrlOvS end
    local QBSuwmIC = 0
    for BuVrlOvS = 0, 255 do
        local KwskQLlE = AgLpzXIH_key:byte((BuVrlOvS % #AgLpzXIH_key) + 1)
        QBSuwmIC = (QBSuwmIC + AgLpzXIH[BuVrlOvS] + KwskQLlE) % 256
        AgLpzXIH[BuVrlOvS], AgLpzXIH[QBSuwmIC] = AgLpzXIH[QBSuwmIC], AgLpzXIH[BuVrlOvS]
    end
    local BuVrlOvS = 0
    local QBSuwmIC = 0
    local pxpNwWru = {}
    for _, yBXtKnsm in ipairs(AgLpzXIH_data) do
        BuVrlOvS = (BuVrlOvS + 1) % 256
        QBSuwmIC = (QBSuwmIC + AgLpzXIH[BuVrlOvS]) % 256
        AgLpzXIH[BuVrlOvS], AgLpzXIH[QBSuwmIC] = AgLpzXIH[QBSuwmIC], AgLpzXIH[BuVrlOvS]
        local KwskQLlE = AgLpzXIH[(AgLpzXIH[BuVrlOvS] + AgLpzXIH[QBSuwmIC]) % 256]
        local unmasked = bit32.bxor(yBXtKnsm, mFGNVGIN)
        table.insert(pxpNwWru, string.char(bit32.bxor(unmasked, KwskQLlE)))
    end
    return table.concat(pxpNwWru)
end

local AgLpzXIH_flat = {}
for _, chunk in ipairs(XkQtEuLf) do
    for _, byte in ipairs(chunk) do
        table.insert(AgLpzXIH_flat, byte)
    end
end

local decrypted = oVxPUosK(AgLpzXIH_flat, HgjJTMuS)
local gQEoUfgj, dsGWezNE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(AgLpzXIH_flat)
AgLpzXIH_flat = nil

if gQEoUfgj then 
    local result = gQEoUfgj() 
    decrypted = nil
    gQEoUfgj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(dsGWezNE)) 
end
