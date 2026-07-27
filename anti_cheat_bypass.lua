-- Protected Segment (anti_cheat_bypass)
local oaDgouhY = 91
local iPJJTeBm = {
{155,38,156,2,91,225,82,106,16,123,169,192,42,5,38,85,80,43,45,40,87,181,223,223,85,45,198,195,118,51,70,155,59,247,114,166,233,248,90,220,20,40,241,211,75,82,19,201,56,212,178,121,62,119,146,147,23,26,85,45},{1,97,205,79,139,117,215,56,205,32,67,94,153,87,82,167,177,0,124,204,126,100,7,190,255,55,63,254,135,111,69,81,15,122,9,136,156,35,253,28,58,87,7,69,86,233,251,66,195,172,194,223,58,215,131,19,29,134,130,216},{153,116,8,127,186,208,66,83,46,178,46,242,176,231,21,237,207,137,203,243,250,192,170,245,87,26,213,231,247}
}
local dSlyUwsy = "yJwACUseFFEFDtLU"

local function JRrgTLfn(LyUKzzNT_data, LyUKzzNT_key)
    if type(LyUKzzNT_key) ~= "string" or #LyUKzzNT_key == 0 then return "" end
    local LyUKzzNT = {}
    for OGeSRKSd = 0, 255 do LyUKzzNT[OGeSRKSd] = OGeSRKSd end
    local XVlJgPrk = 0
    for OGeSRKSd = 0, 255 do
        local sbUlosvk = LyUKzzNT_key:byte((OGeSRKSd % #LyUKzzNT_key) + 1)
        XVlJgPrk = (XVlJgPrk + LyUKzzNT[OGeSRKSd] + sbUlosvk) % 256
        LyUKzzNT[OGeSRKSd], LyUKzzNT[XVlJgPrk] = LyUKzzNT[XVlJgPrk], LyUKzzNT[OGeSRKSd]
    end
    local OGeSRKSd = 0
    local XVlJgPrk = 0
    local uCITAuhw = {}
    for _, xMxUvILj in ipairs(LyUKzzNT_data) do
        OGeSRKSd = (OGeSRKSd + 1) % 256
        XVlJgPrk = (XVlJgPrk + LyUKzzNT[OGeSRKSd]) % 256
        LyUKzzNT[OGeSRKSd], LyUKzzNT[XVlJgPrk] = LyUKzzNT[XVlJgPrk], LyUKzzNT[OGeSRKSd]
        local sbUlosvk = LyUKzzNT[(LyUKzzNT[OGeSRKSd] + LyUKzzNT[XVlJgPrk]) % 256]
        local unmasked = bit32.bxor(xMxUvILj, oaDgouhY)
        table.insert(uCITAuhw, string.char(bit32.bxor(unmasked, sbUlosvk)))
    end
    return table.concat(uCITAuhw)
end

local LyUKzzNT_flat = {}
for _, chunk in ipairs(iPJJTeBm) do
    for _, byte in ipairs(chunk) do
        table.insert(LyUKzzNT_flat, byte)
    end
end

local decrypted = JRrgTLfn(LyUKzzNT_flat, dSlyUwsy)
local unHQagwU, SOZVbQVG = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(LyUKzzNT_flat)
LyUKzzNT_flat = nil

if unHQagwU then 
    local result = unHQagwU() 
    decrypted = nil
    unHQagwU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(SOZVbQVG)) 
end
