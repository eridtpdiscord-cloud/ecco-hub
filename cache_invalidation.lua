-- Protected Segment (cache_invalidation)
local JtolPSec = 112
local RMephoBn = {
{40,251,115,200,246,230,110,194,103,137,37,255,122,108,69,157,32,74,220,249,205,190,58,30,154,147,0,68,26,224,210,148,235,153,253,160,221,73,183,97,178,22,125,246,93,250,181,112,59,146,137,202,160,170,145,136,159,247,248,189},{232,132,178,119,114,254,241,14,163,245,142,251,225,56,220,238,150,62,0,114,205,162,92,200,45,28,94,123,50,241,190,0,191,143,238,116,108,48,4,56,150,7,244,37,248,27,80,145,85,140,14,50,167,99,73,55,106,143,203,72},{82,254,197,155,184,160,38,68,120,193,108,175,231,154,218,248,16,151,189,156,192,66,109,85,176,244,83,192,13,53}
}
local WGhUBHYv = "tXHavQkzftXoyTNs"

local function IdyHozjN(SuLdfmBb_data, SuLdfmBb_key)
    local SuLdfmBb = {}
    for lUNxnAsn = 0, 255 do SuLdfmBb[lUNxnAsn] = lUNxnAsn end
    local NwAJbNsZ = 0
    for lUNxnAsn = 0, 255 do
        local VCXWKtmJ = SuLdfmBb_key:byte((lUNxnAsn % #SuLdfmBb_key) + 1)
        NwAJbNsZ = (NwAJbNsZ + SuLdfmBb[lUNxnAsn] + VCXWKtmJ) % 256
        SuLdfmBb[lUNxnAsn], SuLdfmBb[NwAJbNsZ] = SuLdfmBb[NwAJbNsZ], SuLdfmBb[lUNxnAsn]
    end
    local lUNxnAsn = 0
    local NwAJbNsZ = 0
    local vvKAKRew = {}
    for _, fJOeiaTd in ipairs(SuLdfmBb_data) do
        lUNxnAsn = (lUNxnAsn + 1) % 256
        NwAJbNsZ = (NwAJbNsZ + SuLdfmBb[lUNxnAsn]) % 256
        SuLdfmBb[lUNxnAsn], SuLdfmBb[NwAJbNsZ] = SuLdfmBb[NwAJbNsZ], SuLdfmBb[lUNxnAsn]
        local VCXWKtmJ = SuLdfmBb[(SuLdfmBb[lUNxnAsn] + SuLdfmBb[NwAJbNsZ]) % 256]
        local unmasked = bit32.bxor(fJOeiaTd, JtolPSec)
        table.insert(vvKAKRew, string.char(bit32.bxor(unmasked, VCXWKtmJ)))
    end
    return table.concat(vvKAKRew)
end

local SuLdfmBb_flat = {}
for _, chunk in ipairs(RMephoBn) do
    for _, byte in ipairs(chunk) do
        table.insert(SuLdfmBb_flat, byte)
    end
end

local decrypted = IdyHozjN(SuLdfmBb_flat, WGhUBHYv)
local QmLCxvLN, oXoiRdnD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SuLdfmBb_flat)
SuLdfmBb_flat = nil

if QmLCxvLN then 
    local result = QmLCxvLN() 
    decrypted = nil
    QmLCxvLN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(oXoiRdnD)) 
end
