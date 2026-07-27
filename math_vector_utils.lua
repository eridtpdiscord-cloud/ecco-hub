-- Protected Segment (math_vector_utils)
local yesXnegp = 2
local GxoWxazD = {
{106,142,253,158,96,142,253,41,138,117,104,135,131,101,160,34,134,62,159,142,178,251,38,37,248,73,102,245,150,235,112,10,182,16,224,141,60,160,87,66,241,21,34,243,224,1,104,236,167,89,82,174,157,235,68,178,134,27,84,225},{96,40,252,182,179,87,213,36,184,92,115,234,1,229,229,159,134,55,1,52,101,121,197,15,214,127,97,213,212,171,242,14,169,58,106,156,231,214,104,138,109,89,91,221,44,49,197,48,21,198,91,199,157,118,205,189,198,126,156,203},{169,72,48,126,36,6,70,157,228,235,94,245,237,102,163,16,122,190,13,149,248,157,28,57,94,146,180,159,215}
}
local IEfLXtmG = "tJewHedYTjDxctuU"

local function VwWTiGgI(DPEhLRqM_data, DPEhLRqM_key)
    if type(DPEhLRqM_key) ~= "string" or #DPEhLRqM_key == 0 then return "" end
    local DPEhLRqM = {}
    for trIOITzZ = 0, 255 do DPEhLRqM[trIOITzZ] = trIOITzZ end
    local WiOoBmZW = 0
    for trIOITzZ = 0, 255 do
        local qVhoVPTM = DPEhLRqM_key:byte((trIOITzZ % #DPEhLRqM_key) + 1)
        WiOoBmZW = (WiOoBmZW + DPEhLRqM[trIOITzZ] + qVhoVPTM) % 256
        DPEhLRqM[trIOITzZ], DPEhLRqM[WiOoBmZW] = DPEhLRqM[WiOoBmZW], DPEhLRqM[trIOITzZ]
    end
    local trIOITzZ = 0
    local WiOoBmZW = 0
    local axOcTdzD = {}
    for _, cDNtaGxe in ipairs(DPEhLRqM_data) do
        trIOITzZ = (trIOITzZ + 1) % 256
        WiOoBmZW = (WiOoBmZW + DPEhLRqM[trIOITzZ]) % 256
        DPEhLRqM[trIOITzZ], DPEhLRqM[WiOoBmZW] = DPEhLRqM[WiOoBmZW], DPEhLRqM[trIOITzZ]
        local qVhoVPTM = DPEhLRqM[(DPEhLRqM[trIOITzZ] + DPEhLRqM[WiOoBmZW]) % 256]
        local unmasked = bit32.bxor(cDNtaGxe, yesXnegp)
        table.insert(axOcTdzD, string.char(bit32.bxor(unmasked, qVhoVPTM)))
    end
    return table.concat(axOcTdzD)
end

local DPEhLRqM_flat = {}
for _, chunk in ipairs(GxoWxazD) do
    for _, byte in ipairs(chunk) do
        table.insert(DPEhLRqM_flat, byte)
    end
end

local decrypted = VwWTiGgI(DPEhLRqM_flat, IEfLXtmG)
local nLkYFHmW, meACIBoA = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DPEhLRqM_flat)
DPEhLRqM_flat = nil

if nLkYFHmW then 
    local result = nLkYFHmW() 
    decrypted = nil
    nLkYFHmW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(meACIBoA)) 
end
