-- Protected Segment (db)
local eriAbMzU = 239
local xYosjZQD = {
{79,183,21,214,198,7,104,103,9,53,103,108,152,125,247,142,187,236,93,199,36,108,106,5,214,81,102,160,80,195,192,0,198,203,152,20,168,252,139,243,144,154,63,123,156,178,172,47,133,35,172,66,152,67,251,249,175,204,115,159},{109,58,4,87,171,67,211,206,85,83,134,78,229,77,249,119,86,212,91,71,67,135,203,153,217,70,21,250,165,254,43,160,159,74,183,74,87,234,111,33,120,194,72,51,39,25,91,242,100,233,198,56,239,9,113,13,107,106,220,36},{121,222,171,65,253,213,39,234,28,195,199,91,254,104,79,91,134,32,16,235,59,239,176,232,187,187,218,183,230,241,14,228,222,15,252,177,208,55,69,212,143,164,70,142,48,116,191,211,60,194,52,55,155,185,196,126,221,96,141,196},{94,222,69,170,183,188,132,146,160,25,18,78,113,238,102,13,97,32,48,80,80,169,64,204,70,43,133,66,23,160,120,7,126,93,160,59,27,189,25,136,46,177,5,201,209,15,175,163,135,148,69,81,20,217,83,94,149,221,68,80},{167,96,169,23,55,170,115,236,107,69,117,20,176,8,70,126,19,139,108,181,231,225,182,101,181,106,52,20,232,109,245,156,243,88,134,104,81,72,247,104,244,47,76,129,202,194,51,6,217,192,184,130,211,231,142,185,243,226,61,124},{198,73,174,184,117,64,11,188,203,137,202,57,206,208,129,6,123,183,84,225,89,146,178,119,24,29,196,29,56,111,98,76,108,105,87,55,253,247,52,198,56,48,171,121,70,93,216,153,196,190,88,242,75,8,114,117,76,135,250,73},{201,81,126,67,238,60,167,220,92,76,99,181,73,48,101,10,25,93,98,252,12,133,4,51,39,69,234,88,181,224,154,170,12,103,34,159,110,72,93,170,139,49,238,159,113,76,149,220,8,108,248,89,140,197,11,178,184,74,26,167},{187,215,83,83,26,250,34,15,160,131,145,181,204,93,194,246,63,54,128,1,224,110,36,251,186,224,180,171,79,254,126,49,157,190,21,251,174,219,150,167,115,175,14,90,245,97,186,3,227,42,79,7,212,243,213,94,95,51,187,55},{151,163,113,79,126}
}
local cXevLhvV = "vxJQtVftJKgWxWYE"

local function xyQvFrLr(FCrWZGOu_data, FCrWZGOu_key)
    if type(FCrWZGOu_key) ~= "string" or #FCrWZGOu_key == 0 then return "" end
    local FCrWZGOu = {}
    for iyrgTEMo = 0, 255 do FCrWZGOu[iyrgTEMo] = iyrgTEMo end
    local KZITrgsl = 0
    for iyrgTEMo = 0, 255 do
        local tVQMrwgf = FCrWZGOu_key:byte((iyrgTEMo % #FCrWZGOu_key) + 1)
        KZITrgsl = (KZITrgsl + FCrWZGOu[iyrgTEMo] + tVQMrwgf) % 256
        FCrWZGOu[iyrgTEMo], FCrWZGOu[KZITrgsl] = FCrWZGOu[KZITrgsl], FCrWZGOu[iyrgTEMo]
    end
    local iyrgTEMo = 0
    local KZITrgsl = 0
    local owSwCMtk = {}
    for _, iGOGgEyI in ipairs(FCrWZGOu_data) do
        iyrgTEMo = (iyrgTEMo + 1) % 256
        KZITrgsl = (KZITrgsl + FCrWZGOu[iyrgTEMo]) % 256
        FCrWZGOu[iyrgTEMo], FCrWZGOu[KZITrgsl] = FCrWZGOu[KZITrgsl], FCrWZGOu[iyrgTEMo]
        local tVQMrwgf = FCrWZGOu[(FCrWZGOu[iyrgTEMo] + FCrWZGOu[KZITrgsl]) % 256]
        local unmasked = bit32.bxor(iGOGgEyI, eriAbMzU)
        table.insert(owSwCMtk, string.char(bit32.bxor(unmasked, tVQMrwgf)))
    end
    return table.concat(owSwCMtk)
end

local FCrWZGOu_flat = {}
for _, chunk in ipairs(xYosjZQD) do
    for _, byte in ipairs(chunk) do
        table.insert(FCrWZGOu_flat, byte)
    end
end

local decrypted = xyQvFrLr(FCrWZGOu_flat, cXevLhvV)
local xxdGsHIl, SIVnfuXt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FCrWZGOu_flat)
FCrWZGOu_flat = nil

if xxdGsHIl then 
    local result = xxdGsHIl() 
    decrypted = nil
    xxdGsHIl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(SIVnfuXt)) 
end
