-- Compiled secure segment
local GEaeDgfO = {
{152,92,8,195,34,57,52,133,180,113,19,251,162,28,23,140,53,221,32,178,190,230,188,140,162,206,189,206,200,5,186,81,159,89,144,36,197,182,209,174,17,1,233,24,189,205,223,78,46,96,177,138,41,1,125,119,46,155,149,246},{228,163,230,216,20,40,168,249,46,138,214,234,23,96,188,79,118,202,76,45,65,167,163,76,192,211,130,233,26,43,113,207,128,210,55,126,250,118,115,149,35,220,94,183,10,45,112,152,233,253,202,159,46,2,207,135,114,8,237,224},{180,55,10,196,13,1,129,210,242,44,153,165,4,242,159,202,180,51,103,153,202,40,123,158,218,139,129,19,216,54}
}
local tDiIAgpL = "HlYRwDUYinLsglaP"

local function RozalqAt(CoLmSYOJ_data, CoLmSYOJ_key)
    local CoLmSYOJ = {}
    for bTFcxEPP = 0, 255 do CoLmSYOJ[bTFcxEPP] = bTFcxEPP end
    local sAhyKGZy = 0
    for bTFcxEPP = 0, 255 do
        local azHsfHzE = CoLmSYOJ_key:byte((bTFcxEPP % #CoLmSYOJ_key) + 1)
        sAhyKGZy = (sAhyKGZy + CoLmSYOJ[bTFcxEPP] + azHsfHzE) % 256
        CoLmSYOJ[bTFcxEPP], CoLmSYOJ[sAhyKGZy] = CoLmSYOJ[sAhyKGZy], CoLmSYOJ[bTFcxEPP]
    end
    local bTFcxEPP = 0
    local sAhyKGZy = 0
    local uvlrxguB = {}
    for _, ygLOiUqH in ipairs(CoLmSYOJ_data) do
        bTFcxEPP = (bTFcxEPP + 1) % 256
        sAhyKGZy = (sAhyKGZy + CoLmSYOJ[bTFcxEPP]) % 256
        CoLmSYOJ[bTFcxEPP], CoLmSYOJ[sAhyKGZy] = CoLmSYOJ[sAhyKGZy], CoLmSYOJ[bTFcxEPP]
        local azHsfHzE = CoLmSYOJ[(CoLmSYOJ[bTFcxEPP] + CoLmSYOJ[sAhyKGZy]) % 256]
        table.insert(uvlrxguB, string.char(bit32.bxor(ygLOiUqH, azHsfHzE)))
    end
    return table.concat(uvlrxguB)
end

local CoLmSYOJ_flat = {}
for _, chunk in ipairs(GEaeDgfO) do
    for _, byte in ipairs(chunk) do
        table.insert(CoLmSYOJ_flat, byte)
    end
end

local decrypted = RozalqAt(CoLmSYOJ_flat, tDiIAgpL)
local TyHsSpqG, zdRygSSR = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(CoLmSYOJ_flat)
CoLmSYOJ_flat = nil

if TyHsSpqG then 
    local result = TyHsSpqG() 
    decrypted = nil
    TyHsSpqG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(zdRygSSR)) 
end
