-- Protected Segment (ui_themes)
local ZkqMnSQU = 179
local FlXIxkan = {
{18,16,107,9,166,58,49,169,173,113,149,78,49,217,255,15,234,104,38,27,27,151,40,216,249,48,52,40,237,34,237,146,70,123,99,73,47,70,176,94,133,241,253,97,182,225,149,94,25,109,192,31,174,107,187,197,122,179,218,168},{152,43,207,103,172,30,157,91,169,175,47,79,99,200,152,245,100,81,17,22,224,208,1,137,205,218,20,55,93,175,178,247,41,87,26,91,148,252,145,178,6,160,72,154,139,85,94,139,53,175,23,0,86,159,198,71,182,186,105,88},{10,228,45,124,68,163,112,119,25,66,222,171,133,44,255,95,150,151,19,248,142}
}
local bANAxsDK = "tISvvLQNuOEtCTHI"

local function FGMnmydO(JBZTAVXb_data, JBZTAVXb_key)
    if type(JBZTAVXb_key) ~= "string" or #JBZTAVXb_key == 0 then return "" end
    local JBZTAVXb = {}
    for ExewQRHa = 0, 255 do JBZTAVXb[ExewQRHa] = ExewQRHa end
    local PdfIXdXO = 0
    for ExewQRHa = 0, 255 do
        local nyCujulu = JBZTAVXb_key:byte((ExewQRHa % #JBZTAVXb_key) + 1)
        PdfIXdXO = (PdfIXdXO + JBZTAVXb[ExewQRHa] + nyCujulu) % 256
        JBZTAVXb[ExewQRHa], JBZTAVXb[PdfIXdXO] = JBZTAVXb[PdfIXdXO], JBZTAVXb[ExewQRHa]
    end
    local ExewQRHa = 0
    local PdfIXdXO = 0
    local clcEQeBE = {}
    for _, IyfMHHpJ in ipairs(JBZTAVXb_data) do
        ExewQRHa = (ExewQRHa + 1) % 256
        PdfIXdXO = (PdfIXdXO + JBZTAVXb[ExewQRHa]) % 256
        JBZTAVXb[ExewQRHa], JBZTAVXb[PdfIXdXO] = JBZTAVXb[PdfIXdXO], JBZTAVXb[ExewQRHa]
        local nyCujulu = JBZTAVXb[(JBZTAVXb[ExewQRHa] + JBZTAVXb[PdfIXdXO]) % 256]
        local unmasked = bit32.bxor(IyfMHHpJ, ZkqMnSQU)
        table.insert(clcEQeBE, string.char(bit32.bxor(unmasked, nyCujulu)))
    end
    return table.concat(clcEQeBE)
end

local JBZTAVXb_flat = {}
for _, chunk in ipairs(FlXIxkan) do
    for _, byte in ipairs(chunk) do
        table.insert(JBZTAVXb_flat, byte)
    end
end

local decrypted = FGMnmydO(JBZTAVXb_flat, bANAxsDK)
local obOIORNy, OUDCmIAA = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JBZTAVXb_flat)
JBZTAVXb_flat = nil

if obOIORNy then 
    local result = obOIORNy() 
    decrypted = nil
    obOIORNy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(OUDCmIAA)) 
end
