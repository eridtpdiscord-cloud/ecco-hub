-- Protected Segment (cache_invalidation)
local yGcaFoBR = 202
local QxITpHQM = {
{50,55,89,190,58,197,117,33,140,184,96,58,46,169,124,106,225,248,207,223,237,117,123,4,29,226,214,233,99,31,169,53,0,103,171,162,81,246,54,7,44,208,25,207,59,59,240,109,230,53,186,120,231,100,142,201,204,1,165,155},{171,0,146,176,137,135,246,181,207,3,94,125,103,113,9,182,229,245,124,88,48,173,223,255,32,228,182,13,104,85,193,77,15,97,170,71,217,115,86,73,206,191,150,70,241,135,228,181,56,160,68,85,88,53,190,73,31,40,195,171},{169,40,23,225,176,135,229,182,11,224,129,89,233,198,141,223,130,69,106,110,55,215,225,29,145,15,238,166,165,13}
}
local aRIfLKeL = "uubSyiFCDztTcSjz"

local function SiBZGmdz(DWSRWljM_data, DWSRWljM_key)
    if type(DWSRWljM_key) ~= "string" or #DWSRWljM_key == 0 then return "" end
    local DWSRWljM = {}
    for mOZYXWfH = 0, 255 do DWSRWljM[mOZYXWfH] = mOZYXWfH end
    local GECrxMPj = 0
    for mOZYXWfH = 0, 255 do
        local OVhTSRTr = DWSRWljM_key:byte((mOZYXWfH % #DWSRWljM_key) + 1)
        GECrxMPj = (GECrxMPj + DWSRWljM[mOZYXWfH] + OVhTSRTr) % 256
        DWSRWljM[mOZYXWfH], DWSRWljM[GECrxMPj] = DWSRWljM[GECrxMPj], DWSRWljM[mOZYXWfH]
    end
    local mOZYXWfH = 0
    local GECrxMPj = 0
    local mRKtbPSr = {}
    for _, XZtBAuow in ipairs(DWSRWljM_data) do
        mOZYXWfH = (mOZYXWfH + 1) % 256
        GECrxMPj = (GECrxMPj + DWSRWljM[mOZYXWfH]) % 256
        DWSRWljM[mOZYXWfH], DWSRWljM[GECrxMPj] = DWSRWljM[GECrxMPj], DWSRWljM[mOZYXWfH]
        local OVhTSRTr = DWSRWljM[(DWSRWljM[mOZYXWfH] + DWSRWljM[GECrxMPj]) % 256]
        local unmasked = bit32.bxor(XZtBAuow, yGcaFoBR)
        table.insert(mRKtbPSr, string.char(bit32.bxor(unmasked, OVhTSRTr)))
    end
    return table.concat(mRKtbPSr)
end

local DWSRWljM_flat = {}
for _, chunk in ipairs(QxITpHQM) do
    for _, byte in ipairs(chunk) do
        table.insert(DWSRWljM_flat, byte)
    end
end

local decrypted = SiBZGmdz(DWSRWljM_flat, aRIfLKeL)
local whSSihjN, kpzRFuUC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DWSRWljM_flat)
DWSRWljM_flat = nil

if whSSihjN then 
    local result = whSSihjN() 
    decrypted = nil
    whSSihjN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(kpzRFuUC)) 
end
