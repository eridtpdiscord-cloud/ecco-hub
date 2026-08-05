-- Protected Segment (cache_invalidation)
local SMXAXqSZ = 219
local QZlPKtVw = {
{25,243,233,192,126,48,42,171,31,180,83,167,153,138,65,89,68,14,113,191,66,242,229,63,45,48,207,104,58,199,115,13,136,25,46,163,74,202,139,31,201,201,218,159,155,159,138,85,250,83,20,203,149,64,121,253,163,40,128,56},{138,80,203,249,167,95,162,122,254,39,31,240,53,54,56,236,62,144,188,59,43,184,59,59,133,42,174,202,103,193,209,35,89,202,210,107,31,118,177,93,170,134,70,150,91,211,219,188,136,122,47,69,223,160,142,142,46,13,40,53},{202,17,55,85,40,171,45,160,46,235,220,189,178,240,113,112,98,85,51,26,186,215,123,245,66,196,133,179,133,84}
}
local aHqwDGOr = "DZXOZmLkHIqoQsBw"

local function LHbTIPsx(OSEuMhEC_data, OSEuMhEC_key)
    if type(OSEuMhEC_key) ~= "string" or #OSEuMhEC_key == 0 then return "" end
    local OSEuMhEC = {}
    for knSIfLcH = 0, 255 do OSEuMhEC[knSIfLcH] = knSIfLcH end
    local sUPJcyiC = 0
    for knSIfLcH = 0, 255 do
        local muCddcfu = OSEuMhEC_key:byte((knSIfLcH % #OSEuMhEC_key) + 1)
        sUPJcyiC = (sUPJcyiC + OSEuMhEC[knSIfLcH] + muCddcfu) % 256
        OSEuMhEC[knSIfLcH], OSEuMhEC[sUPJcyiC] = OSEuMhEC[sUPJcyiC], OSEuMhEC[knSIfLcH]
    end
    local knSIfLcH = 0
    local sUPJcyiC = 0
    local jjmhniCl = {}
    for _, MkTqaXgC in ipairs(OSEuMhEC_data) do
        knSIfLcH = (knSIfLcH + 1) % 256
        sUPJcyiC = (sUPJcyiC + OSEuMhEC[knSIfLcH]) % 256
        OSEuMhEC[knSIfLcH], OSEuMhEC[sUPJcyiC] = OSEuMhEC[sUPJcyiC], OSEuMhEC[knSIfLcH]
        local muCddcfu = OSEuMhEC[(OSEuMhEC[knSIfLcH] + OSEuMhEC[sUPJcyiC]) % 256]
        local unmasked = bit32.bxor(MkTqaXgC, SMXAXqSZ)
        table.insert(jjmhniCl, string.char(bit32.bxor(unmasked, muCddcfu)))
    end
    return table.concat(jjmhniCl)
end

local OSEuMhEC_flat = {}
for _, chunk in ipairs(QZlPKtVw) do
    for _, byte in ipairs(chunk) do
        table.insert(OSEuMhEC_flat, byte)
    end
end

local decrypted = LHbTIPsx(OSEuMhEC_flat, aHqwDGOr)
local nBxNvLwY, kSJRIZDN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OSEuMhEC_flat)
OSEuMhEC_flat = nil

if nBxNvLwY then 
    local result = nBxNvLwY() 
    decrypted = nil
    nBxNvLwY = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(kSJRIZDN)) 
end
