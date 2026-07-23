-- Protected Segment (ui_themes)
local KItNyRbI = 99
local mBUzlkEP = {
{180,33,201,83,88,108,187,20,227,195,211,41,4,73,161,195,179,9,78,255,174,61,234,167,147,36,209,20,32,160,95,143,178,159,252,219,51,111,197,153,10,198,62,65,169,6,178,243,103,36,113,141,175,78,24,215,198,67,0,182},{114,141,197,219,162,61,119,225,86,77,133,85,231,109,109,169,49,29,154,211,173,169,116,238,239,59,99,221,37,93,85,160,103,216,111,45,11,230,157,162,36,222,115,44,240,118,28,63,74,157,10,137,248,22,21,85,45,190,128,37},{224,210,118,45,221,42,55,8,154,106,230,138,240,105,74,72,73,102,55,225,216}
}
local gTpfMNbd = "UJBzrGwxeLUcVSXQ"

local function yZRSSKUi(QwGeIEOl_data, QwGeIEOl_key)
    if type(QwGeIEOl_key) ~= "string" or #QwGeIEOl_key == 0 then return "" end
    local QwGeIEOl = {}
    for MqnZjUcp = 0, 255 do QwGeIEOl[MqnZjUcp] = MqnZjUcp end
    local LgoLiGXc = 0
    for MqnZjUcp = 0, 255 do
        local CKuFRnEi = QwGeIEOl_key:byte((MqnZjUcp % #QwGeIEOl_key) + 1)
        LgoLiGXc = (LgoLiGXc + QwGeIEOl[MqnZjUcp] + CKuFRnEi) % 256
        QwGeIEOl[MqnZjUcp], QwGeIEOl[LgoLiGXc] = QwGeIEOl[LgoLiGXc], QwGeIEOl[MqnZjUcp]
    end
    local MqnZjUcp = 0
    local LgoLiGXc = 0
    local mTZarrpF = {}
    for _, vxIslNRh in ipairs(QwGeIEOl_data) do
        MqnZjUcp = (MqnZjUcp + 1) % 256
        LgoLiGXc = (LgoLiGXc + QwGeIEOl[MqnZjUcp]) % 256
        QwGeIEOl[MqnZjUcp], QwGeIEOl[LgoLiGXc] = QwGeIEOl[LgoLiGXc], QwGeIEOl[MqnZjUcp]
        local CKuFRnEi = QwGeIEOl[(QwGeIEOl[MqnZjUcp] + QwGeIEOl[LgoLiGXc]) % 256]
        local unmasked = bit32.bxor(vxIslNRh, KItNyRbI)
        table.insert(mTZarrpF, string.char(bit32.bxor(unmasked, CKuFRnEi)))
    end
    return table.concat(mTZarrpF)
end

local QwGeIEOl_flat = {}
for _, chunk in ipairs(mBUzlkEP) do
    for _, byte in ipairs(chunk) do
        table.insert(QwGeIEOl_flat, byte)
    end
end

local decrypted = yZRSSKUi(QwGeIEOl_flat, gTpfMNbd)
local JVFAgOBm, IpEkJlMU = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QwGeIEOl_flat)
QwGeIEOl_flat = nil

if JVFAgOBm then 
    local result = JVFAgOBm() 
    decrypted = nil
    JVFAgOBm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(IpEkJlMU)) 
end
