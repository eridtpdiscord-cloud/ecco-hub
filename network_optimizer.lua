-- Compiled secure segment
local nNjLAflk = {
{21,117,234,110,17,73,107,22,84,90,221,92,202,197,91,13,162,48,166,15,117,164,92,103,130,215,158,38,184,121,241,1,87,163,138,216,86,52,195,200,13,66,45,177,20,31,68,18,248,72,217,39,202,15,168,61,163,139,185,199},{127,20,6,143,62,228,122,125,16,223,156,122,235,14,113,17,185,70,91,132,130,221,5,164,35,127,34,52,101,66,180,184,3,213,44,8,105,49,28,234,62,233,82,164,219,169,7,209,130,37,170,135,182,148,72,200,107,251,183,106},{162,232,222,235,249,216,17,69,246,112,241,173,113,78,237,160,139,38,196,237,51,175,16,131,26,144,251,17,183}
}
local cxwMhQvr = "NLSswgnhmfVgrJAg"

local function ZkQXLMnQ(cNtjxCoy_data, cNtjxCoy_key)
    local cNtjxCoy = {}
    for YrxhYDaS = 0, 255 do cNtjxCoy[YrxhYDaS] = YrxhYDaS end
    local oDkIPczJ = 0
    for YrxhYDaS = 0, 255 do
        local TqyjLdqf = cNtjxCoy_key:byte((YrxhYDaS % #cNtjxCoy_key) + 1)
        oDkIPczJ = (oDkIPczJ + cNtjxCoy[YrxhYDaS] + TqyjLdqf) % 256
        cNtjxCoy[YrxhYDaS], cNtjxCoy[oDkIPczJ] = cNtjxCoy[oDkIPczJ], cNtjxCoy[YrxhYDaS]
    end
    local YrxhYDaS = 0
    local oDkIPczJ = 0
    local yDgcGNRK = {}
    for _, SLENclck in ipairs(cNtjxCoy_data) do
        YrxhYDaS = (YrxhYDaS + 1) % 256
        oDkIPczJ = (oDkIPczJ + cNtjxCoy[YrxhYDaS]) % 256
        cNtjxCoy[YrxhYDaS], cNtjxCoy[oDkIPczJ] = cNtjxCoy[oDkIPczJ], cNtjxCoy[YrxhYDaS]
        local TqyjLdqf = cNtjxCoy[(cNtjxCoy[YrxhYDaS] + cNtjxCoy[oDkIPczJ]) % 256]
        table.insert(yDgcGNRK, string.char(bit32.bxor(SLENclck, TqyjLdqf)))
    end
    return table.concat(yDgcGNRK)
end

local cNtjxCoy_flat = {}
for _, chunk in ipairs(nNjLAflk) do
    for _, byte in ipairs(chunk) do
        table.insert(cNtjxCoy_flat, byte)
    end
end

local decrypted = ZkQXLMnQ(cNtjxCoy_flat, cxwMhQvr)
local iWPnZmRv, YsHCVLVP = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(cNtjxCoy_flat)
cNtjxCoy_flat = nil

if iWPnZmRv then 
    local result = iWPnZmRv() 
    decrypted = nil
    iWPnZmRv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(YsHCVLVP)) 
end
