-- Protected Segment (tween_library)
local tNxhVFzV = 88
local wvpnZkVv = {
{118,74,185,81,163,111,107,171,7,170,239,17,29,115,128,195,102,165,241,143,81,16,200,214,174,36,78,60,138,201,60,195,72,133,82,208,195,78,24,59,195,3,173,121,2,57,113,100,29,8,245,70,35,250,145,73,20,95,25,188},{9,65,178,80,116,221,35,241,26,137,17,134,27,49,70,235,152,101,51,208,186,54,28,226,138,11,177,160,187,84,79,8,172,118,126,164,183,101,71,49,40,115,37,174,150,239,39,207,242,0,222,46,56,36,62,64,245,182,228,196},{16,212,237,86,88,213,189,135,34,8,209,57,178,1,237,107,226,241,90,182,169,42,216,239,153}
}
local rpHdEXFu = "qoVNLRcBlDkzPYWq"

local function KqgoSOrK(ExwqYkxE_data, ExwqYkxE_key)
    if type(ExwqYkxE_key) ~= "string" or #ExwqYkxE_key == 0 then return "" end
    local ExwqYkxE = {}
    for LmIQnprb = 0, 255 do ExwqYkxE[LmIQnprb] = LmIQnprb end
    local dLMBBkSa = 0
    for LmIQnprb = 0, 255 do
        local owFluslx = ExwqYkxE_key:byte((LmIQnprb % #ExwqYkxE_key) + 1)
        dLMBBkSa = (dLMBBkSa + ExwqYkxE[LmIQnprb] + owFluslx) % 256
        ExwqYkxE[LmIQnprb], ExwqYkxE[dLMBBkSa] = ExwqYkxE[dLMBBkSa], ExwqYkxE[LmIQnprb]
    end
    local LmIQnprb = 0
    local dLMBBkSa = 0
    local gZqNiORS = {}
    for _, zdbPjhGf in ipairs(ExwqYkxE_data) do
        LmIQnprb = (LmIQnprb + 1) % 256
        dLMBBkSa = (dLMBBkSa + ExwqYkxE[LmIQnprb]) % 256
        ExwqYkxE[LmIQnprb], ExwqYkxE[dLMBBkSa] = ExwqYkxE[dLMBBkSa], ExwqYkxE[LmIQnprb]
        local owFluslx = ExwqYkxE[(ExwqYkxE[LmIQnprb] + ExwqYkxE[dLMBBkSa]) % 256]
        local unmasked = bit32.bxor(zdbPjhGf, tNxhVFzV)
        table.insert(gZqNiORS, string.char(bit32.bxor(unmasked, owFluslx)))
    end
    return table.concat(gZqNiORS)
end

local ExwqYkxE_flat = {}
for _, chunk in ipairs(wvpnZkVv) do
    for _, byte in ipairs(chunk) do
        table.insert(ExwqYkxE_flat, byte)
    end
end

local decrypted = KqgoSOrK(ExwqYkxE_flat, rpHdEXFu)
local hyyJTcOu, PXboZyHf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ExwqYkxE_flat)
ExwqYkxE_flat = nil

if hyyJTcOu then 
    local result = hyyJTcOu() 
    decrypted = nil
    hyyJTcOu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(PXboZyHf)) 
end
