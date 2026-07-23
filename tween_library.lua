-- Protected Segment (tween_library)
local ERSrxIgS = 185
local fsdNEGrc = {
{96,120,196,205,174,57,133,198,160,149,163,149,11,118,37,83,26,67,28,171,110,39,201,253,240,48,85,121,238,211,205,57,190,28,175,26,36,135,254,147,192,123,136,187,251,248,193,241,77,163,191,164,159,80,120,234,48,58,24,249},{89,240,154,33,37,232,123,67,63,139,166,128,84,52,116,95,30,186,213,230,125,125,208,57,164,26,171,7,132,40,154,172,155,79,53,112,40,182,221,254,162,255,2,60,2,67,134,102,223,81,186,145,21,71,107,160,106,238,100,99},{177,16,55,36,218,15,182,45,55,33,56,157,94,145,219,162,81,25,105,25,5,164,233,198,215}
}
local sTxYyHvI = "kJGYsfDrXmfrGGqx"

local function uwMmVZvN(nBJjuqET_data, nBJjuqET_key)
    if type(nBJjuqET_key) ~= "string" or #nBJjuqET_key == 0 then return "" end
    local nBJjuqET = {}
    for GtzRrieH = 0, 255 do nBJjuqET[GtzRrieH] = GtzRrieH end
    local WmchfMRF = 0
    for GtzRrieH = 0, 255 do
        local nQHGYYBS = nBJjuqET_key:byte((GtzRrieH % #nBJjuqET_key) + 1)
        WmchfMRF = (WmchfMRF + nBJjuqET[GtzRrieH] + nQHGYYBS) % 256
        nBJjuqET[GtzRrieH], nBJjuqET[WmchfMRF] = nBJjuqET[WmchfMRF], nBJjuqET[GtzRrieH]
    end
    local GtzRrieH = 0
    local WmchfMRF = 0
    local mbrJyYQt = {}
    for _, hkvGfrOv in ipairs(nBJjuqET_data) do
        GtzRrieH = (GtzRrieH + 1) % 256
        WmchfMRF = (WmchfMRF + nBJjuqET[GtzRrieH]) % 256
        nBJjuqET[GtzRrieH], nBJjuqET[WmchfMRF] = nBJjuqET[WmchfMRF], nBJjuqET[GtzRrieH]
        local nQHGYYBS = nBJjuqET[(nBJjuqET[GtzRrieH] + nBJjuqET[WmchfMRF]) % 256]
        local unmasked = bit32.bxor(hkvGfrOv, ERSrxIgS)
        table.insert(mbrJyYQt, string.char(bit32.bxor(unmasked, nQHGYYBS)))
    end
    return table.concat(mbrJyYQt)
end

local nBJjuqET_flat = {}
for _, chunk in ipairs(fsdNEGrc) do
    for _, byte in ipairs(chunk) do
        table.insert(nBJjuqET_flat, byte)
    end
end

local decrypted = uwMmVZvN(nBJjuqET_flat, sTxYyHvI)
local eMQpeNLb, eidaFHit = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(nBJjuqET_flat)
nBJjuqET_flat = nil

if eMQpeNLb then 
    local result = eMQpeNLb() 
    decrypted = nil
    eMQpeNLb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(eidaFHit)) 
end
