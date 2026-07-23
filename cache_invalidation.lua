-- Protected Segment (cache_invalidation)
local ARbcFuLX = 60
local jJHDHilE = {
{24,173,144,54,88,167,15,22,254,147,107,101,88,169,67,9,71,106,194,36,57,37,239,213,125,100,5,139,155,146,204,51,142,99,168,77,10,55,12,9,217,255,12,85,70,133,139,121,184,243,148,65,24,123,70,196,159,184,215,79},{88,132,247,131,192,40,209,4,81,78,33,248,194,244,115,44,181,135,18,173,22,222,255,164,253,239,92,245,38,165,37,235,0,190,93,121,56,59,250,249,140,57,94,62,41,228,78,15,36,71,133,100,197,167,203,28,155,155,96,91},{184,57,138,132,126,61,94,174,232,109,230,27,92,56,131,185,141,5,105,221,108,32,100,105,224,60,233,203,90,147}
}
local jATWdlzx = "wQHclJWCYCehYosQ"

local function izeBeUGs(ZOrjCTIA_data, ZOrjCTIA_key)
    if type(ZOrjCTIA_key) ~= "string" or #ZOrjCTIA_key == 0 then return "" end
    local ZOrjCTIA = {}
    for MApdKLlV = 0, 255 do ZOrjCTIA[MApdKLlV] = MApdKLlV end
    local DKGldHtu = 0
    for MApdKLlV = 0, 255 do
        local FtFKyaEj = ZOrjCTIA_key:byte((MApdKLlV % #ZOrjCTIA_key) + 1)
        DKGldHtu = (DKGldHtu + ZOrjCTIA[MApdKLlV] + FtFKyaEj) % 256
        ZOrjCTIA[MApdKLlV], ZOrjCTIA[DKGldHtu] = ZOrjCTIA[DKGldHtu], ZOrjCTIA[MApdKLlV]
    end
    local MApdKLlV = 0
    local DKGldHtu = 0
    local rRVLnmif = {}
    for _, lDppZAUr in ipairs(ZOrjCTIA_data) do
        MApdKLlV = (MApdKLlV + 1) % 256
        DKGldHtu = (DKGldHtu + ZOrjCTIA[MApdKLlV]) % 256
        ZOrjCTIA[MApdKLlV], ZOrjCTIA[DKGldHtu] = ZOrjCTIA[DKGldHtu], ZOrjCTIA[MApdKLlV]
        local FtFKyaEj = ZOrjCTIA[(ZOrjCTIA[MApdKLlV] + ZOrjCTIA[DKGldHtu]) % 256]
        local unmasked = bit32.bxor(lDppZAUr, ARbcFuLX)
        table.insert(rRVLnmif, string.char(bit32.bxor(unmasked, FtFKyaEj)))
    end
    return table.concat(rRVLnmif)
end

local ZOrjCTIA_flat = {}
for _, chunk in ipairs(jJHDHilE) do
    for _, byte in ipairs(chunk) do
        table.insert(ZOrjCTIA_flat, byte)
    end
end

local decrypted = izeBeUGs(ZOrjCTIA_flat, jATWdlzx)
local nWfyRVsB, yoDTMXSo = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZOrjCTIA_flat)
ZOrjCTIA_flat = nil

if nWfyRVsB then 
    local result = nWfyRVsB() 
    decrypted = nil
    nWfyRVsB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(yoDTMXSo)) 
end
