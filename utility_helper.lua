-- Compiled secure segment
local pOeAqGOk = {
{172,56,250,61,204,125,183,32,43,215,139,35,178,50,61,156,176,19,69,146,16,85,125,10,76,188,76,14,21,13,226,10,245,74,209,216,117,51,198,89,131,74,154,235,180,169,122,50,165,255,101,69,172,65,76,206,179,67,255,103},{149,167,50,86,1,223,216,169,66,57,111,101,10,247,243,132,180,142,211,89,223,135,78,49,130,35,241,72,143,29,244,100,103,26,108,233,172,160,182,44,167,52,80,174,64,43,36,203,94,253,163,30,130,175,104,70,129,171,103,41},{10,161,3,205,225,54,6,227,48,30,134,91,67,106,161,52,112,127,207,91,203,125,103,146,244,111}
}
local YMvnSpNp = "tKMwHPcPJjAllwkv"

local function BaXXeKri(NKvKcVoX_data, NKvKcVoX_key)
    local NKvKcVoX = {}
    for iBxVQhDV = 0, 255 do NKvKcVoX[iBxVQhDV] = iBxVQhDV end
    local yYHhMvKU = 0
    for iBxVQhDV = 0, 255 do
        local kXCTSIyP = NKvKcVoX_key:byte((iBxVQhDV % #NKvKcVoX_key) + 1)
        yYHhMvKU = (yYHhMvKU + NKvKcVoX[iBxVQhDV] + kXCTSIyP) % 256
        NKvKcVoX[iBxVQhDV], NKvKcVoX[yYHhMvKU] = NKvKcVoX[yYHhMvKU], NKvKcVoX[iBxVQhDV]
    end
    local iBxVQhDV = 0
    local yYHhMvKU = 0
    local muhcQsjm = {}
    for _, iUvlmDxm in ipairs(NKvKcVoX_data) do
        iBxVQhDV = (iBxVQhDV + 1) % 256
        yYHhMvKU = (yYHhMvKU + NKvKcVoX[iBxVQhDV]) % 256
        NKvKcVoX[iBxVQhDV], NKvKcVoX[yYHhMvKU] = NKvKcVoX[yYHhMvKU], NKvKcVoX[iBxVQhDV]
        local kXCTSIyP = NKvKcVoX[(NKvKcVoX[iBxVQhDV] + NKvKcVoX[yYHhMvKU]) % 256]
        table.insert(muhcQsjm, string.char(bit32.bxor(iUvlmDxm, kXCTSIyP)))
    end
    return table.concat(muhcQsjm)
end

local NKvKcVoX_flat = {}
for _, chunk in ipairs(pOeAqGOk) do
    for _, byte in ipairs(chunk) do
        table.insert(NKvKcVoX_flat, byte)
    end
end

local decrypted = BaXXeKri(NKvKcVoX_flat, YMvnSpNp)
local fZEbilRb, QVlWVBbD = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(NKvKcVoX_flat)
NKvKcVoX_flat = nil

if fZEbilRb then 
    local result = fZEbilRb() 
    decrypted = nil
    fZEbilRb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(QVlWVBbD)) 
end
