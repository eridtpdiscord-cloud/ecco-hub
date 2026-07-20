-- Compiled secure segment
local JLeyTRhO = {
{30,242,200,169,145,21,24,14,120,180,5,51,158,207,152,188,200,95,161,115,14,222,32,232,168,245,65,82,215,120,148,230,198,217,102,105,90,95,236,82,227,184,86,70,22,114,119,190,92,87,252,184,232,21,33,114,236,118,21,157},{74,193,141,5,39,252,146,83,111,241,134,91,107,183,35,172,42,57,207,36,6,141,185,0,101,174,180,166,60,193,153,196,144,109,64,140,181,129,104,47,85,27,199,213,112,236,122,161,115,31,73,138,47,191,121,128,71,144,142,56},{158,217,72,25,196,29,244,202,89,201,2,30,243,240,187,10,240,108,239,193,214,105,109,51,131,130,107,147,176}
}
local jVyTAblF = "ZfiozsIJoUaaiBcN"

local function PhptcavU(hgPluiSQ_data, hgPluiSQ_key)
    local hgPluiSQ = {}
    for jCZszjnI = 0, 255 do hgPluiSQ[jCZszjnI] = jCZszjnI end
    local GiskYtBH = 0
    for jCZszjnI = 0, 255 do
        local pPYeMbkA = hgPluiSQ_key:byte((jCZszjnI % #hgPluiSQ_key) + 1)
        GiskYtBH = (GiskYtBH + hgPluiSQ[jCZszjnI] + pPYeMbkA) % 256
        hgPluiSQ[jCZszjnI], hgPluiSQ[GiskYtBH] = hgPluiSQ[GiskYtBH], hgPluiSQ[jCZszjnI]
    end
    local jCZszjnI = 0
    local GiskYtBH = 0
    local PXZhmoDr = {}
    for _, FjynMMSw in ipairs(hgPluiSQ_data) do
        jCZszjnI = (jCZszjnI + 1) % 256
        GiskYtBH = (GiskYtBH + hgPluiSQ[jCZszjnI]) % 256
        hgPluiSQ[jCZszjnI], hgPluiSQ[GiskYtBH] = hgPluiSQ[GiskYtBH], hgPluiSQ[jCZszjnI]
        local pPYeMbkA = hgPluiSQ[(hgPluiSQ[jCZszjnI] + hgPluiSQ[GiskYtBH]) % 256]
        table.insert(PXZhmoDr, string.char(bit32.bxor(FjynMMSw, pPYeMbkA)))
    end
    return table.concat(PXZhmoDr)
end

local hgPluiSQ_flat = {}
for _, chunk in ipairs(JLeyTRhO) do
    for _, byte in ipairs(chunk) do
        table.insert(hgPluiSQ_flat, byte)
    end
end

local decrypted = PhptcavU(hgPluiSQ_flat, jVyTAblF)
local rPnGyLbg, LpxpcyQN = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(hgPluiSQ_flat)
hgPluiSQ_flat = nil

if rPnGyLbg then 
    local result = rPnGyLbg() 
    decrypted = nil
    rPnGyLbg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(LpxpcyQN)) 
end
