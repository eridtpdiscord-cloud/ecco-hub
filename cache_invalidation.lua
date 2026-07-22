-- Protected Segment (cache_invalidation)
local tndldpmP = 158
local fDRXqRDp = {
{203,206,210,3,25,216,19,12,251,196,171,22,36,164,248,114,138,206,199,113,93,223,155,158,139,210,102,32,168,1,53,77,125,138,105,160,244,80,82,83,115,207,71,152,80,139,102,140,151,6,24,247,233,147,137,38,180,100,123,190},{49,140,80,7,86,223,173,98,101,29,178,21,252,200,253,70,136,238,66,82,75,95,95,194,14,198,39,184,39,206,130,74,36,85,213,148,51,187,80,88,137,175,231,53,87,124,18,239,17,41,71,94,187,172,73,95,227,216,140,59},{132,171,203,107,33,191,164,146,68,138,86,240,196,163,143,39,228,185,22,41,139,109,218,108,121,46,208,19,152,196}
}
local fHfiEGrM = "mSIgEcalZJBiLIKL"

local function MevelhLz(KwAMbxjy_data, KwAMbxjy_key)
    local KwAMbxjy = {}
    for VwecuQdF = 0, 255 do KwAMbxjy[VwecuQdF] = VwecuQdF end
    local drtVcyin = 0
    for VwecuQdF = 0, 255 do
        local keXCWrFJ = KwAMbxjy_key:byte((VwecuQdF % #KwAMbxjy_key) + 1)
        drtVcyin = (drtVcyin + KwAMbxjy[VwecuQdF] + keXCWrFJ) % 256
        KwAMbxjy[VwecuQdF], KwAMbxjy[drtVcyin] = KwAMbxjy[drtVcyin], KwAMbxjy[VwecuQdF]
    end
    local VwecuQdF = 0
    local drtVcyin = 0
    local zFHWMuex = {}
    for _, DkXqTFfC in ipairs(KwAMbxjy_data) do
        VwecuQdF = (VwecuQdF + 1) % 256
        drtVcyin = (drtVcyin + KwAMbxjy[VwecuQdF]) % 256
        KwAMbxjy[VwecuQdF], KwAMbxjy[drtVcyin] = KwAMbxjy[drtVcyin], KwAMbxjy[VwecuQdF]
        local keXCWrFJ = KwAMbxjy[(KwAMbxjy[VwecuQdF] + KwAMbxjy[drtVcyin]) % 256]
        local unmasked = bit32.bxor(DkXqTFfC, tndldpmP)
        table.insert(zFHWMuex, string.char(bit32.bxor(unmasked, keXCWrFJ)))
    end
    return table.concat(zFHWMuex)
end

local KwAMbxjy_flat = {}
for _, chunk in ipairs(fDRXqRDp) do
    for _, byte in ipairs(chunk) do
        table.insert(KwAMbxjy_flat, byte)
    end
end

local decrypted = MevelhLz(KwAMbxjy_flat, fHfiEGrM)
local juCRaCqB, vdjJQQmR = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(KwAMbxjy_flat)
KwAMbxjy_flat = nil

if juCRaCqB then 
    local result = juCRaCqB() 
    decrypted = nil
    juCRaCqB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(vdjJQQmR)) 
end
