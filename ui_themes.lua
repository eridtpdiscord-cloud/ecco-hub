-- Protected Segment (ui_themes)
local XoRVchFy = 155
local xwTQSKqK = {
{111,148,240,29,86,210,152,35,160,160,109,193,7,49,59,171,48,71,197,149,13,209,169,141,236,141,176,251,10,59,56,101,107,65,196,55,14,84,39,188,95,245,196,116,255,212,56,72,48,4,245,248,44,125,103,188,199,206,92,253},{39,75,180,54,37,248,150,250,178,218,134,126,130,151,225,5,142,87,248,135,202,28,42,217,79,74,63,123,197,126,157,6,15,236,54,186,123,67,44,87,166,85,95,249,214,215,174,229,30,117,191,251,179,79,1,72,64,90,227,89},{72,30,121,178,181,44,99,45,105,197,81,196,54,43,48,159,115,35,239,11,241}
}
local ajBNzemF = "AlptCyhybEOnUANj"

local function KnPvhKRP(tzzzSPNK_data, tzzzSPNK_key)
    local tzzzSPNK = {}
    for qmKmRdlh = 0, 255 do tzzzSPNK[qmKmRdlh] = qmKmRdlh end
    local auWzOVNJ = 0
    for qmKmRdlh = 0, 255 do
        local BDvePMPb = tzzzSPNK_key:byte((qmKmRdlh % #tzzzSPNK_key) + 1)
        auWzOVNJ = (auWzOVNJ + tzzzSPNK[qmKmRdlh] + BDvePMPb) % 256
        tzzzSPNK[qmKmRdlh], tzzzSPNK[auWzOVNJ] = tzzzSPNK[auWzOVNJ], tzzzSPNK[qmKmRdlh]
    end
    local qmKmRdlh = 0
    local auWzOVNJ = 0
    local ORsVRijW = {}
    for _, YWOPIpgC in ipairs(tzzzSPNK_data) do
        qmKmRdlh = (qmKmRdlh + 1) % 256
        auWzOVNJ = (auWzOVNJ + tzzzSPNK[qmKmRdlh]) % 256
        tzzzSPNK[qmKmRdlh], tzzzSPNK[auWzOVNJ] = tzzzSPNK[auWzOVNJ], tzzzSPNK[qmKmRdlh]
        local BDvePMPb = tzzzSPNK[(tzzzSPNK[qmKmRdlh] + tzzzSPNK[auWzOVNJ]) % 256]
        local unmasked = bit32.bxor(YWOPIpgC, XoRVchFy)
        table.insert(ORsVRijW, string.char(bit32.bxor(unmasked, BDvePMPb)))
    end
    return table.concat(ORsVRijW)
end

local tzzzSPNK_flat = {}
for _, chunk in ipairs(xwTQSKqK) do
    for _, byte in ipairs(chunk) do
        table.insert(tzzzSPNK_flat, byte)
    end
end

local decrypted = KnPvhKRP(tzzzSPNK_flat, ajBNzemF)
local AsgOsFrw, zhxeeggG = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(tzzzSPNK_flat)
tzzzSPNK_flat = nil

if AsgOsFrw then 
    local result = AsgOsFrw() 
    decrypted = nil
    AsgOsFrw = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(zhxeeggG)) 
end
