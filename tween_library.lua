-- Protected Segment (tween_library)
local sipglQLo = 213
local wbBiarkA = {
{120,74,21,232,91,108,56,161,241,210,188,107,112,104,12,52,52,1,85,137,255,27,84,104,77,143,88,223,62,127,90,81,154,91,79,223,228,160,157,155,237,52,191,253,222,97,41,229,231,110,55,80,36,137,234,199,239,66,70,214},{62,189,38,149,152,164,124,213,41,157,41,173,227,52,81,13,183,126,233,77,149,80,220,84,177,200,178,227,92,16,144,180,63,142,240,243,114,36,110,34,139,229,241,153,73,203,228,239,8,28,202,34,12,56,133,126,243,99,167,89},{189,9,43,61,6,10,211,19,230,58,87,128,37,95,56,188,230,224,43,180,55,38,219,22,239}
}
local XvozawTc = "mbgIDUNZZAZIPJem"

local function jMoEbjuj(dKCzRQCh_data, dKCzRQCh_key)
    local dKCzRQCh = {}
    for ZyvawHyy = 0, 255 do dKCzRQCh[ZyvawHyy] = ZyvawHyy end
    local TzPjFKVZ = 0
    for ZyvawHyy = 0, 255 do
        local lCGLonRy = dKCzRQCh_key:byte((ZyvawHyy % #dKCzRQCh_key) + 1)
        TzPjFKVZ = (TzPjFKVZ + dKCzRQCh[ZyvawHyy] + lCGLonRy) % 256
        dKCzRQCh[ZyvawHyy], dKCzRQCh[TzPjFKVZ] = dKCzRQCh[TzPjFKVZ], dKCzRQCh[ZyvawHyy]
    end
    local ZyvawHyy = 0
    local TzPjFKVZ = 0
    local PQBTmqtj = {}
    for _, bMlAWqkw in ipairs(dKCzRQCh_data) do
        ZyvawHyy = (ZyvawHyy + 1) % 256
        TzPjFKVZ = (TzPjFKVZ + dKCzRQCh[ZyvawHyy]) % 256
        dKCzRQCh[ZyvawHyy], dKCzRQCh[TzPjFKVZ] = dKCzRQCh[TzPjFKVZ], dKCzRQCh[ZyvawHyy]
        local lCGLonRy = dKCzRQCh[(dKCzRQCh[ZyvawHyy] + dKCzRQCh[TzPjFKVZ]) % 256]
        local unmasked = bit32.bxor(bMlAWqkw, sipglQLo)
        table.insert(PQBTmqtj, string.char(bit32.bxor(unmasked, lCGLonRy)))
    end
    return table.concat(PQBTmqtj)
end

local dKCzRQCh_flat = {}
for _, chunk in ipairs(wbBiarkA) do
    for _, byte in ipairs(chunk) do
        table.insert(dKCzRQCh_flat, byte)
    end
end

local decrypted = jMoEbjuj(dKCzRQCh_flat, XvozawTc)
local jeHmIFpY, SUppQgJI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dKCzRQCh_flat)
dKCzRQCh_flat = nil

if jeHmIFpY then 
    local result = jeHmIFpY() 
    decrypted = nil
    jeHmIFpY = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(SUppQgJI)) 
end
