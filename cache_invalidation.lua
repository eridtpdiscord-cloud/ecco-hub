-- Protected Segment (cache_invalidation)
local MbIgBVCx = 2
local lojwWCAQ = {
{157,58,103,20,88,30,230,103,154,0,90,156,189,237,207,114,11,252,118,48,76,158,55,196,205,158,141,112,249,212,111,18,76,33,4,177,13,193,222,102,22,43,141,77,33,228,248,2,105,19,218,205,23,10,87,9,254,156,11,68},{144,19,117,191,176,193,194,74,11,85,173,194,156,85,38,11,164,116,171,36,255,221,170,135,75,35,166,77,162,215,210,18,124,106,67,150,58,154,199,18,64,117,182,46,56,206,137,240,207,54,82,140,184,159,57,166,14,23,147,199},{212,151,116,114,42,3,160,83,76,251,201,148,213,28,99,7,255,180,161,197,43,53,98,161,223,89,252,32,46,110}
}
local udFfkupG = "mLuxWzdPjedgZKfA"

local function hHXYvCaU(nCfQmEnM_data, nCfQmEnM_key)
    local nCfQmEnM = {}
    for TEWEOgLc = 0, 255 do nCfQmEnM[TEWEOgLc] = TEWEOgLc end
    local lbbwRcmZ = 0
    for TEWEOgLc = 0, 255 do
        local wZboqIsT = nCfQmEnM_key:byte((TEWEOgLc % #nCfQmEnM_key) + 1)
        lbbwRcmZ = (lbbwRcmZ + nCfQmEnM[TEWEOgLc] + wZboqIsT) % 256
        nCfQmEnM[TEWEOgLc], nCfQmEnM[lbbwRcmZ] = nCfQmEnM[lbbwRcmZ], nCfQmEnM[TEWEOgLc]
    end
    local TEWEOgLc = 0
    local lbbwRcmZ = 0
    local afLpGowQ = {}
    for _, TyoMHaGs in ipairs(nCfQmEnM_data) do
        TEWEOgLc = (TEWEOgLc + 1) % 256
        lbbwRcmZ = (lbbwRcmZ + nCfQmEnM[TEWEOgLc]) % 256
        nCfQmEnM[TEWEOgLc], nCfQmEnM[lbbwRcmZ] = nCfQmEnM[lbbwRcmZ], nCfQmEnM[TEWEOgLc]
        local wZboqIsT = nCfQmEnM[(nCfQmEnM[TEWEOgLc] + nCfQmEnM[lbbwRcmZ]) % 256]
        local unmasked = bit32.bxor(TyoMHaGs, MbIgBVCx)
        table.insert(afLpGowQ, string.char(bit32.bxor(unmasked, wZboqIsT)))
    end
    return table.concat(afLpGowQ)
end

local nCfQmEnM_flat = {}
for _, chunk in ipairs(lojwWCAQ) do
    for _, byte in ipairs(chunk) do
        table.insert(nCfQmEnM_flat, byte)
    end
end

local decrypted = hHXYvCaU(nCfQmEnM_flat, udFfkupG)
local voMeyGGy, fcIwcLrT = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(nCfQmEnM_flat)
nCfQmEnM_flat = nil

if voMeyGGy then 
    local result = voMeyGGy() 
    decrypted = nil
    voMeyGGy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(fcIwcLrT)) 
end
