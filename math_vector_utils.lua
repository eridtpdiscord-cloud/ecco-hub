-- Protected Segment (math_vector_utils)
local HfrMfDur = 113
local cVaVamlj = {
{157,120,175,210,75,1,89,82,224,89,161,43,38,4,173,112,201,146,174,148,75,132,13,80,149,213,193,154,165,248,114,176,8,131,217,69,49,140,125,100,229,181,78,80,71,181,224,186,151,42,143,150,87,155,243,194,99,255,75,212},{184,101,67,40,148,55,83,197,39,81,220,99,171,57,17,226,94,29,74,91,189,175,209,187,98,181,107,68,240,201,18,234,175,101,24,177,109,13,37,110,238,226,186,219,68,209,224,163,58,247,178,255,85,178,161,13,177,15,191,35},{90,10,116,115,9,202,207,132,251,157,251,10,191,228,148,118,19,93,254,247,71,68,13,33,5,93,104,27,208}
}
local jooWsWTA = "RbaVImbCOiwPouLc"

local function tvlOdKPa(oxDSojUz_data, oxDSojUz_key)
    if type(oxDSojUz_key) ~= "string" or #oxDSojUz_key == 0 then return "" end
    local oxDSojUz = {}
    for iCXoFtaM = 0, 255 do oxDSojUz[iCXoFtaM] = iCXoFtaM end
    local zMaryUlm = 0
    for iCXoFtaM = 0, 255 do
        local VEasrbWV = oxDSojUz_key:byte((iCXoFtaM % #oxDSojUz_key) + 1)
        zMaryUlm = (zMaryUlm + oxDSojUz[iCXoFtaM] + VEasrbWV) % 256
        oxDSojUz[iCXoFtaM], oxDSojUz[zMaryUlm] = oxDSojUz[zMaryUlm], oxDSojUz[iCXoFtaM]
    end
    local iCXoFtaM = 0
    local zMaryUlm = 0
    local LdizEJkP = {}
    for _, csJHQvGI in ipairs(oxDSojUz_data) do
        iCXoFtaM = (iCXoFtaM + 1) % 256
        zMaryUlm = (zMaryUlm + oxDSojUz[iCXoFtaM]) % 256
        oxDSojUz[iCXoFtaM], oxDSojUz[zMaryUlm] = oxDSojUz[zMaryUlm], oxDSojUz[iCXoFtaM]
        local VEasrbWV = oxDSojUz[(oxDSojUz[iCXoFtaM] + oxDSojUz[zMaryUlm]) % 256]
        local unmasked = bit32.bxor(csJHQvGI, HfrMfDur)
        table.insert(LdizEJkP, string.char(bit32.bxor(unmasked, VEasrbWV)))
    end
    return table.concat(LdizEJkP)
end

local oxDSojUz_flat = {}
for _, chunk in ipairs(cVaVamlj) do
    for _, byte in ipairs(chunk) do
        table.insert(oxDSojUz_flat, byte)
    end
end

local decrypted = tvlOdKPa(oxDSojUz_flat, jooWsWTA)
local qNMUFrxX, hBvZsZQe = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(oxDSojUz_flat)
oxDSojUz_flat = nil

if qNMUFrxX then 
    local result = qNMUFrxX() 
    decrypted = nil
    qNMUFrxX = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(hBvZsZQe)) 
end
