-- Protected Segment (db)
local vNZZCGAH = 135
local UKEVgmBj = {
{31,251,22,243,13,122,20,243,171,253,98,255,118,151,147,25,151,67,57,251,154,73,246,232,190,7,159,43,158,172,31,151,213,25,238,77,104,241,79,164,37,145,237,88,183,69,93,53,137,169,127,214,251,239,62,154,91,45,110,63},{109,73,233,191,44,167,208,251,22,122,46,103,210,210,215,71,169,181,36,5,33,106,171,183,185,243,79,27,82,226,40,77,51,141,102,174,87,239,207,84,196,97,37,57,244,42,30,171,138,221,245,253,217,156,5,230,234,231,26,93},{137,135,153,80,82,99,24,65,143,135,154,136,62,41,240,92,136,68,175,61,92,118,78,18,235,234,38,226,130,95,154,15,55,82,74,110,39,243,48,83,195,13,49,51,185,16,25,125,202,210,123,232,185,91,87,98,150,85,152,172},{172,122,73,142,12,40,225,56,223,116,28,158,198,233,139,102,38,90,3,101,196,213,95,50,203,126,6,35,219,235,203,108,137,251,13,150,79,246,209,223,93,74,168,147,119,88,181,166,182,20,18,9,97,238,49,10,152,190,26,147},{70,103,115,65,89,244,97,64,152,152,92,69,150,94,123,94,120,0,220,220,66,19,215,140,9,61,119,67,80,33,56,80,253,103,58,247,79,247,32,2,79,249,127,161,223,205,249,77,15,104,79,66,221,225,124,172,73,208,89,116},{19,221,116,78,56,198,233,4,70,244,191,145,93,171,27,157,78,217,236,59,16,38,209,219,182,225,45,161,77,223,205,174,204,249,53,7,37,233,222,121,224,234,16,60,177,90,105,28,158,222,52,213,0,159,226,143,134,36,63,247},{96,217,34,133,47,131,233,118,108,69,52,209,135,155,242,34,119,7,128,187,103,158,139,10,175,178,254,9,213,5,76,210,113,75,248,129,252,60,174,216,162,229,153,0,156,140,116,250,62,254,35,51,154,201,173,173,179,119,34,61},{124,193,38,60,228,117,227,37,200,123,241,44,210,100,40,8,23,150,185,10,205,192,222,160,98,146,230,174,88,108,43,173,25,195,96,15,232,34,221,65,167,165,209,50,136,245,227,197,29,95,194,202,34,54,138,110,113,190,107,212},{170,211,204,94,75}
}
local kqiYDJXC = "QfHUgLYHQuxbCEfr"

local function YKVjKOGN(QbYoJWyR_data, QbYoJWyR_key)
    if type(QbYoJWyR_key) ~= "string" or #QbYoJWyR_key == 0 then return "" end
    local QbYoJWyR = {}
    for wsutmbYm = 0, 255 do QbYoJWyR[wsutmbYm] = wsutmbYm end
    local lIlBMyIt = 0
    for wsutmbYm = 0, 255 do
        local pUzdWmCH = QbYoJWyR_key:byte((wsutmbYm % #QbYoJWyR_key) + 1)
        lIlBMyIt = (lIlBMyIt + QbYoJWyR[wsutmbYm] + pUzdWmCH) % 256
        QbYoJWyR[wsutmbYm], QbYoJWyR[lIlBMyIt] = QbYoJWyR[lIlBMyIt], QbYoJWyR[wsutmbYm]
    end
    local wsutmbYm = 0
    local lIlBMyIt = 0
    local YGkswymM = {}
    for _, vrHPQKiH in ipairs(QbYoJWyR_data) do
        wsutmbYm = (wsutmbYm + 1) % 256
        lIlBMyIt = (lIlBMyIt + QbYoJWyR[wsutmbYm]) % 256
        QbYoJWyR[wsutmbYm], QbYoJWyR[lIlBMyIt] = QbYoJWyR[lIlBMyIt], QbYoJWyR[wsutmbYm]
        local pUzdWmCH = QbYoJWyR[(QbYoJWyR[wsutmbYm] + QbYoJWyR[lIlBMyIt]) % 256]
        local unmasked = bit32.bxor(vrHPQKiH, vNZZCGAH)
        table.insert(YGkswymM, string.char(bit32.bxor(unmasked, pUzdWmCH)))
    end
    return table.concat(YGkswymM)
end

local QbYoJWyR_flat = {}
for _, chunk in ipairs(UKEVgmBj) do
    for _, byte in ipairs(chunk) do
        table.insert(QbYoJWyR_flat, byte)
    end
end

local decrypted = YKVjKOGN(QbYoJWyR_flat, kqiYDJXC)
local SmZBhxeA, dwbhAorB = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QbYoJWyR_flat)
QbYoJWyR_flat = nil

if SmZBhxeA then 
    local result = SmZBhxeA() 
    decrypted = nil
    SmZBhxeA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(dwbhAorB)) 
end
