-- Protected Segment (network_optimizer)
local DVgCyXsR = 51
local FRgdYPpH = {
{71,38,47,165,142,171,160,173,135,20,201,122,60,221,106,83,157,241,154,128,60,204,205,160,217,83,19,148,31,121,212,44,247,18,203,142,250,58,133,146,61,50,84,51,41,240,179,48,32,170,246,168,27,30,79,135,112,240,187,26},{194,201,42,81,227,62,216,133,97,86,120,74,234,166,74,67,24,228,76,227,29,52,199,168,154,164,154,113,179,209,139,51,30,200,224,80,126,62,140,152,232,233,125,41,41,42,28,7,143,64,240,48,100,14,61,243,174,103,223,183},{48,233,76,174,19,103,125,225,111,62,169,105,219,115,207,226,99,153,194,94,17,35,130,226,219,88,191,212,109}
}
local GVghRxSQ = "kpFtYnyNiSWDeXFt"

local function xmFeixVq(EYYRLvTE_data, EYYRLvTE_key)
    local EYYRLvTE = {}
    for TxGFkTtR = 0, 255 do EYYRLvTE[TxGFkTtR] = TxGFkTtR end
    local VvHAkrGz = 0
    for TxGFkTtR = 0, 255 do
        local qsEpejyH = EYYRLvTE_key:byte((TxGFkTtR % #EYYRLvTE_key) + 1)
        VvHAkrGz = (VvHAkrGz + EYYRLvTE[TxGFkTtR] + qsEpejyH) % 256
        EYYRLvTE[TxGFkTtR], EYYRLvTE[VvHAkrGz] = EYYRLvTE[VvHAkrGz], EYYRLvTE[TxGFkTtR]
    end
    local TxGFkTtR = 0
    local VvHAkrGz = 0
    local StPewqJF = {}
    for _, iCFiYzxK in ipairs(EYYRLvTE_data) do
        TxGFkTtR = (TxGFkTtR + 1) % 256
        VvHAkrGz = (VvHAkrGz + EYYRLvTE[TxGFkTtR]) % 256
        EYYRLvTE[TxGFkTtR], EYYRLvTE[VvHAkrGz] = EYYRLvTE[VvHAkrGz], EYYRLvTE[TxGFkTtR]
        local qsEpejyH = EYYRLvTE[(EYYRLvTE[TxGFkTtR] + EYYRLvTE[VvHAkrGz]) % 256]
        local unmasked = bit32.bxor(iCFiYzxK, DVgCyXsR)
        table.insert(StPewqJF, string.char(bit32.bxor(unmasked, qsEpejyH)))
    end
    return table.concat(StPewqJF)
end

local EYYRLvTE_flat = {}
for _, chunk in ipairs(FRgdYPpH) do
    for _, byte in ipairs(chunk) do
        table.insert(EYYRLvTE_flat, byte)
    end
end

local decrypted = xmFeixVq(EYYRLvTE_flat, GVghRxSQ)
local UHhcHZje, mhOunWzc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EYYRLvTE_flat)
EYYRLvTE_flat = nil

if UHhcHZje then 
    local result = UHhcHZje() 
    decrypted = nil
    UHhcHZje = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(mhOunWzc)) 
end
