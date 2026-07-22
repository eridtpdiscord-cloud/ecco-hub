-- Protected Segment (anti_cheat_bypass)
local mEYcFunH = 61
local EbXbaHAS = {
{124,82,211,12,67,215,206,240,198,14,68,5,157,86,253,237,3,225,51,203,179,235,167,219,108,143,38,61,191,119,237,84,191,146,49,218,19,136,226,90,91,77,109,183,253,61,249,8,106,151,102,59,214,54,8,213,175,147,214,85},{168,203,13,75,87,104,27,22,11,223,155,68,25,27,93,51,187,138,217,166,68,237,73,170,227,18,65,160,63,57,233,120,251,177,7,104,200,59,244,214,237,201,208,138,141,82,126,149,133,144,112,188,158,10,116,131,131,212,64,143},{136,72,82,154,101,128,222,68,130,127,146,120,45,67,162,224,212,12,161,151,135,142,2,113,100,148,209,0,251}
}
local FrsCMIgR = "fJBTWFhFSkEAdtEv"

local function gyEsGsxa(PARiHoKF_data, PARiHoKF_key)
    local PARiHoKF = {}
    for WBoyFytU = 0, 255 do PARiHoKF[WBoyFytU] = WBoyFytU end
    local uKrOuHVB = 0
    for WBoyFytU = 0, 255 do
        local IJKkVzak = PARiHoKF_key:byte((WBoyFytU % #PARiHoKF_key) + 1)
        uKrOuHVB = (uKrOuHVB + PARiHoKF[WBoyFytU] + IJKkVzak) % 256
        PARiHoKF[WBoyFytU], PARiHoKF[uKrOuHVB] = PARiHoKF[uKrOuHVB], PARiHoKF[WBoyFytU]
    end
    local WBoyFytU = 0
    local uKrOuHVB = 0
    local mfdLcLPn = {}
    for _, EkOyClEc in ipairs(PARiHoKF_data) do
        WBoyFytU = (WBoyFytU + 1) % 256
        uKrOuHVB = (uKrOuHVB + PARiHoKF[WBoyFytU]) % 256
        PARiHoKF[WBoyFytU], PARiHoKF[uKrOuHVB] = PARiHoKF[uKrOuHVB], PARiHoKF[WBoyFytU]
        local IJKkVzak = PARiHoKF[(PARiHoKF[WBoyFytU] + PARiHoKF[uKrOuHVB]) % 256]
        local unmasked = bit32.bxor(EkOyClEc, mEYcFunH)
        table.insert(mfdLcLPn, string.char(bit32.bxor(unmasked, IJKkVzak)))
    end
    return table.concat(mfdLcLPn)
end

local PARiHoKF_flat = {}
for _, chunk in ipairs(EbXbaHAS) do
    for _, byte in ipairs(chunk) do
        table.insert(PARiHoKF_flat, byte)
    end
end

local decrypted = gyEsGsxa(PARiHoKF_flat, FrsCMIgR)
local DspCILMe, PcjmnAtI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PARiHoKF_flat)
PARiHoKF_flat = nil

if DspCILMe then 
    local result = DspCILMe() 
    decrypted = nil
    DspCILMe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(PcjmnAtI)) 
end
