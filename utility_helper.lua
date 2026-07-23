-- Protected Segment (utility_helper)
local UejPaddI = 167
local ZyjLMiEi = {
{62,211,18,104,135,36,200,198,250,151,28,208,251,249,98,104,207,164,76,187,161,99,166,145,146,88,23,10,75,31,192,235,130,187,214,18,249,52,49,243,172,7,161,120,210,121,240,15,73,43,97,205,160,37,221,84,49,30,180,217},{34,120,236,77,239,13,230,173,200,164,22,46,35,160,117,135,166,18,28,160,75,115,64,197,38,149,7,157,150,18,155,145,119,155,136,126,178,111,136,45,108,214,33,24,1,90,227,152,88,162,245,64,213,161,97,144,191,167,12,167},{33,2,216,255,224,239,142,235,252,226,117,219,221,229,93,146,114,254,35,51,110,203,50,246,140,56}
}
local iqQRRiIK = "jOUNCunTrqdACmfA"

local function yqZpLlPp(RTORJJwX_data, RTORJJwX_key)
    if type(RTORJJwX_key) ~= "string" or #RTORJJwX_key == 0 then return "" end
    local RTORJJwX = {}
    for ENOKKsVi = 0, 255 do RTORJJwX[ENOKKsVi] = ENOKKsVi end
    local bWpHPdSg = 0
    for ENOKKsVi = 0, 255 do
        local eScqFycJ = RTORJJwX_key:byte((ENOKKsVi % #RTORJJwX_key) + 1)
        bWpHPdSg = (bWpHPdSg + RTORJJwX[ENOKKsVi] + eScqFycJ) % 256
        RTORJJwX[ENOKKsVi], RTORJJwX[bWpHPdSg] = RTORJJwX[bWpHPdSg], RTORJJwX[ENOKKsVi]
    end
    local ENOKKsVi = 0
    local bWpHPdSg = 0
    local SrZBEVox = {}
    for _, pVhnkskv in ipairs(RTORJJwX_data) do
        ENOKKsVi = (ENOKKsVi + 1) % 256
        bWpHPdSg = (bWpHPdSg + RTORJJwX[ENOKKsVi]) % 256
        RTORJJwX[ENOKKsVi], RTORJJwX[bWpHPdSg] = RTORJJwX[bWpHPdSg], RTORJJwX[ENOKKsVi]
        local eScqFycJ = RTORJJwX[(RTORJJwX[ENOKKsVi] + RTORJJwX[bWpHPdSg]) % 256]
        local unmasked = bit32.bxor(pVhnkskv, UejPaddI)
        table.insert(SrZBEVox, string.char(bit32.bxor(unmasked, eScqFycJ)))
    end
    return table.concat(SrZBEVox)
end

local RTORJJwX_flat = {}
for _, chunk in ipairs(ZyjLMiEi) do
    for _, byte in ipairs(chunk) do
        table.insert(RTORJJwX_flat, byte)
    end
end

local decrypted = yqZpLlPp(RTORJJwX_flat, iqQRRiIK)
local fupPdVaM, SxNDZIcJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RTORJJwX_flat)
RTORJJwX_flat = nil

if fupPdVaM then 
    local result = fupPdVaM() 
    decrypted = nil
    fupPdVaM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(SxNDZIcJ)) 
end
