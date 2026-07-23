-- Protected Segment (math_vector_utils)
local nexfIQZw = 128
local mwxwiAcx = {
{23,162,191,27,224,170,44,19,244,234,218,133,45,106,238,120,57,169,128,226,65,201,30,60,25,38,129,239,206,215,93,121,124,59,222,15,73,126,76,222,84,195,244,53,107,212,227,120,84,28,22,155,21,160,87,235,45,134,24,9},{32,246,175,246,124,70,226,79,33,244,250,54,66,95,97,104,152,67,74,13,67,201,172,143,60,224,245,19,83,128,183,24,197,131,109,57,129,36,184,143,149,76,129,74,154,96,74,63,245,96,47,183,46,187,252,115,29,142,214,228},{57,158,97,142,6,43,131,98,239,184,216,28,155,181,55,97,132,113,166,214,18,34,93,217,59,37,211,59,195}
}
local MGpJdepO = "OwTtBYVDSCjJmDKF"

local function jKRXyjFO(GzGHosGq_data, GzGHosGq_key)
    if type(GzGHosGq_key) ~= "string" or #GzGHosGq_key == 0 then return "" end
    local GzGHosGq = {}
    for xXqtZtGD = 0, 255 do GzGHosGq[xXqtZtGD] = xXqtZtGD end
    local xPPtQbdY = 0
    for xXqtZtGD = 0, 255 do
        local kZhIfpPf = GzGHosGq_key:byte((xXqtZtGD % #GzGHosGq_key) + 1)
        xPPtQbdY = (xPPtQbdY + GzGHosGq[xXqtZtGD] + kZhIfpPf) % 256
        GzGHosGq[xXqtZtGD], GzGHosGq[xPPtQbdY] = GzGHosGq[xPPtQbdY], GzGHosGq[xXqtZtGD]
    end
    local xXqtZtGD = 0
    local xPPtQbdY = 0
    local gnUZBMvK = {}
    for _, pLpOqoXu in ipairs(GzGHosGq_data) do
        xXqtZtGD = (xXqtZtGD + 1) % 256
        xPPtQbdY = (xPPtQbdY + GzGHosGq[xXqtZtGD]) % 256
        GzGHosGq[xXqtZtGD], GzGHosGq[xPPtQbdY] = GzGHosGq[xPPtQbdY], GzGHosGq[xXqtZtGD]
        local kZhIfpPf = GzGHosGq[(GzGHosGq[xXqtZtGD] + GzGHosGq[xPPtQbdY]) % 256]
        local unmasked = bit32.bxor(pLpOqoXu, nexfIQZw)
        table.insert(gnUZBMvK, string.char(bit32.bxor(unmasked, kZhIfpPf)))
    end
    return table.concat(gnUZBMvK)
end

local GzGHosGq_flat = {}
for _, chunk in ipairs(mwxwiAcx) do
    for _, byte in ipairs(chunk) do
        table.insert(GzGHosGq_flat, byte)
    end
end

local decrypted = jKRXyjFO(GzGHosGq_flat, MGpJdepO)
local dmOUJXtU, wHKfSjIY = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GzGHosGq_flat)
GzGHosGq_flat = nil

if dmOUJXtU then 
    local result = dmOUJXtU() 
    decrypted = nil
    dmOUJXtU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(wHKfSjIY)) 
end
