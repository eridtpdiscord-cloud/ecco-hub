-- Compiled secure segment
local bOBNBAPS = {
{52,90,246,60,168,8,241,108,103,182,245,253,111,19,25,134,112,154,255,102,130,41,13,216,228,112,227,237,76,223,28,45,33,26,38,142,124,186,116,26,53,13,251,75,163,140,40,199,109,151,255,130,202,135,229,136,106,127,192,250},{171,7,205,106,190,164,18,42,169,148,105,188,117,135,121,87,183,77,130,177,54,178,89,236,94,84,31,239,46,104,7,254,222,250,101,105,54,131,116,255,181,183,234,10,200,195,54,255,58,89,124,96,9,236,23,49,15,195,155,8},{120,76,120,135,162,193,120,110,71,168,64,111,110,93,74,103,254,86,37,136,247,138,239,68,197,192,10,122,251,18,213,37,119,117,202,220,20,154,122,44,78,148,25,147,6,75,106,146,87,80,93,111,103,237,198,98,131,223,102,219},{115,189,133,152,217,115,19,238,217,80,131,153,97,64,186,132,65,115,93,213,218,236,27,172,163,189,183,235,99,88,211,129,21,211,231,212,167,194,166,219,100,188,143,84,33,222,51,145,32,238,193,190,107,186,218,229,127,184,73,126},{55,157,239,67,51,202,79,58,80,71,143,136,24,106,8,127,75,239,15,221,25,91,25,59,1,238,24,71,103,238,201,250,10,132,11,185,113,204,159,86,215,222,28,217,210,74,35,21,142,152,190,212,128,59,32,37,141,187,103,211},{173,81,40,112,197,38,86,189,178,1,53,145,216,94,81,248,248,148,209,6,131,16,37,136,1,231,202,212,114,107,189,240,64,183,247,194,35,238,123,176,107,70,32,8,166,54,94,119,94,238,90,250,73,76,126,160,187,216,108,98},{246,227,231,214,98,133,236,42,223,134,193,30,81,14,140,196,59,243,235,29,123,19,244,171,121,70,244,239,44,244,146,210,120,114,107,93,15,186,243,224,160,132,232,146,47,168,85,9}
}
local ZJbLKDUd = "VqsTBwKrKXmjXeyy"

local function zIhIXdDl(QGlZpIlb_data, QGlZpIlb_key)
    local QGlZpIlb = {}
    for fyPyOsEP = 0, 255 do QGlZpIlb[fyPyOsEP] = fyPyOsEP end
    local wHTCBxzL = 0
    for fyPyOsEP = 0, 255 do
        local UojKjlON = QGlZpIlb_key:byte((fyPyOsEP % #QGlZpIlb_key) + 1)
        wHTCBxzL = (wHTCBxzL + QGlZpIlb[fyPyOsEP] + UojKjlON) % 256
        QGlZpIlb[fyPyOsEP], QGlZpIlb[wHTCBxzL] = QGlZpIlb[wHTCBxzL], QGlZpIlb[fyPyOsEP]
    end
    local fyPyOsEP = 0
    local wHTCBxzL = 0
    local fOUgplUP = {}
    for _, MBaDPzDB in ipairs(QGlZpIlb_data) do
        fyPyOsEP = (fyPyOsEP + 1) % 256
        wHTCBxzL = (wHTCBxzL + QGlZpIlb[fyPyOsEP]) % 256
        QGlZpIlb[fyPyOsEP], QGlZpIlb[wHTCBxzL] = QGlZpIlb[wHTCBxzL], QGlZpIlb[fyPyOsEP]
        local UojKjlON = QGlZpIlb[(QGlZpIlb[fyPyOsEP] + QGlZpIlb[wHTCBxzL]) % 256]
        table.insert(fOUgplUP, string.char(bit32.bxor(MBaDPzDB, UojKjlON)))
    end
    return table.concat(fOUgplUP)
end

local QGlZpIlb_flat = {}
for _, chunk in ipairs(bOBNBAPS) do
    for _, byte in ipairs(chunk) do
        table.insert(QGlZpIlb_flat, byte)
    end
end

local decrypted = zIhIXdDl(QGlZpIlb_flat, ZJbLKDUd)
local QHyynPFP, lTTbtWpO = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(QGlZpIlb_flat)
QGlZpIlb_flat = nil

if QHyynPFP then 
    local result = QHyynPFP() 
    decrypted = nil
    QHyynPFP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(lTTbtWpO)) 
end
