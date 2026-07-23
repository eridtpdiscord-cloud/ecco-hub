-- Protected Segment (math_vector_utils)
local isTjfeNF = 106
local vbpGYwaJ = {
{76,137,195,68,200,69,0,52,103,241,108,119,103,91,14,200,206,72,0,119,226,227,28,201,210,246,98,244,43,239,44,188,55,35,47,158,160,68,253,248,216,20,65,121,112,233,90,175,237,226,119,216,173,167,25,205,212,235,216,204},{0,83,91,101,85,92,117,108,79,98,246,27,255,175,125,195,112,139,148,49,108,214,231,143,46,242,177,6,67,24,231,115,189,240,192,8,154,60,33,238,29,29,30,160,138,48,232,202,2,131,166,189,42,94,147,199,239,139,86,36},{24,214,193,140,105,23,79,65,24,128,193,115,146,187,226,31,122,193,167,181,177,245,84,105,154,101,64,64,83}
}
local LwMCJCuu = "RnxoZwJCoIBhpjCe"

local function IgfmFOKV(EnqLZyEK_data, EnqLZyEK_key)
    if type(EnqLZyEK_key) ~= "string" or #EnqLZyEK_key == 0 then return "" end
    local EnqLZyEK = {}
    for lHHizRRg = 0, 255 do EnqLZyEK[lHHizRRg] = lHHizRRg end
    local iQXbHJnR = 0
    for lHHizRRg = 0, 255 do
        local uEtHsWTU = EnqLZyEK_key:byte((lHHizRRg % #EnqLZyEK_key) + 1)
        iQXbHJnR = (iQXbHJnR + EnqLZyEK[lHHizRRg] + uEtHsWTU) % 256
        EnqLZyEK[lHHizRRg], EnqLZyEK[iQXbHJnR] = EnqLZyEK[iQXbHJnR], EnqLZyEK[lHHizRRg]
    end
    local lHHizRRg = 0
    local iQXbHJnR = 0
    local ANJfYSaj = {}
    for _, wPfNxvQA in ipairs(EnqLZyEK_data) do
        lHHizRRg = (lHHizRRg + 1) % 256
        iQXbHJnR = (iQXbHJnR + EnqLZyEK[lHHizRRg]) % 256
        EnqLZyEK[lHHizRRg], EnqLZyEK[iQXbHJnR] = EnqLZyEK[iQXbHJnR], EnqLZyEK[lHHizRRg]
        local uEtHsWTU = EnqLZyEK[(EnqLZyEK[lHHizRRg] + EnqLZyEK[iQXbHJnR]) % 256]
        local unmasked = bit32.bxor(wPfNxvQA, isTjfeNF)
        table.insert(ANJfYSaj, string.char(bit32.bxor(unmasked, uEtHsWTU)))
    end
    return table.concat(ANJfYSaj)
end

local EnqLZyEK_flat = {}
for _, chunk in ipairs(vbpGYwaJ) do
    for _, byte in ipairs(chunk) do
        table.insert(EnqLZyEK_flat, byte)
    end
end

local decrypted = IgfmFOKV(EnqLZyEK_flat, LwMCJCuu)
local ekwxpEku, puolCjpa = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EnqLZyEK_flat)
EnqLZyEK_flat = nil

if ekwxpEku then 
    local result = ekwxpEku() 
    decrypted = nil
    ekwxpEku = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(puolCjpa)) 
end
