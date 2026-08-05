-- Protected Segment (network_optimizer)
local hKrtLsvN = 27
local GwHnQldi = {
{101,238,207,159,189,186,196,239,20,214,169,187,160,131,226,100,209,225,107,228,234,169,187,225,27,107,158,129,191,217,173,176,191,15,51,244,27,150,194,31,95,213,243,183,91,143,233,18,114,57,130,168,249,68,237,67,181,103,239,233},{162,122,2,2,26,8,177,207,170,220,210,47,207,7,139,114,132,251,177,208,190,149,234,141,169,143,105,155,195,131,215,221,252,96,240,91,86,195,31,52,176,212,74,230,214,112,11,233,104,127,94,158,243,138,143,164,208,121,80,221},{52,188,237,164,18,151,182,54,175,37,151,74,154,167,159,171,69,66,78,77,12,102,97,195,16,52,34,243,201}
}
local YmMKLRgZ = "OZALCOIJzMgUgQbb"

local function VfzpdrgR(SKBLRPXF_data, SKBLRPXF_key)
    if type(SKBLRPXF_key) ~= "string" or #SKBLRPXF_key == 0 then return "" end
    local SKBLRPXF = {}
    for tDTHDgtt = 0, 255 do SKBLRPXF[tDTHDgtt] = tDTHDgtt end
    local epbdMZNH = 0
    for tDTHDgtt = 0, 255 do
        local dlfUuKZm = SKBLRPXF_key:byte((tDTHDgtt % #SKBLRPXF_key) + 1)
        epbdMZNH = (epbdMZNH + SKBLRPXF[tDTHDgtt] + dlfUuKZm) % 256
        SKBLRPXF[tDTHDgtt], SKBLRPXF[epbdMZNH] = SKBLRPXF[epbdMZNH], SKBLRPXF[tDTHDgtt]
    end
    local tDTHDgtt = 0
    local epbdMZNH = 0
    local PtjFgews = {}
    for _, PZsENgAx in ipairs(SKBLRPXF_data) do
        tDTHDgtt = (tDTHDgtt + 1) % 256
        epbdMZNH = (epbdMZNH + SKBLRPXF[tDTHDgtt]) % 256
        SKBLRPXF[tDTHDgtt], SKBLRPXF[epbdMZNH] = SKBLRPXF[epbdMZNH], SKBLRPXF[tDTHDgtt]
        local dlfUuKZm = SKBLRPXF[(SKBLRPXF[tDTHDgtt] + SKBLRPXF[epbdMZNH]) % 256]
        local unmasked = bit32.bxor(PZsENgAx, hKrtLsvN)
        table.insert(PtjFgews, string.char(bit32.bxor(unmasked, dlfUuKZm)))
    end
    return table.concat(PtjFgews)
end

local SKBLRPXF_flat = {}
for _, chunk in ipairs(GwHnQldi) do
    for _, byte in ipairs(chunk) do
        table.insert(SKBLRPXF_flat, byte)
    end
end

local decrypted = VfzpdrgR(SKBLRPXF_flat, YmMKLRgZ)
local OeuaKTiH, VxIxHzde = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SKBLRPXF_flat)
SKBLRPXF_flat = nil

if OeuaKTiH then 
    local result = OeuaKTiH() 
    decrypted = nil
    OeuaKTiH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(VxIxHzde)) 
end
