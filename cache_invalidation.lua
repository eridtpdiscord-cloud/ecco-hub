-- Protected Segment (cache_invalidation)
local eEsliuXj = 163
local SFsaLcqm = {
{204,228,126,218,254,73,240,93,163,181,47,90,4,192,160,10,173,99,19,115,51,8,4,74,84,51,152,228,44,178,203,222,109,114,60,83,116,164,44,236,251,105,187,186,66,75,131,141,48,7,237,106,74,110,53,177,103,245,51,113},{190,100,35,51,113,48,123,151,23,127,63,35,223,237,114,219,89,23,58,221,155,159,207,124,157,152,190,196,36,42,189,227,171,226,255,206,198,221,45,141,229,190,217,86,94,188,134,166,12,182,37,230,11,254,68,209,9,250,12,217},{89,111,243,230,31,228,155,214,97,2,246,203,33,132,21,173,126,45,91,200,113,23,83,244,136,2,147,184,141,240}
}
local qZimRfmA = "HrmJygILMrAGTkMA"

local function WCtjtcNc(WbfEbaAv_data, WbfEbaAv_key)
    if type(WbfEbaAv_key) ~= "string" or #WbfEbaAv_key == 0 then return "" end
    local WbfEbaAv = {}
    for qyMFegEY = 0, 255 do WbfEbaAv[qyMFegEY] = qyMFegEY end
    local rBSEdDRn = 0
    for qyMFegEY = 0, 255 do
        local OGxqhtnc = WbfEbaAv_key:byte((qyMFegEY % #WbfEbaAv_key) + 1)
        rBSEdDRn = (rBSEdDRn + WbfEbaAv[qyMFegEY] + OGxqhtnc) % 256
        WbfEbaAv[qyMFegEY], WbfEbaAv[rBSEdDRn] = WbfEbaAv[rBSEdDRn], WbfEbaAv[qyMFegEY]
    end
    local qyMFegEY = 0
    local rBSEdDRn = 0
    local XiRfSach = {}
    for _, OCyTfUDf in ipairs(WbfEbaAv_data) do
        qyMFegEY = (qyMFegEY + 1) % 256
        rBSEdDRn = (rBSEdDRn + WbfEbaAv[qyMFegEY]) % 256
        WbfEbaAv[qyMFegEY], WbfEbaAv[rBSEdDRn] = WbfEbaAv[rBSEdDRn], WbfEbaAv[qyMFegEY]
        local OGxqhtnc = WbfEbaAv[(WbfEbaAv[qyMFegEY] + WbfEbaAv[rBSEdDRn]) % 256]
        local unmasked = bit32.bxor(OCyTfUDf, eEsliuXj)
        table.insert(XiRfSach, string.char(bit32.bxor(unmasked, OGxqhtnc)))
    end
    return table.concat(XiRfSach)
end

local WbfEbaAv_flat = {}
for _, chunk in ipairs(SFsaLcqm) do
    for _, byte in ipairs(chunk) do
        table.insert(WbfEbaAv_flat, byte)
    end
end

local decrypted = WCtjtcNc(WbfEbaAv_flat, qZimRfmA)
local SjvBcPTC, UNqVuevv = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(WbfEbaAv_flat)
WbfEbaAv_flat = nil

if SjvBcPTC then 
    local result = SjvBcPTC() 
    decrypted = nil
    SjvBcPTC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(UNqVuevv)) 
end
