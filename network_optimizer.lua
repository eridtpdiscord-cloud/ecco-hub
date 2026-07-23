-- Protected Segment (network_optimizer)
local MSdxaCkj = 161
local cMDCZJFW = {
{236,164,195,72,219,72,122,208,81,91,12,177,168,74,49,176,28,178,123,190,11,204,246,167,56,147,245,44,66,19,76,85,21,224,155,95,122,161,110,11,128,33,215,219,77,236,77,152,204,133,49,86,123,142,159,227,86,109,73,167},{192,188,205,226,199,142,163,47,152,204,79,86,59,131,102,61,201,183,252,237,49,82,103,42,226,83,59,45,21,134,152,51,54,241,211,173,108,100,116,124,176,37,107,225,204,197,148,42,113,136,243,187,46,23,220,174,223,206,164,169},{167,113,182,190,194,205,1,57,44,94,107,206,194,168,230,169,13,83,242,153,115,170,86,20,42,58,94,15,161}
}
local iWBtiRdS = "dgTTFGnyJakTuzRy"

local function jGoEZswp(ripfPBQa_data, ripfPBQa_key)
    if type(ripfPBQa_key) ~= "string" or #ripfPBQa_key == 0 then return "" end
    local ripfPBQa = {}
    for ZNygslNC = 0, 255 do ripfPBQa[ZNygslNC] = ZNygslNC end
    local RXqyUifF = 0
    for ZNygslNC = 0, 255 do
        local VBcAjclK = ripfPBQa_key:byte((ZNygslNC % #ripfPBQa_key) + 1)
        RXqyUifF = (RXqyUifF + ripfPBQa[ZNygslNC] + VBcAjclK) % 256
        ripfPBQa[ZNygslNC], ripfPBQa[RXqyUifF] = ripfPBQa[RXqyUifF], ripfPBQa[ZNygslNC]
    end
    local ZNygslNC = 0
    local RXqyUifF = 0
    local GKaecCGC = {}
    for _, aEXYHSbF in ipairs(ripfPBQa_data) do
        ZNygslNC = (ZNygslNC + 1) % 256
        RXqyUifF = (RXqyUifF + ripfPBQa[ZNygslNC]) % 256
        ripfPBQa[ZNygslNC], ripfPBQa[RXqyUifF] = ripfPBQa[RXqyUifF], ripfPBQa[ZNygslNC]
        local VBcAjclK = ripfPBQa[(ripfPBQa[ZNygslNC] + ripfPBQa[RXqyUifF]) % 256]
        local unmasked = bit32.bxor(aEXYHSbF, MSdxaCkj)
        table.insert(GKaecCGC, string.char(bit32.bxor(unmasked, VBcAjclK)))
    end
    return table.concat(GKaecCGC)
end

local ripfPBQa_flat = {}
for _, chunk in ipairs(cMDCZJFW) do
    for _, byte in ipairs(chunk) do
        table.insert(ripfPBQa_flat, byte)
    end
end

local decrypted = jGoEZswp(ripfPBQa_flat, iWBtiRdS)
local odEojdlC, coGNjkwx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ripfPBQa_flat)
ripfPBQa_flat = nil

if odEojdlC then 
    local result = odEojdlC() 
    decrypted = nil
    odEojdlC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(coGNjkwx)) 
end
