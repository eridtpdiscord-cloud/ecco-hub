-- Protected Segment (db)
local HFTzjflU = 163
local wpBGCfZc = {
{218,244,176,32,72,238,73,96,191,57,95,32,74,5,90,244,120,153,141,231,9,123,114,101,181,62,182,12,115,225,207,253,242,113,43,242,174,11,227,55,76,122,22,52,54,130,219,246,12,191,195,75,227,178,161,38,117,49,109,200},{119,213,211,66,24,232,86,156,190,155,113,193,173,156,64,153,220,32,146,39,26,146,16,113,25,194,249,215,14,189,120,35,210,72,68,54,72,16,92,111,130,10,19,28,105,13,65,236,225,128,85,19,183,52,201,135,198,201,34,230},{174,6,173,252,192,187,121,44,61,175,213,230,200,181,166,5,168,49,251,252,122,217,143,53,98,19,128,48,239,49,109,113,206,137,12,144,185,182,239,74,24,207,243,240,130,114,206,161,196,211,102,63,235,52,68,14,16,39,239,250},{210,173,132,209,200,253,128,151,176,95,240,243,111,190,30,55,196,99,82,52,17,190,180,141,204,118,148,41,113,21,155,53,125,239,50,76,153,142,236,73,48,89,126,235,203,202,113,146,100,132,43,11,202,168,225,208,14,116,186,171},{160,46,8,56,62,108,157,196,230,15,145,111,98,32,118,29,164,72,178,234,82,79,240,15,167,166,118,85,2,154,140,130,190,143,43,14,166,25,27,176,52,4,232,77,65,204,195,202,116,221,72,31,192,173,83,248,188,121,181,189},{185,32,245,8,5,123,75,164,207,217,75,14,60,228,65,45,68,172,76,81,73,137,88,223,59,155,223,158,190,36,208,192,72,107,194,48,149,126,6,92,7,21,119,160,57,123,141,4,144,52,183,227,232,203,216,25,153,73,82,234},{105,37,225,126,8,4,198,163,152,226,201,236,230,143,167,75,136,29,66,169,178,222,27,51,152,254,142,121,125,193,215,74,130,200,220,229,150,211,254,92,67,71,230}
}
local FmftHciA = "eZMUwviODqUWgrZV"

local function fjdGpglq(HEOSnnyz_data, HEOSnnyz_key)
    local HEOSnnyz = {}
    for psFRgnMo = 0, 255 do HEOSnnyz[psFRgnMo] = psFRgnMo end
    local NqanegFh = 0
    for psFRgnMo = 0, 255 do
        local jNrbzFow = HEOSnnyz_key:byte((psFRgnMo % #HEOSnnyz_key) + 1)
        NqanegFh = (NqanegFh + HEOSnnyz[psFRgnMo] + jNrbzFow) % 256
        HEOSnnyz[psFRgnMo], HEOSnnyz[NqanegFh] = HEOSnnyz[NqanegFh], HEOSnnyz[psFRgnMo]
    end
    local psFRgnMo = 0
    local NqanegFh = 0
    local LCAkLiyr = {}
    for _, UenzthdL in ipairs(HEOSnnyz_data) do
        psFRgnMo = (psFRgnMo + 1) % 256
        NqanegFh = (NqanegFh + HEOSnnyz[psFRgnMo]) % 256
        HEOSnnyz[psFRgnMo], HEOSnnyz[NqanegFh] = HEOSnnyz[NqanegFh], HEOSnnyz[psFRgnMo]
        local jNrbzFow = HEOSnnyz[(HEOSnnyz[psFRgnMo] + HEOSnnyz[NqanegFh]) % 256]
        local unmasked = bit32.bxor(UenzthdL, HFTzjflU)
        table.insert(LCAkLiyr, string.char(bit32.bxor(unmasked, jNrbzFow)))
    end
    return table.concat(LCAkLiyr)
end

local HEOSnnyz_flat = {}
for _, chunk in ipairs(wpBGCfZc) do
    for _, byte in ipairs(chunk) do
        table.insert(HEOSnnyz_flat, byte)
    end
end

local decrypted = fjdGpglq(HEOSnnyz_flat, FmftHciA)
local LgqrlHMr, fivkEBsW = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HEOSnnyz_flat)
HEOSnnyz_flat = nil

if LgqrlHMr then 
    local result = LgqrlHMr() 
    decrypted = nil
    LgqrlHMr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(fivkEBsW)) 
end
