-- Compiled secure segment
local jaJUkAEL = {
{166,95,28,100,165,246,248,52,226,94,221,32,34,246,73,108,6,235,175,201,185,59,153,20,67,226,176,234,159,195,253,83,53,159,127,187,139,221,98,5,145,106,177,212,247,198,16,66,211,182,223,240,75,65,30,43,247,71,49,24},{58,93,143,157,78,164,210,137,104,216,15,198,143,199,88,60,182,37,102,166,59,34,173,109,135,162,102,83,197,9,142,168,198,207,142,139,87,236,37,246,232,100,117,61,92,239,174,255,92,231,133,156,180,190,88,225,12,212,20,102},{236,31,230,60,81,123,7,248,34,85,230,187,168,227,145,142,32,214,65,102,34}
}
local SCOphGIr = "LwIouqMwAjjOivVW"

local function lXtLxAtl(hDLRPaMW_data, hDLRPaMW_key)
    local hDLRPaMW = {}
    for LPUSvNTN = 0, 255 do hDLRPaMW[LPUSvNTN] = LPUSvNTN end
    local BLrkbiZU = 0
    for LPUSvNTN = 0, 255 do
        local HjGzdnVj = hDLRPaMW_key:byte((LPUSvNTN % #hDLRPaMW_key) + 1)
        BLrkbiZU = (BLrkbiZU + hDLRPaMW[LPUSvNTN] + HjGzdnVj) % 256
        hDLRPaMW[LPUSvNTN], hDLRPaMW[BLrkbiZU] = hDLRPaMW[BLrkbiZU], hDLRPaMW[LPUSvNTN]
    end
    local LPUSvNTN = 0
    local BLrkbiZU = 0
    local sPIHFlTN = {}
    for _, ExjZvQnd in ipairs(hDLRPaMW_data) do
        LPUSvNTN = (LPUSvNTN + 1) % 256
        BLrkbiZU = (BLrkbiZU + hDLRPaMW[LPUSvNTN]) % 256
        hDLRPaMW[LPUSvNTN], hDLRPaMW[BLrkbiZU] = hDLRPaMW[BLrkbiZU], hDLRPaMW[LPUSvNTN]
        local HjGzdnVj = hDLRPaMW[(hDLRPaMW[LPUSvNTN] + hDLRPaMW[BLrkbiZU]) % 256]
        table.insert(sPIHFlTN, string.char(bit32.bxor(ExjZvQnd, HjGzdnVj)))
    end
    return table.concat(sPIHFlTN)
end

local hDLRPaMW_flat = {}
for _, chunk in ipairs(jaJUkAEL) do
    for _, byte in ipairs(chunk) do
        table.insert(hDLRPaMW_flat, byte)
    end
end

local decrypted = lXtLxAtl(hDLRPaMW_flat, SCOphGIr)
local rbcJBziJ, uRGdgVsv = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(hDLRPaMW_flat)
hDLRPaMW_flat = nil

if rbcJBziJ then 
    local result = rbcJBziJ() 
    decrypted = nil
    rbcJBziJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(uRGdgVsv)) 
end
