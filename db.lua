-- Protected Segment (db)
local bipCpQpB = 27
local pAyoLnsn = {
{83,208,30,4,100,2,161,92,30,184,4,111,132,172,241,191,24,184,89,246,173,98,8,176,106,9,137,235,71,84,169,216,37,15,221,84,222,173,172,86,160,194,148,43,224,77,235,154,192,177,56,20,127,171,62,28,214,217,27,13},{75,115,122,127,191,220,75,130,50,66,140,39,225,19,146,116,215,65,238,219,240,248,119,237,167,210,145,162,204,205,47,13,162,112,163,15,111,19,234,244,4,45,225,92,17,251,235,184,179,125,55,120,131,182,185,31,9,76,101,10},{107,219,160,215,173,137,144,223,128,24,220,145,103,158,225,85,201,65,116,187,35,164,137,223,146,227,215,24,121,83,148,29,162,117,14,117,102,108,228,26,29,112,87,169,127,63,102,5,158,243,183,238,32,114,90,18,174,3,75,170},{85,190,51,64,102,142,41,123,198,60,181,228,169,48,89,154,135,86,254,59,98,24,225,80,42,112,50,75,104,195,81,105,89,35,128,167,119,187,58,119,33,239,193,128,3,11,161,119,18,35,51,39,219,200,166,1,25,246,244,29},{195,111,14,173,99,96,4,206,188,244,69,74,140,130,237,81,61,29,9,251,51,3,101,128,60,114,144,93,211,91,8,190,186,119,36,239,61,192,92,208,144,240,235,23,177,65,26,12,27,134,139,218,70,179,163,108,13,179,96,161},{244,164,195,53,93,0,221,157,185,10,162,23,19,182,135,89,22,16,93,206,110,254,190,74,119,192,94,72,165,207,147,167,117,51,254,59,19,21,70,109,237,187,28,6,71,112,175,87,14,200,116,77,172,67,250,117,119,204,9,4},{97,115,70,33,25,42,32,229,105,54,158,74,150,52,52,127,249,132,101,35,139,241,178,84,237,85,164,213,70,235,197,68,86,211,10,195,13,249,177,212,14,121,56,61,155,24,232,49,191,240,221,62,32,98,136,245,164,241,141,41},{155,92,140,83,46,170,118,247,40,211,112,51,50,8,114,201,191,191,26,156,26,31,10,134,227,116,133,251,196,54,102,128,19,58,121,234,85,217,54,36,250,121,143,16,3,182,241,137,157,25,245,225,249,239,48,19,240,36,122}
}
local pGcLjVpg = "gMfFbPJAmatFHYgf"

local function CkgNcywt(LvdUhvTC_data, LvdUhvTC_key)
    if type(LvdUhvTC_key) ~= "string" or #LvdUhvTC_key == 0 then return "" end
    local LvdUhvTC = {}
    for iNUFkGWK = 0, 255 do LvdUhvTC[iNUFkGWK] = iNUFkGWK end
    local rlNPtkOK = 0
    for iNUFkGWK = 0, 255 do
        local yDNvMYKU = LvdUhvTC_key:byte((iNUFkGWK % #LvdUhvTC_key) + 1)
        rlNPtkOK = (rlNPtkOK + LvdUhvTC[iNUFkGWK] + yDNvMYKU) % 256
        LvdUhvTC[iNUFkGWK], LvdUhvTC[rlNPtkOK] = LvdUhvTC[rlNPtkOK], LvdUhvTC[iNUFkGWK]
    end
    local iNUFkGWK = 0
    local rlNPtkOK = 0
    local ZxEbHYpj = {}
    for _, AHtHknBn in ipairs(LvdUhvTC_data) do
        iNUFkGWK = (iNUFkGWK + 1) % 256
        rlNPtkOK = (rlNPtkOK + LvdUhvTC[iNUFkGWK]) % 256
        LvdUhvTC[iNUFkGWK], LvdUhvTC[rlNPtkOK] = LvdUhvTC[rlNPtkOK], LvdUhvTC[iNUFkGWK]
        local yDNvMYKU = LvdUhvTC[(LvdUhvTC[iNUFkGWK] + LvdUhvTC[rlNPtkOK]) % 256]
        local unmasked = bit32.bxor(AHtHknBn, bipCpQpB)
        table.insert(ZxEbHYpj, string.char(bit32.bxor(unmasked, yDNvMYKU)))
    end
    return table.concat(ZxEbHYpj)
end

local LvdUhvTC_flat = {}
for _, chunk in ipairs(pAyoLnsn) do
    for _, byte in ipairs(chunk) do
        table.insert(LvdUhvTC_flat, byte)
    end
end

local decrypted = CkgNcywt(LvdUhvTC_flat, pGcLjVpg)
local OaRwsLfU, vqxQTADf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(LvdUhvTC_flat)
LvdUhvTC_flat = nil

if OaRwsLfU then 
    local result = OaRwsLfU() 
    decrypted = nil
    OaRwsLfU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(vqxQTADf)) 
end
