-- Protected Segment (math_vector_utils)
local wtWNMjRB = 9
local hXoSUREj = {
{159,98,254,117,1,40,122,8,73,129,119,29,91,24,104,227,100,253,62,50,249,23,165,190,145,32,86,235,170,190,195,159,8,92,163,97,13,111,249,13,124,157,35,19,32,190,144,167,102,51,244,132,215,176,108,64,126,33,118,37},{172,200,31,126,125,169,113,77,183,26,99,146,236,220,156,241,218,52,162,75,182,70,214,27,233,153,246,42,240,87,117,52,241,104,160,40,173,176,179,102,38,39,69,231,71,72,171,72,47,109,49,128,85,98,208,180,67,48,209,212},{6,48,146,90,71,144,103,93,218,227,236,216,205,147,86,126,73,46,215,198,209,248,124,113,214,209,0,83,177}
}
local KnvAEmrc = "pSZIhwcQokopfTnh"

local function FeCKmDZU(dtCfrukA_data, dtCfrukA_key)
    if type(dtCfrukA_key) ~= "string" or #dtCfrukA_key == 0 then return "" end
    local dtCfrukA = {}
    for iRpHVgCb = 0, 255 do dtCfrukA[iRpHVgCb] = iRpHVgCb end
    local UdFFFesW = 0
    for iRpHVgCb = 0, 255 do
        local FgvAnkRP = dtCfrukA_key:byte((iRpHVgCb % #dtCfrukA_key) + 1)
        UdFFFesW = (UdFFFesW + dtCfrukA[iRpHVgCb] + FgvAnkRP) % 256
        dtCfrukA[iRpHVgCb], dtCfrukA[UdFFFesW] = dtCfrukA[UdFFFesW], dtCfrukA[iRpHVgCb]
    end
    local iRpHVgCb = 0
    local UdFFFesW = 0
    local BgvDGtON = {}
    for _, CoEyYvvE in ipairs(dtCfrukA_data) do
        iRpHVgCb = (iRpHVgCb + 1) % 256
        UdFFFesW = (UdFFFesW + dtCfrukA[iRpHVgCb]) % 256
        dtCfrukA[iRpHVgCb], dtCfrukA[UdFFFesW] = dtCfrukA[UdFFFesW], dtCfrukA[iRpHVgCb]
        local FgvAnkRP = dtCfrukA[(dtCfrukA[iRpHVgCb] + dtCfrukA[UdFFFesW]) % 256]
        local unmasked = bit32.bxor(CoEyYvvE, wtWNMjRB)
        table.insert(BgvDGtON, string.char(bit32.bxor(unmasked, FgvAnkRP)))
    end
    return table.concat(BgvDGtON)
end

local dtCfrukA_flat = {}
for _, chunk in ipairs(hXoSUREj) do
    for _, byte in ipairs(chunk) do
        table.insert(dtCfrukA_flat, byte)
    end
end

local decrypted = FeCKmDZU(dtCfrukA_flat, KnvAEmrc)
local YnjSfoDo, DwuXfkzF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dtCfrukA_flat)
dtCfrukA_flat = nil

if YnjSfoDo then 
    local result = YnjSfoDo() 
    decrypted = nil
    YnjSfoDo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(DwuXfkzF)) 
end
