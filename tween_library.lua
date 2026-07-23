-- Protected Segment (tween_library)
local nTgyOZnA = 19
local ZKqMTnUm = {
{241,114,71,45,177,154,122,149,68,125,71,89,149,57,176,112,189,214,45,116,77,0,6,216,211,186,49,53,141,78,92,182,12,138,131,24,190,34,56,201,65,10,177,61,15,240,34,138,173,20,187,183,183,24,42,168,39,181,230,154},{85,129,18,197,29,31,237,105,25,83,65,170,144,156,131,183,114,92,216,60,117,100,136,95,116,56,190,141,187,12,241,60,109,231,27,2,216,205,162,140,150,173,69,191,235,131,12,70,223,248,4,34,107,73,214,208,75,233,224,54},{62,130,104,204,217,182,65,242,22,221,153,36,87,147,251,76,195,127,77,201,181,87,170,161,200}
}
local RfsSXDne = "WRnKeFvVPsjyXQTE"

local function eSXNeKIU(QTgcbEQf_data, QTgcbEQf_key)
    if type(QTgcbEQf_key) ~= "string" or #QTgcbEQf_key == 0 then return "" end
    local QTgcbEQf = {}
    for eTxMGmbv = 0, 255 do QTgcbEQf[eTxMGmbv] = eTxMGmbv end
    local GIlNKmla = 0
    for eTxMGmbv = 0, 255 do
        local IRGduPeU = QTgcbEQf_key:byte((eTxMGmbv % #QTgcbEQf_key) + 1)
        GIlNKmla = (GIlNKmla + QTgcbEQf[eTxMGmbv] + IRGduPeU) % 256
        QTgcbEQf[eTxMGmbv], QTgcbEQf[GIlNKmla] = QTgcbEQf[GIlNKmla], QTgcbEQf[eTxMGmbv]
    end
    local eTxMGmbv = 0
    local GIlNKmla = 0
    local DiTBscNO = {}
    for _, gNLfNaCl in ipairs(QTgcbEQf_data) do
        eTxMGmbv = (eTxMGmbv + 1) % 256
        GIlNKmla = (GIlNKmla + QTgcbEQf[eTxMGmbv]) % 256
        QTgcbEQf[eTxMGmbv], QTgcbEQf[GIlNKmla] = QTgcbEQf[GIlNKmla], QTgcbEQf[eTxMGmbv]
        local IRGduPeU = QTgcbEQf[(QTgcbEQf[eTxMGmbv] + QTgcbEQf[GIlNKmla]) % 256]
        local unmasked = bit32.bxor(gNLfNaCl, nTgyOZnA)
        table.insert(DiTBscNO, string.char(bit32.bxor(unmasked, IRGduPeU)))
    end
    return table.concat(DiTBscNO)
end

local QTgcbEQf_flat = {}
for _, chunk in ipairs(ZKqMTnUm) do
    for _, byte in ipairs(chunk) do
        table.insert(QTgcbEQf_flat, byte)
    end
end

local decrypted = eSXNeKIU(QTgcbEQf_flat, RfsSXDne)
local COKILUHZ, QpLCansq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QTgcbEQf_flat)
QTgcbEQf_flat = nil

if COKILUHZ then 
    local result = COKILUHZ() 
    decrypted = nil
    COKILUHZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(QpLCansq)) 
end
