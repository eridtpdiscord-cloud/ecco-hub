-- Protected Segment (tween_library)
local bpwxEmzY = 184
local vbEuWCjp = {
{0,60,224,137,73,56,19,234,123,161,64,125,227,31,161,244,175,156,35,198,171,119,134,165,140,167,41,215,67,254,201,35,165,9,221,42,173,38,38,17,165,179,111,191,5,90,145,23,26,27,239,76,173,21,246,40,36,52,122,82},{223,164,133,231,137,36,19,161,125,251,252,244,128,127,121,222,7,222,221,236,201,62,24,202,165,175,41,114,170,203,62,203,242,212,144,24,128,173,214,228,40,201,235,198,237,121,150,206,197,124,127,10,195,178,99,27,197,12,235,3},{101,0,196,43,72,87,81,240,255,4,30,177,83,233,72,45,165,62,129,201,38,90,95,191,177}
}
local lDtxcnEP = "xsjUxPjMBkTuQEJD"

local function VASLjIJT(gnzXWvMu_data, gnzXWvMu_key)
    if type(gnzXWvMu_key) ~= "string" or #gnzXWvMu_key == 0 then return "" end
    local gnzXWvMu = {}
    for pbEoqktq = 0, 255 do gnzXWvMu[pbEoqktq] = pbEoqktq end
    local bkBCzRuE = 0
    for pbEoqktq = 0, 255 do
        local wdMfBljd = gnzXWvMu_key:byte((pbEoqktq % #gnzXWvMu_key) + 1)
        bkBCzRuE = (bkBCzRuE + gnzXWvMu[pbEoqktq] + wdMfBljd) % 256
        gnzXWvMu[pbEoqktq], gnzXWvMu[bkBCzRuE] = gnzXWvMu[bkBCzRuE], gnzXWvMu[pbEoqktq]
    end
    local pbEoqktq = 0
    local bkBCzRuE = 0
    local ucArlibR = {}
    for _, kTxLJXHS in ipairs(gnzXWvMu_data) do
        pbEoqktq = (pbEoqktq + 1) % 256
        bkBCzRuE = (bkBCzRuE + gnzXWvMu[pbEoqktq]) % 256
        gnzXWvMu[pbEoqktq], gnzXWvMu[bkBCzRuE] = gnzXWvMu[bkBCzRuE], gnzXWvMu[pbEoqktq]
        local wdMfBljd = gnzXWvMu[(gnzXWvMu[pbEoqktq] + gnzXWvMu[bkBCzRuE]) % 256]
        local unmasked = bit32.bxor(kTxLJXHS, bpwxEmzY)
        table.insert(ucArlibR, string.char(bit32.bxor(unmasked, wdMfBljd)))
    end
    return table.concat(ucArlibR)
end

local gnzXWvMu_flat = {}
for _, chunk in ipairs(vbEuWCjp) do
    for _, byte in ipairs(chunk) do
        table.insert(gnzXWvMu_flat, byte)
    end
end

local decrypted = VASLjIJT(gnzXWvMu_flat, lDtxcnEP)
local uEYnauNT, RbZczuJr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(gnzXWvMu_flat)
gnzXWvMu_flat = nil

if uEYnauNT then 
    local result = uEYnauNT() 
    decrypted = nil
    uEYnauNT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(RbZczuJr)) 
end
