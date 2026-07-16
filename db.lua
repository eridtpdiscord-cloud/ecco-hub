-- Compiled secure segment
local JyUaAuGb = {
{213,186,168,86,50,188,141,75,102,232,76,211,123,8,59,11,68,215,204,143,222,110,50,157,148,198,242,156,11,159,79,211,55,255,55,95,137,111,70,89,184,252,171,120,149,89,42,75,53,39,176,49,244,132,30,182,87,20,161,214},{86,226,4,110,219,93,76,160,179,105,254,95,129,63,111,163,235,49,99,157,20,134,245,87,53,194,217,105,130,209,52,116,230,135,182,195,155,95,233,252,66,59,215,73,51,63,178,169,217,180,6,233,208,32,8,83,229,77,29,212},{133,203,185,84,55,0,10,213,130,52,19,121,107,12,72,55,7,103,207,146,228,53,7,192,126,2,235,5,5,138,197,67,224,212,254,123,0,21,82,75,104,87,6,18,48,230,6,227,184,76,236,29,252,210,16,158,2,152,225,32},{47,36,179,52,203,191,163,154,143,236,40,234,182,136,238,215,29,27,118,157,239,221,51,146,15,112,203,234,142,46,12,21,134,6,185,73,210,176,70,87,64,183,158,235,31,106,67,171,129,248,82,144,66,194,86,10}
}
local QfJzuhVB = "hsgrotwOJcjUwtvG"

local function uURlpyPR(ceyLtDFz_data, ceyLtDFz_key)
    local ceyLtDFz = {}
    for AZdlaApR = 0, 255 do ceyLtDFz[AZdlaApR] = AZdlaApR end
    local ejfRxYAY = 0
    for AZdlaApR = 0, 255 do
        local euAonmnH = ceyLtDFz_key:byte((AZdlaApR % #ceyLtDFz_key) + 1)
        ejfRxYAY = (ejfRxYAY + ceyLtDFz[AZdlaApR] + euAonmnH) % 256
        ceyLtDFz[AZdlaApR], ceyLtDFz[ejfRxYAY] = ceyLtDFz[ejfRxYAY], ceyLtDFz[AZdlaApR]
    end
    local AZdlaApR = 0
    local ejfRxYAY = 0
    local aZjQBzNE = {}
    for _, rSuivTrU in ipairs(ceyLtDFz_data) do
        AZdlaApR = (AZdlaApR + 1) % 256
        ejfRxYAY = (ejfRxYAY + ceyLtDFz[AZdlaApR]) % 256
        ceyLtDFz[AZdlaApR], ceyLtDFz[ejfRxYAY] = ceyLtDFz[ejfRxYAY], ceyLtDFz[AZdlaApR]
        local euAonmnH = ceyLtDFz[(ceyLtDFz[AZdlaApR] + ceyLtDFz[ejfRxYAY]) % 256]
        table.insert(aZjQBzNE, string.char(bit32.bxor(rSuivTrU, euAonmnH)))
    end
    return table.concat(aZjQBzNE)
end

local ceyLtDFz_flat = {}
for _, chunk in ipairs(JyUaAuGb) do
    for _, byte in ipairs(chunk) do
        table.insert(ceyLtDFz_flat, byte)
    end
end

local decrypted = uURlpyPR(ceyLtDFz_flat, QfJzuhVB)
local sZLsmpud, zWwKbbAu = loadstring(decrypted)
if sZLsmpud then 
    return sZLsmpud() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(zWwKbbAu)) 
end
