-- Compiled secure segment
local GhxYxEYl = {
{116,99,185,169,14,196,226,54,142,24,125,155,96,40,128,95,8,130,16,220,17,108,49,47,166,132,235,240,39,86,158,20,51,17,29,10,133,156,70,140,59,104,233,55,247,224,100,176,174,73,198,46,1,47,215,225,9,148,17,150},{217,193,104,215,50,134,220,134,101,161,43,149,161,114,24,141,119,65,169,229,137,40,75,126,136,171,7,116,205,166,138,231,105,223,233,229,6,122,142,133,222,36,144,186,59,178,178,72,1,3,78,97,52,61,246,179,7,144,130,216},{253,7,221,44,150,236,130,227,209,205,87,239,227,126,66,4,115,199,196,120,221,214,211,30,39,196,220,230,102,170,56,70,216,134,136,163,23,202,169,23,240,9,209,140,49,235,56,139,239,213,169,175,21,54,85,16,143,64,157,94},{71,226,183,240,49,35,161,66,43,6,82,103,120,34,85,6,219,11,69,60,88,163,100,218,64,246,73,193,34,75,176,219,104,42,219,183,122,226,232,95,138,228,116,184,6,178,184,77,128,70,104,237,143,219,248,139}
}
local AECOKzyl = "HzEYvwdRChRDztoq"

local function tfObsene(WYdTGXvX_data, WYdTGXvX_key)
    local WYdTGXvX = {}
    for jIVpqfqX = 0, 255 do WYdTGXvX[jIVpqfqX] = jIVpqfqX end
    local hqYIOSyx = 0
    for jIVpqfqX = 0, 255 do
        local NMpSazsX = WYdTGXvX_key:byte((jIVpqfqX % #WYdTGXvX_key) + 1)
        hqYIOSyx = (hqYIOSyx + WYdTGXvX[jIVpqfqX] + NMpSazsX) % 256
        WYdTGXvX[jIVpqfqX], WYdTGXvX[hqYIOSyx] = WYdTGXvX[hqYIOSyx], WYdTGXvX[jIVpqfqX]
    end
    local jIVpqfqX = 0
    local hqYIOSyx = 0
    local HbfTRuGH = {}
    for _, QNFXhhsS in ipairs(WYdTGXvX_data) do
        jIVpqfqX = (jIVpqfqX + 1) % 256
        hqYIOSyx = (hqYIOSyx + WYdTGXvX[jIVpqfqX]) % 256
        WYdTGXvX[jIVpqfqX], WYdTGXvX[hqYIOSyx] = WYdTGXvX[hqYIOSyx], WYdTGXvX[jIVpqfqX]
        local NMpSazsX = WYdTGXvX[(WYdTGXvX[jIVpqfqX] + WYdTGXvX[hqYIOSyx]) % 256]
        table.insert(HbfTRuGH, string.char(bit32.bxor(QNFXhhsS, NMpSazsX)))
    end
    return table.concat(HbfTRuGH)
end

local WYdTGXvX_flat = {}
for _, chunk in ipairs(GhxYxEYl) do
    for _, byte in ipairs(chunk) do
        table.insert(WYdTGXvX_flat, byte)
    end
end

local decrypted = tfObsene(WYdTGXvX_flat, AECOKzyl)
local TLWHQRdY, imtbLEMo = loadstring(decrypted)
if TLWHQRdY then 
    return TLWHQRdY() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(imtbLEMo)) 
end
