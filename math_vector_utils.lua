-- Protected Segment (math_vector_utils)
local KwdBWQWd = 12
local mkRODgmJ = {
{234,229,26,224,36,16,138,225,167,186,192,254,64,170,166,3,129,161,161,213,37,41,184,116,55,79,177,200,160,88,241,29,6,169,216,219,103,166,68,64,97,98,88,188,239,185,255,29,220,146,137,191,193,195,55,54,155,215,162,148},{197,7,47,96,7,155,220,10,193,14,101,127,244,168,10,175,40,168,104,148,9,85,247,142,4,97,74,60,32,0,203,5,75,81,39,70,192,7,144,5,132,15,176,192,55,52,47,10,138,159,59,165,34,237,10,125,169,168,58,90},{8,91,115,14,43,173,221,182,104,147,47,228,239,93,233,191,24,249,103,51,205,12,97,4,85,179,254,76,156}
}
local thFLTEFj = "DRcytZBSeBnZEDxN"

local function dJsTJDIX(QJLnpYzo_data, QJLnpYzo_key)
    if type(QJLnpYzo_key) ~= "string" or #QJLnpYzo_key == 0 then return "" end
    local QJLnpYzo = {}
    for PTlTtmQK = 0, 255 do QJLnpYzo[PTlTtmQK] = PTlTtmQK end
    local MHSfrRsi = 0
    for PTlTtmQK = 0, 255 do
        local JkvqgeBQ = QJLnpYzo_key:byte((PTlTtmQK % #QJLnpYzo_key) + 1)
        MHSfrRsi = (MHSfrRsi + QJLnpYzo[PTlTtmQK] + JkvqgeBQ) % 256
        QJLnpYzo[PTlTtmQK], QJLnpYzo[MHSfrRsi] = QJLnpYzo[MHSfrRsi], QJLnpYzo[PTlTtmQK]
    end
    local PTlTtmQK = 0
    local MHSfrRsi = 0
    local gSxtGolz = {}
    for _, aYEQFzed in ipairs(QJLnpYzo_data) do
        PTlTtmQK = (PTlTtmQK + 1) % 256
        MHSfrRsi = (MHSfrRsi + QJLnpYzo[PTlTtmQK]) % 256
        QJLnpYzo[PTlTtmQK], QJLnpYzo[MHSfrRsi] = QJLnpYzo[MHSfrRsi], QJLnpYzo[PTlTtmQK]
        local JkvqgeBQ = QJLnpYzo[(QJLnpYzo[PTlTtmQK] + QJLnpYzo[MHSfrRsi]) % 256]
        local unmasked = bit32.bxor(aYEQFzed, KwdBWQWd)
        table.insert(gSxtGolz, string.char(bit32.bxor(unmasked, JkvqgeBQ)))
    end
    return table.concat(gSxtGolz)
end

local QJLnpYzo_flat = {}
for _, chunk in ipairs(mkRODgmJ) do
    for _, byte in ipairs(chunk) do
        table.insert(QJLnpYzo_flat, byte)
    end
end

local decrypted = dJsTJDIX(QJLnpYzo_flat, thFLTEFj)
local QrbgAlOm, hWwaBtTJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QJLnpYzo_flat)
QJLnpYzo_flat = nil

if QrbgAlOm then 
    local result = QrbgAlOm() 
    decrypted = nil
    QrbgAlOm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(hWwaBtTJ)) 
end
