-- Protected Segment (math_vector_utils)
local juQCblwg = 84
local awvpHCbo = {
{170,30,187,113,26,56,179,113,87,105,214,22,176,74,12,139,113,230,166,165,222,113,96,192,219,143,122,252,37,214,6,116,158,33,30,60,133,197,203,137,169,153,153,21,67,243,3,29,162,119,140,247,221,191,158,43,152,71,226,139},{3,19,148,226,251,174,150,181,33,80,188,245,159,180,156,192,96,200,239,105,231,248,74,218,13,173,207,29,20,60,239,158,65,146,235,166,27,85,177,209,147,11,111,19,164,248,147,8,55,209,169,251,166,168,173,24,106,77,81,68},{22,95,22,151,84,107,209,29,91,37,120,206,231,84,209,195,84,148,149,131,187,51,95,39,255,154,145,104,126}
}
local eBcynfvF = "BZkhjoXZoSeZZYGI"

local function dxQBSuts(fsLIvaaC_data, fsLIvaaC_key)
    if type(fsLIvaaC_key) ~= "string" or #fsLIvaaC_key == 0 then return "" end
    local fsLIvaaC = {}
    for NQDBJiJC = 0, 255 do fsLIvaaC[NQDBJiJC] = NQDBJiJC end
    local YQKCItVl = 0
    for NQDBJiJC = 0, 255 do
        local XleTbbOy = fsLIvaaC_key:byte((NQDBJiJC % #fsLIvaaC_key) + 1)
        YQKCItVl = (YQKCItVl + fsLIvaaC[NQDBJiJC] + XleTbbOy) % 256
        fsLIvaaC[NQDBJiJC], fsLIvaaC[YQKCItVl] = fsLIvaaC[YQKCItVl], fsLIvaaC[NQDBJiJC]
    end
    local NQDBJiJC = 0
    local YQKCItVl = 0
    local rDteQmca = {}
    for _, zmvtOkgq in ipairs(fsLIvaaC_data) do
        NQDBJiJC = (NQDBJiJC + 1) % 256
        YQKCItVl = (YQKCItVl + fsLIvaaC[NQDBJiJC]) % 256
        fsLIvaaC[NQDBJiJC], fsLIvaaC[YQKCItVl] = fsLIvaaC[YQKCItVl], fsLIvaaC[NQDBJiJC]
        local XleTbbOy = fsLIvaaC[(fsLIvaaC[NQDBJiJC] + fsLIvaaC[YQKCItVl]) % 256]
        local unmasked = bit32.bxor(zmvtOkgq, juQCblwg)
        table.insert(rDteQmca, string.char(bit32.bxor(unmasked, XleTbbOy)))
    end
    return table.concat(rDteQmca)
end

local fsLIvaaC_flat = {}
for _, chunk in ipairs(awvpHCbo) do
    for _, byte in ipairs(chunk) do
        table.insert(fsLIvaaC_flat, byte)
    end
end

local decrypted = dxQBSuts(fsLIvaaC_flat, eBcynfvF)
local rauFIvpr, qHxRlbKm = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fsLIvaaC_flat)
fsLIvaaC_flat = nil

if rauFIvpr then 
    local result = rauFIvpr() 
    decrypted = nil
    rauFIvpr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(qHxRlbKm)) 
end
