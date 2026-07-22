-- Protected Segment (math_vector_utils)
local zYsnjiZu = 172
local zrsPPBxf = {
{12,99,246,236,150,244,64,175,202,164,138,252,22,240,111,104,166,237,119,153,139,79,133,33,104,159,75,230,26,22,124,239,251,31,202,54,205,53,110,199,19,1,170,149,230,186,72,91,104,200,233,83,194,126,237,181,112,5,48,237},{184,116,121,250,252,211,42,216,114,216,48,239,109,44,181,133,22,169,131,18,1,215,101,79,132,60,97,204,2,175,178,191,45,56,134,142,107,117,192,84,51,182,23,15,154,115,205,254,164,182,183,21,220,11,244,89,200,89,120,96},{65,145,178,98,18,83,42,37,189,134,42,230,122,25,244,5,88,216,154,203,104,168,125,141,228,252,4,189,22}
}
local TEcNgZHx = "EhscHFCmnOoznwDo"

local function PyCyEQFp(MixWBirT_data, MixWBirT_key)
    local MixWBirT = {}
    for swMnaqGn = 0, 255 do MixWBirT[swMnaqGn] = swMnaqGn end
    local VdHshUkc = 0
    for swMnaqGn = 0, 255 do
        local sHsymxOf = MixWBirT_key:byte((swMnaqGn % #MixWBirT_key) + 1)
        VdHshUkc = (VdHshUkc + MixWBirT[swMnaqGn] + sHsymxOf) % 256
        MixWBirT[swMnaqGn], MixWBirT[VdHshUkc] = MixWBirT[VdHshUkc], MixWBirT[swMnaqGn]
    end
    local swMnaqGn = 0
    local VdHshUkc = 0
    local wiSMqAVG = {}
    for _, bnJToCuz in ipairs(MixWBirT_data) do
        swMnaqGn = (swMnaqGn + 1) % 256
        VdHshUkc = (VdHshUkc + MixWBirT[swMnaqGn]) % 256
        MixWBirT[swMnaqGn], MixWBirT[VdHshUkc] = MixWBirT[VdHshUkc], MixWBirT[swMnaqGn]
        local sHsymxOf = MixWBirT[(MixWBirT[swMnaqGn] + MixWBirT[VdHshUkc]) % 256]
        local unmasked = bit32.bxor(bnJToCuz, zYsnjiZu)
        table.insert(wiSMqAVG, string.char(bit32.bxor(unmasked, sHsymxOf)))
    end
    return table.concat(wiSMqAVG)
end

local MixWBirT_flat = {}
for _, chunk in ipairs(zrsPPBxf) do
    for _, byte in ipairs(chunk) do
        table.insert(MixWBirT_flat, byte)
    end
end

local decrypted = PyCyEQFp(MixWBirT_flat, TEcNgZHx)
local UHmphMxB, pxoQgeCz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MixWBirT_flat)
MixWBirT_flat = nil

if UHmphMxB then 
    local result = UHmphMxB() 
    decrypted = nil
    UHmphMxB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(pxoQgeCz)) 
end
