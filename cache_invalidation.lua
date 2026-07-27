-- Protected Segment (cache_invalidation)
local xcJGqVIH = 9
local aFzImoWe = {
{134,88,239,230,47,204,240,216,16,139,74,97,56,48,58,13,160,228,162,225,181,180,46,65,63,235,48,246,107,93,236,214,192,213,198,249,139,7,1,123,199,3,252,221,211,174,115,132,183,205,77,179,201,219,134,80,251,73,92,167},{251,141,54,98,227,83,166,244,59,42,100,228,221,89,46,43,44,41,98,202,58,228,178,41,211,21,54,50,46,193,112,222,255,92,253,129,59,131,101,90,18,33,56,130,223,22,195,136,134,193,227,81,218,245,178,29,173,106,235,192},{42,73,204,222,203,230,183,55,174,141,3,211,37,163,2,91,152,169,198,249,103,143,211,26,143,7,5,58,223,57}
}
local IATXzEPH = "hgAJmDuIqfZDXdRC"

local function GrKEMffi(BngfCGSP_data, BngfCGSP_key)
    if type(BngfCGSP_key) ~= "string" or #BngfCGSP_key == 0 then return "" end
    local BngfCGSP = {}
    for yMMHTgvH = 0, 255 do BngfCGSP[yMMHTgvH] = yMMHTgvH end
    local rqDwyJom = 0
    for yMMHTgvH = 0, 255 do
        local HmAUbLor = BngfCGSP_key:byte((yMMHTgvH % #BngfCGSP_key) + 1)
        rqDwyJom = (rqDwyJom + BngfCGSP[yMMHTgvH] + HmAUbLor) % 256
        BngfCGSP[yMMHTgvH], BngfCGSP[rqDwyJom] = BngfCGSP[rqDwyJom], BngfCGSP[yMMHTgvH]
    end
    local yMMHTgvH = 0
    local rqDwyJom = 0
    local aUtTckzW = {}
    for _, skpulElJ in ipairs(BngfCGSP_data) do
        yMMHTgvH = (yMMHTgvH + 1) % 256
        rqDwyJom = (rqDwyJom + BngfCGSP[yMMHTgvH]) % 256
        BngfCGSP[yMMHTgvH], BngfCGSP[rqDwyJom] = BngfCGSP[rqDwyJom], BngfCGSP[yMMHTgvH]
        local HmAUbLor = BngfCGSP[(BngfCGSP[yMMHTgvH] + BngfCGSP[rqDwyJom]) % 256]
        local unmasked = bit32.bxor(skpulElJ, xcJGqVIH)
        table.insert(aUtTckzW, string.char(bit32.bxor(unmasked, HmAUbLor)))
    end
    return table.concat(aUtTckzW)
end

local BngfCGSP_flat = {}
for _, chunk in ipairs(aFzImoWe) do
    for _, byte in ipairs(chunk) do
        table.insert(BngfCGSP_flat, byte)
    end
end

local decrypted = GrKEMffi(BngfCGSP_flat, IATXzEPH)
local rMSsRjqL, RbDXmuKz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BngfCGSP_flat)
BngfCGSP_flat = nil

if rMSsRjqL then 
    local result = rMSsRjqL() 
    decrypted = nil
    rMSsRjqL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(RbDXmuKz)) 
end
