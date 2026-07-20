-- Compiled secure segment
local hcRvDYVt = {
{14,42,240,114,94,126,58,85,213,94,202,78,92,244,79,199,40,245,2,60,139,221,212,240,239,31,236,239,61,15,106,218,127,90,29,3,177,154,203,40,221,131,69,211,225,89,146,236,73,7,32,99,5,55,182,124,222,89,54,111},{131,221,252,253,186,233,112,219,244,79,165,95,230,16,225,68,119,226,160,197,67,117,192,215,160,147,228,66,223,195,80,202,250,165,5,15,7,17,15,10,205,115,44,170,197,184,59,24,44,31,240,165,77,127,26,53,133,19,135,95},{151,255,96,123,62,10,219,168,152,150,162,53,151,254,74,152,252,232,132,80,119,2,185,165,203}
}
local XJnkxcME = "uwmhyiDUgdrZCzzW"

local function UwwzgAAs(wmOTIRqS_data, wmOTIRqS_key)
    local wmOTIRqS = {}
    for BNdGOKNS = 0, 255 do wmOTIRqS[BNdGOKNS] = BNdGOKNS end
    local QNitztgB = 0
    for BNdGOKNS = 0, 255 do
        local VPannihE = wmOTIRqS_key:byte((BNdGOKNS % #wmOTIRqS_key) + 1)
        QNitztgB = (QNitztgB + wmOTIRqS[BNdGOKNS] + VPannihE) % 256
        wmOTIRqS[BNdGOKNS], wmOTIRqS[QNitztgB] = wmOTIRqS[QNitztgB], wmOTIRqS[BNdGOKNS]
    end
    local BNdGOKNS = 0
    local QNitztgB = 0
    local DhezmVlC = {}
    for _, YeXbpBjf in ipairs(wmOTIRqS_data) do
        BNdGOKNS = (BNdGOKNS + 1) % 256
        QNitztgB = (QNitztgB + wmOTIRqS[BNdGOKNS]) % 256
        wmOTIRqS[BNdGOKNS], wmOTIRqS[QNitztgB] = wmOTIRqS[QNitztgB], wmOTIRqS[BNdGOKNS]
        local VPannihE = wmOTIRqS[(wmOTIRqS[BNdGOKNS] + wmOTIRqS[QNitztgB]) % 256]
        table.insert(DhezmVlC, string.char(bit32.bxor(YeXbpBjf, VPannihE)))
    end
    return table.concat(DhezmVlC)
end

local wmOTIRqS_flat = {}
for _, chunk in ipairs(hcRvDYVt) do
    for _, byte in ipairs(chunk) do
        table.insert(wmOTIRqS_flat, byte)
    end
end

local decrypted = UwwzgAAs(wmOTIRqS_flat, XJnkxcME)
local LfitRTGC, nLaLysNo = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(wmOTIRqS_flat)
wmOTIRqS_flat = nil

if LfitRTGC then 
    local result = LfitRTGC() 
    decrypted = nil
    LfitRTGC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(nLaLysNo)) 
end
