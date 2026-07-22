-- Protected Segment (cache_invalidation)
local tHOJWVzu = 24
local sGrnhZYj = {
{113,75,129,123,18,92,248,151,110,225,196,208,196,52,252,148,202,202,120,29,200,169,130,217,222,246,145,165,253,46,105,30,38,59,13,49,170,15,188,221,48,145,207,155,13,111,148,36,63,0,174,243,106,167,167,66,122,22,166,79},{17,245,155,218,135,163,232,113,246,160,196,174,6,125,134,142,177,205,134,227,131,170,164,198,101,157,233,89,177,117,117,201,209,219,161,237,137,46,105,5,222,16,42,112,216,52,82,159,219,81,210,174,24,197,196,231,80,55,162,51},{240,101,251,149,204,145,134,139,196,78,127,139,180,128,122,170,112,150,92,67,122,99,32,11,15,97,254,250,152,254}
}
local ZPvJpEuO = "nCKAZnRgfXixlyXI"

local function CAmpgPcV(iGhMOeTU_data, iGhMOeTU_key)
    local iGhMOeTU = {}
    for SnLaWTZn = 0, 255 do iGhMOeTU[SnLaWTZn] = SnLaWTZn end
    local ZGudLMQD = 0
    for SnLaWTZn = 0, 255 do
        local ENqDHVdP = iGhMOeTU_key:byte((SnLaWTZn % #iGhMOeTU_key) + 1)
        ZGudLMQD = (ZGudLMQD + iGhMOeTU[SnLaWTZn] + ENqDHVdP) % 256
        iGhMOeTU[SnLaWTZn], iGhMOeTU[ZGudLMQD] = iGhMOeTU[ZGudLMQD], iGhMOeTU[SnLaWTZn]
    end
    local SnLaWTZn = 0
    local ZGudLMQD = 0
    local HrccTGtD = {}
    for _, dBBTLNie in ipairs(iGhMOeTU_data) do
        SnLaWTZn = (SnLaWTZn + 1) % 256
        ZGudLMQD = (ZGudLMQD + iGhMOeTU[SnLaWTZn]) % 256
        iGhMOeTU[SnLaWTZn], iGhMOeTU[ZGudLMQD] = iGhMOeTU[ZGudLMQD], iGhMOeTU[SnLaWTZn]
        local ENqDHVdP = iGhMOeTU[(iGhMOeTU[SnLaWTZn] + iGhMOeTU[ZGudLMQD]) % 256]
        local unmasked = bit32.bxor(dBBTLNie, tHOJWVzu)
        table.insert(HrccTGtD, string.char(bit32.bxor(unmasked, ENqDHVdP)))
    end
    return table.concat(HrccTGtD)
end

local iGhMOeTU_flat = {}
for _, chunk in ipairs(sGrnhZYj) do
    for _, byte in ipairs(chunk) do
        table.insert(iGhMOeTU_flat, byte)
    end
end

local decrypted = CAmpgPcV(iGhMOeTU_flat, ZPvJpEuO)
local alGwmOQd, zYpILZqU = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(iGhMOeTU_flat)
iGhMOeTU_flat = nil

if alGwmOQd then 
    local result = alGwmOQd() 
    decrypted = nil
    alGwmOQd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(zYpILZqU)) 
end
