-- Protected Segment (teleport_handler)
local deCvDJcw = 107
local ySCYluJJ = {
{143,17,109,80,159,247,227,49,239,122,45,122,225,176,64,28,245,143,189,58,3,136,16,243,140,36,24,49,104,243,153,11,100,157,118,31,110,192,210,144,38,190,94,56,103,253,4,251,205,32,222,175,167,204,98,53,168,109,212,228},{14,212,12,71,13,98,17,29,23,123,121,59,135,54,139,153,56,60,213,75,224,237,68,104,47,12,3,184,88,132,105,49,209,27,178,194,253,43,252,181,204,250,90,53,142,73,212,44,108,227,213,168,207,145,100,247,30,159,60,68},{46,172,222,138,46,37,81,162,45,233,73,187,100,237,241,83,50,232,132,191,162,87,150,191,168,63,57,197}
}
local StqTDaGK = "LmPNavvntbIqGYdw"

local function ENdJofdS(YhMjFXcT_data, YhMjFXcT_key)
    if type(YhMjFXcT_key) ~= "string" or #YhMjFXcT_key == 0 then return "" end
    local YhMjFXcT = {}
    for NNrknGsz = 0, 255 do YhMjFXcT[NNrknGsz] = NNrknGsz end
    local QpiXWzAC = 0
    for NNrknGsz = 0, 255 do
        local rIfIUuoy = YhMjFXcT_key:byte((NNrknGsz % #YhMjFXcT_key) + 1)
        QpiXWzAC = (QpiXWzAC + YhMjFXcT[NNrknGsz] + rIfIUuoy) % 256
        YhMjFXcT[NNrknGsz], YhMjFXcT[QpiXWzAC] = YhMjFXcT[QpiXWzAC], YhMjFXcT[NNrknGsz]
    end
    local NNrknGsz = 0
    local QpiXWzAC = 0
    local wvDNWCRk = {}
    for _, zBOVZweg in ipairs(YhMjFXcT_data) do
        NNrknGsz = (NNrknGsz + 1) % 256
        QpiXWzAC = (QpiXWzAC + YhMjFXcT[NNrknGsz]) % 256
        YhMjFXcT[NNrknGsz], YhMjFXcT[QpiXWzAC] = YhMjFXcT[QpiXWzAC], YhMjFXcT[NNrknGsz]
        local rIfIUuoy = YhMjFXcT[(YhMjFXcT[NNrknGsz] + YhMjFXcT[QpiXWzAC]) % 256]
        local unmasked = bit32.bxor(zBOVZweg, deCvDJcw)
        table.insert(wvDNWCRk, string.char(bit32.bxor(unmasked, rIfIUuoy)))
    end
    return table.concat(wvDNWCRk)
end

local YhMjFXcT_flat = {}
for _, chunk in ipairs(ySCYluJJ) do
    for _, byte in ipairs(chunk) do
        table.insert(YhMjFXcT_flat, byte)
    end
end

local decrypted = ENdJofdS(YhMjFXcT_flat, StqTDaGK)
local RGXtkjOB, nRgSjyvO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(YhMjFXcT_flat)
YhMjFXcT_flat = nil

if RGXtkjOB then 
    local result = RGXtkjOB() 
    decrypted = nil
    RGXtkjOB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(nRgSjyvO)) 
end
