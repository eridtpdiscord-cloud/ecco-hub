-- Compiled secure segment
local oycqAGMV = {
{87,82,109,43,210,203,230,219,73,221,165,249,69,120,106,155,40,110,214,91,250,216,12,202,158,243,141,9,8,106,29,15,253,160,226,113,81,243,60,253,249,200,52,2,142,159,6,142,83,151,154,215,149,12,65,15,49,229,241,21},{49,152,123,252,153,3,176,243,192,70,127,122,38,99,229,201,111,121,132,219,163,48,148,111,173,254,114,52,161,7,238,47,77,200,216,103,69,124,139,175,198,98,101,1,139,11,253,87,148,134,20,99,221,85,197,215,54,102,172,75},{58,114,222,190,57,39,82,26,59,139,116,139,6,64,151,140,213,15,8,140,172,12,227,112,18,129,110,76,207}
}
local nSCafGJA = "QKYYaYsgxkHeXcrd"

local function AMBNpmDO(TNAjAlaO_data, TNAjAlaO_key)
    local TNAjAlaO = {}
    for zErsWyrz = 0, 255 do TNAjAlaO[zErsWyrz] = zErsWyrz end
    local fPYZAaKQ = 0
    for zErsWyrz = 0, 255 do
        local pGgVUtlb = TNAjAlaO_key:byte((zErsWyrz % #TNAjAlaO_key) + 1)
        fPYZAaKQ = (fPYZAaKQ + TNAjAlaO[zErsWyrz] + pGgVUtlb) % 256
        TNAjAlaO[zErsWyrz], TNAjAlaO[fPYZAaKQ] = TNAjAlaO[fPYZAaKQ], TNAjAlaO[zErsWyrz]
    end
    local zErsWyrz = 0
    local fPYZAaKQ = 0
    local TMKDVUvH = {}
    for _, SLsYmexT in ipairs(TNAjAlaO_data) do
        zErsWyrz = (zErsWyrz + 1) % 256
        fPYZAaKQ = (fPYZAaKQ + TNAjAlaO[zErsWyrz]) % 256
        TNAjAlaO[zErsWyrz], TNAjAlaO[fPYZAaKQ] = TNAjAlaO[fPYZAaKQ], TNAjAlaO[zErsWyrz]
        local pGgVUtlb = TNAjAlaO[(TNAjAlaO[zErsWyrz] + TNAjAlaO[fPYZAaKQ]) % 256]
        table.insert(TMKDVUvH, string.char(bit32.bxor(SLsYmexT, pGgVUtlb)))
    end
    return table.concat(TMKDVUvH)
end

local TNAjAlaO_flat = {}
for _, chunk in ipairs(oycqAGMV) do
    for _, byte in ipairs(chunk) do
        table.insert(TNAjAlaO_flat, byte)
    end
end

local decrypted = AMBNpmDO(TNAjAlaO_flat, nSCafGJA)
local RAQKelNo, LqczPncT = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(TNAjAlaO_flat)
TNAjAlaO_flat = nil

if RAQKelNo then 
    local result = RAQKelNo() 
    decrypted = nil
    RAQKelNo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(LqczPncT)) 
end
