-- Compiled secure segment
local qDxfczuX = {
{155,228,124,65,25,46,132,180,169,25,111,16,220,81,150,67,133,110,116,17,191,238,81,54,52,81,122,131,231,188,148,105,246,252,106,128,38,183,129,31,146,88,239,252,45,71,54,33,115,202,117,64,162,125,170,32,121,138,146,97},{5,124,185,97,92,15,166,73,21,88,115,196,134,97,232,184,130,165,221,187,138,115,238,82,134,44,160,123,183,252,190,197,182,11,109,146,251,207,91,43,72,233,219,213,152,215,100,15,149,28,31,157,7,192,114,145,147,64,151,109},{187,144,9,79,85,73,67,151,196,79,186,109,183,251,158,230,71,54,124,40,28,56,194,238,22,116,207,111,173,128}
}
local BuaYAOpS = "wUYmVLpADbsFNMPF"

local function zCoMghrn(yMxEHVHI_data, yMxEHVHI_key)
    local yMxEHVHI = {}
    for TIIOzREi = 0, 255 do yMxEHVHI[TIIOzREi] = TIIOzREi end
    local xfpMMGDH = 0
    for TIIOzREi = 0, 255 do
        local mJqIbVqr = yMxEHVHI_key:byte((TIIOzREi % #yMxEHVHI_key) + 1)
        xfpMMGDH = (xfpMMGDH + yMxEHVHI[TIIOzREi] + mJqIbVqr) % 256
        yMxEHVHI[TIIOzREi], yMxEHVHI[xfpMMGDH] = yMxEHVHI[xfpMMGDH], yMxEHVHI[TIIOzREi]
    end
    local TIIOzREi = 0
    local xfpMMGDH = 0
    local ieNnTwYP = {}
    for _, qjEzyvdI in ipairs(yMxEHVHI_data) do
        TIIOzREi = (TIIOzREi + 1) % 256
        xfpMMGDH = (xfpMMGDH + yMxEHVHI[TIIOzREi]) % 256
        yMxEHVHI[TIIOzREi], yMxEHVHI[xfpMMGDH] = yMxEHVHI[xfpMMGDH], yMxEHVHI[TIIOzREi]
        local mJqIbVqr = yMxEHVHI[(yMxEHVHI[TIIOzREi] + yMxEHVHI[xfpMMGDH]) % 256]
        table.insert(ieNnTwYP, string.char(bit32.bxor(qjEzyvdI, mJqIbVqr)))
    end
    return table.concat(ieNnTwYP)
end

local yMxEHVHI_flat = {}
for _, chunk in ipairs(qDxfczuX) do
    for _, byte in ipairs(chunk) do
        table.insert(yMxEHVHI_flat, byte)
    end
end

local decrypted = zCoMghrn(yMxEHVHI_flat, BuaYAOpS)
local gSxlFsMo, lDHapOAu = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(yMxEHVHI_flat)
yMxEHVHI_flat = nil

if gSxlFsMo then 
    local result = gSxlFsMo() 
    decrypted = nil
    gSxlFsMo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(lDHapOAu)) 
end
