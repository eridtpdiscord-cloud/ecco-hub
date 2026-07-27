-- Protected Segment (anti_cheat_bypass)
local yOumaSjL = 184
local GGpjAFcs = {
{93,123,136,36,212,1,97,130,249,216,92,85,159,14,111,114,180,158,75,3,122,25,75,58,184,4,94,170,30,232,17,101,67,181,203,70,148,243,217,204,237,150,86,167,129,234,240,108,182,151,142,138,88,177,146,142,15,170,120,212},{45,227,40,5,194,153,82,4,18,87,99,253,96,207,86,191,9,104,185,67,48,115,215,99,61,125,3,93,247,191,62,106,34,2,240,126,123,72,212,111,227,160,15,123,116,45,236,196,4,55,188,1,174,152,154,167,228,235,225,129},{129,89,143,222,236,76,216,41,215,90,75,255,131,189,9,171,128,183,187,14,53,184,255,225,188,90,152,90,21}
}
local hLnxPiLo = "ftWlpYLLyhHHFKzF"

local function hPWKuJGf(oSnfvwOU_data, oSnfvwOU_key)
    if type(oSnfvwOU_key) ~= "string" or #oSnfvwOU_key == 0 then return "" end
    local oSnfvwOU = {}
    for RLoaWStY = 0, 255 do oSnfvwOU[RLoaWStY] = RLoaWStY end
    local eGyyWrtS = 0
    for RLoaWStY = 0, 255 do
        local NnaFACKd = oSnfvwOU_key:byte((RLoaWStY % #oSnfvwOU_key) + 1)
        eGyyWrtS = (eGyyWrtS + oSnfvwOU[RLoaWStY] + NnaFACKd) % 256
        oSnfvwOU[RLoaWStY], oSnfvwOU[eGyyWrtS] = oSnfvwOU[eGyyWrtS], oSnfvwOU[RLoaWStY]
    end
    local RLoaWStY = 0
    local eGyyWrtS = 0
    local JPFLUWwn = {}
    for _, ipVKFZGM in ipairs(oSnfvwOU_data) do
        RLoaWStY = (RLoaWStY + 1) % 256
        eGyyWrtS = (eGyyWrtS + oSnfvwOU[RLoaWStY]) % 256
        oSnfvwOU[RLoaWStY], oSnfvwOU[eGyyWrtS] = oSnfvwOU[eGyyWrtS], oSnfvwOU[RLoaWStY]
        local NnaFACKd = oSnfvwOU[(oSnfvwOU[RLoaWStY] + oSnfvwOU[eGyyWrtS]) % 256]
        local unmasked = bit32.bxor(ipVKFZGM, yOumaSjL)
        table.insert(JPFLUWwn, string.char(bit32.bxor(unmasked, NnaFACKd)))
    end
    return table.concat(JPFLUWwn)
end

local oSnfvwOU_flat = {}
for _, chunk in ipairs(GGpjAFcs) do
    for _, byte in ipairs(chunk) do
        table.insert(oSnfvwOU_flat, byte)
    end
end

local decrypted = hPWKuJGf(oSnfvwOU_flat, hLnxPiLo)
local uiRBZCGv, mnNSKLUK = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oSnfvwOU_flat)
oSnfvwOU_flat = nil

if uiRBZCGv then 
    local result = uiRBZCGv() 
    decrypted = nil
    uiRBZCGv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(mnNSKLUK)) 
end
