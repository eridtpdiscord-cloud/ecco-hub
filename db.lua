-- Protected Segment (db)
local tLGqVfnU = 147
local WoAfbpSi = {
{235,220,57,179,31,108,111,247,93,213,202,58,243,158,233,33,116,48,211,83,132,63,17,51,102,99,213,63,48,142,201,243,9,56,125,137,231,167,53,197,12,28,157,59,36,15,123,118,218,58,34,81,33,131,77,246,19,0,114,171},{95,46,98,70,68,148,139,228,170,28,195,9,47,218,195,112,58,5,249,163,153,213,145,149,33,194,69,86,206,137,102,35,210,224,247,58,163,80,120,80,55,39,178,254,100,209,141,191,79,190,18,238,168,43,41,165,208,139,108,168},{221,162,189,32,118,97,150,54,201,210,113,2,36,194,222,134,98,217,15,163,235,158,133,197,99,236,125,79,178,231,27,42,108,29,14,107,124,207,203,12,32,117,34,149,248,249,129,57,24,137,25,166,3,25,183,255,64,184,254,113},{133,169,74,217,94,209,82,243,239,182,155,42,101,236,87,176,7,136,41,218,68,73,217,237,226,75,89,182,72,240,218,27,132,195,25,98,235,65,73,159,158,161,139,85,201,92,199,188,183,96,243,61,124,162,227,217,146,39,82,13},{193,125,235,242,22,161,172,114,150,92,232,119,104,117,206,22,178,192,179,115,245,164,171,7,23,13,100,186,136,105,148,56,160,188,158,105,180,154,48,223,52,177,53,15,126,52,138,37,154,50,92,56,126,58,142,6,133,252,0,61},{124,177,39,109,163,18,191,214,120,67,66,80,170,129,87,52,166,107,185,242,20,6,45,192,194,18,142,190,227,69,157,51,87,19,27,188,101,178,149,231,139,176,176,0,40,174,181,227,150,233,174,240,145,149,43,99,20,241,82,74},{252,52,212,135,111,192,13,154,245,236,172,229,132,55,58,173,226,242,46,87,33,89,246,170,60,110,93,252,90,38,165,42,112,73,204,77,43,102,2,82,114,3,33,87,201,184,13,54,150,251,61,50,205,122,83,213,224,225,242,63},{163,244,77,142,1,117,172,82,220,83,252,138,14,211,136,82,1,164,192,79,153,23,46,235,164,97,132,195,78,84,210,165,28,50,20,66,60,155,246,150,142,132,244,222,231,37,152,8,44,49,212,235,6,88,171,189,156,125,92,142}
}
local pwHRNzQw = "TcRTJCctIcxFxLLg"

local function MvsJUcuG(QMFIEJJf_data, QMFIEJJf_key)
    local QMFIEJJf = {}
    for ZnzKkqYo = 0, 255 do QMFIEJJf[ZnzKkqYo] = ZnzKkqYo end
    local NxfUaoid = 0
    for ZnzKkqYo = 0, 255 do
        local weJnetUk = QMFIEJJf_key:byte((ZnzKkqYo % #QMFIEJJf_key) + 1)
        NxfUaoid = (NxfUaoid + QMFIEJJf[ZnzKkqYo] + weJnetUk) % 256
        QMFIEJJf[ZnzKkqYo], QMFIEJJf[NxfUaoid] = QMFIEJJf[NxfUaoid], QMFIEJJf[ZnzKkqYo]
    end
    local ZnzKkqYo = 0
    local NxfUaoid = 0
    local TWRkozfI = {}
    for _, CHwpvJdp in ipairs(QMFIEJJf_data) do
        ZnzKkqYo = (ZnzKkqYo + 1) % 256
        NxfUaoid = (NxfUaoid + QMFIEJJf[ZnzKkqYo]) % 256
        QMFIEJJf[ZnzKkqYo], QMFIEJJf[NxfUaoid] = QMFIEJJf[NxfUaoid], QMFIEJJf[ZnzKkqYo]
        local weJnetUk = QMFIEJJf[(QMFIEJJf[ZnzKkqYo] + QMFIEJJf[NxfUaoid]) % 256]
        local unmasked = bit32.bxor(CHwpvJdp, tLGqVfnU)
        table.insert(TWRkozfI, string.char(bit32.bxor(unmasked, weJnetUk)))
    end
    return table.concat(TWRkozfI)
end

local QMFIEJJf_flat = {}
for _, chunk in ipairs(WoAfbpSi) do
    for _, byte in ipairs(chunk) do
        table.insert(QMFIEJJf_flat, byte)
    end
end

local decrypted = MvsJUcuG(QMFIEJJf_flat, pwHRNzQw)
local LwVGszhP, TwoQSpeJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QMFIEJJf_flat)
QMFIEJJf_flat = nil

if LwVGszhP then 
    local result = LwVGszhP() 
    decrypted = nil
    LwVGszhP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(TwoQSpeJ)) 
end
