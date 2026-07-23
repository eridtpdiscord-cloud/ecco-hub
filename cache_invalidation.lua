-- Protected Segment (cache_invalidation)
local vujPfbKj = 61
local ITjKFUMZ = {
{136,114,205,179,118,72,96,54,207,47,96,68,172,141,5,85,35,34,63,224,26,228,139,118,189,247,0,54,132,250,52,18,203,253,164,45,252,112,137,46,31,45,220,245,129,176,46,130,7,254,151,161,210,230,201,12,138,1,92,28},{164,77,53,118,146,173,52,187,29,154,174,201,139,142,186,205,137,89,21,61,156,224,33,41,92,232,57,163,130,129,170,163,57,74,83,202,74,18,89,240,155,206,208,119,217,33,80,145,222,101,130,241,235,67,37,68,227,176,78,83},{152,127,50,115,162,21,4,158,25,59,90,203,36,58,208,166,42,24,73,88,181,209,201,150,139,107,109,210,79,242}
}
local YnlUzcsV = "omFUJFPqgxJgNyxP"

local function gwFAKnCT(ZibUnEsY_data, ZibUnEsY_key)
    if type(ZibUnEsY_key) ~= "string" or #ZibUnEsY_key == 0 then return "" end
    local ZibUnEsY = {}
    for uEGHAKYV = 0, 255 do ZibUnEsY[uEGHAKYV] = uEGHAKYV end
    local HsjJYJXY = 0
    for uEGHAKYV = 0, 255 do
        local bDohHDkd = ZibUnEsY_key:byte((uEGHAKYV % #ZibUnEsY_key) + 1)
        HsjJYJXY = (HsjJYJXY + ZibUnEsY[uEGHAKYV] + bDohHDkd) % 256
        ZibUnEsY[uEGHAKYV], ZibUnEsY[HsjJYJXY] = ZibUnEsY[HsjJYJXY], ZibUnEsY[uEGHAKYV]
    end
    local uEGHAKYV = 0
    local HsjJYJXY = 0
    local suvfLuXC = {}
    for _, sLcWjcQi in ipairs(ZibUnEsY_data) do
        uEGHAKYV = (uEGHAKYV + 1) % 256
        HsjJYJXY = (HsjJYJXY + ZibUnEsY[uEGHAKYV]) % 256
        ZibUnEsY[uEGHAKYV], ZibUnEsY[HsjJYJXY] = ZibUnEsY[HsjJYJXY], ZibUnEsY[uEGHAKYV]
        local bDohHDkd = ZibUnEsY[(ZibUnEsY[uEGHAKYV] + ZibUnEsY[HsjJYJXY]) % 256]
        local unmasked = bit32.bxor(sLcWjcQi, vujPfbKj)
        table.insert(suvfLuXC, string.char(bit32.bxor(unmasked, bDohHDkd)))
    end
    return table.concat(suvfLuXC)
end

local ZibUnEsY_flat = {}
for _, chunk in ipairs(ITjKFUMZ) do
    for _, byte in ipairs(chunk) do
        table.insert(ZibUnEsY_flat, byte)
    end
end

local decrypted = gwFAKnCT(ZibUnEsY_flat, YnlUzcsV)
local NCwlARwa, lclYovxQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZibUnEsY_flat)
ZibUnEsY_flat = nil

if NCwlARwa then 
    local result = NCwlARwa() 
    decrypted = nil
    NCwlARwa = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(lclYovxQ)) 
end
