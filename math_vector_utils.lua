-- Protected Segment (math_vector_utils)
local eCtBXSkf = 80
local oPhbwLbZ = {
{152,108,186,127,180,135,61,104,231,219,113,199,141,52,8,16,118,16,35,5,163,42,80,37,95,237,232,195,142,224,161,30,120,179,100,21,78,248,160,98,168,181,117,174,104,229,231,197,53,205,100,167,83,56,235,19,239,43,100,21},{11,115,141,174,7,149,174,47,170,160,74,208,78,30,25,199,132,56,231,148,3,119,167,159,197,228,133,31,16,148,110,134,12,67,165,1,176,184,169,234,185,232,172,150,4,246,34,148,193,19,224,88,22,67,90,55,204,99,95,127},{248,35,23,189,122,88,72,221,239,137,205,188,165,80,106,10,224,108,238,237,255,27,96,129,35,0,60,235,125}
}
local qkSiSsAt = "yYYYXgzzJjZESPPi"

local function VJvsWKFo(TPXTXtRY_data, TPXTXtRY_key)
    if type(TPXTXtRY_key) ~= "string" or #TPXTXtRY_key == 0 then return "" end
    local TPXTXtRY = {}
    for wbMjjQhX = 0, 255 do TPXTXtRY[wbMjjQhX] = wbMjjQhX end
    local unyIMwbh = 0
    for wbMjjQhX = 0, 255 do
        local yGBXiULm = TPXTXtRY_key:byte((wbMjjQhX % #TPXTXtRY_key) + 1)
        unyIMwbh = (unyIMwbh + TPXTXtRY[wbMjjQhX] + yGBXiULm) % 256
        TPXTXtRY[wbMjjQhX], TPXTXtRY[unyIMwbh] = TPXTXtRY[unyIMwbh], TPXTXtRY[wbMjjQhX]
    end
    local wbMjjQhX = 0
    local unyIMwbh = 0
    local AqPQGmID = {}
    for _, RVhHNGCQ in ipairs(TPXTXtRY_data) do
        wbMjjQhX = (wbMjjQhX + 1) % 256
        unyIMwbh = (unyIMwbh + TPXTXtRY[wbMjjQhX]) % 256
        TPXTXtRY[wbMjjQhX], TPXTXtRY[unyIMwbh] = TPXTXtRY[unyIMwbh], TPXTXtRY[wbMjjQhX]
        local yGBXiULm = TPXTXtRY[(TPXTXtRY[wbMjjQhX] + TPXTXtRY[unyIMwbh]) % 256]
        local unmasked = bit32.bxor(RVhHNGCQ, eCtBXSkf)
        table.insert(AqPQGmID, string.char(bit32.bxor(unmasked, yGBXiULm)))
    end
    return table.concat(AqPQGmID)
end

local TPXTXtRY_flat = {}
for _, chunk in ipairs(oPhbwLbZ) do
    for _, byte in ipairs(chunk) do
        table.insert(TPXTXtRY_flat, byte)
    end
end

local decrypted = VJvsWKFo(TPXTXtRY_flat, qkSiSsAt)
local wZvFsnqp, mtStRtMu = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(TPXTXtRY_flat)
TPXTXtRY_flat = nil

if wZvFsnqp then 
    local result = wZvFsnqp() 
    decrypted = nil
    wZvFsnqp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(mtStRtMu)) 
end
