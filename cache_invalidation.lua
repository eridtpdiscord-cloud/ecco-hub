-- Compiled secure segment
local DQyVDNob = {
{46,3,151,199,20,109,158,195,241,16,226,4,133,99,66,250,108,196,149,2,16,47,42,27,134,191,139,236,208,49,177,150,162,187,89,186,79,132,86,101,244,200,199,198,53,76,129,12,210,198,139,236,147,167,128,83,141,204,30,194},{146,116,188,28,69,82,157,141,27,46,107,62,43,241,244,148,232,68,121,124,144,67,231,23,226,33,71,85,230,226,32,159,33,49,62,70,1,48,32,23,7,217,147,253,230,193,13,150,141,77,241,114,40,41,19,156,27,156,185,71},{240,191,69,9,171,52,105,193,47,86,104,242,249,121,42,124,20,179,23,190,14,165,136,107,252,241,12,231,197,169}
}
local IMkWDuzN = "RwYqmvCMrmVHRhTA"

local function hhQRLSbp(zMfCRaqw_data, zMfCRaqw_key)
    local zMfCRaqw = {}
    for EfEFVriF = 0, 255 do zMfCRaqw[EfEFVriF] = EfEFVriF end
    local mMiPXGBu = 0
    for EfEFVriF = 0, 255 do
        local wOfaLcJN = zMfCRaqw_key:byte((EfEFVriF % #zMfCRaqw_key) + 1)
        mMiPXGBu = (mMiPXGBu + zMfCRaqw[EfEFVriF] + wOfaLcJN) % 256
        zMfCRaqw[EfEFVriF], zMfCRaqw[mMiPXGBu] = zMfCRaqw[mMiPXGBu], zMfCRaqw[EfEFVriF]
    end
    local EfEFVriF = 0
    local mMiPXGBu = 0
    local SwVrTSYS = {}
    for _, jRWsKIvq in ipairs(zMfCRaqw_data) do
        EfEFVriF = (EfEFVriF + 1) % 256
        mMiPXGBu = (mMiPXGBu + zMfCRaqw[EfEFVriF]) % 256
        zMfCRaqw[EfEFVriF], zMfCRaqw[mMiPXGBu] = zMfCRaqw[mMiPXGBu], zMfCRaqw[EfEFVriF]
        local wOfaLcJN = zMfCRaqw[(zMfCRaqw[EfEFVriF] + zMfCRaqw[mMiPXGBu]) % 256]
        table.insert(SwVrTSYS, string.char(bit32.bxor(jRWsKIvq, wOfaLcJN)))
    end
    return table.concat(SwVrTSYS)
end

local zMfCRaqw_flat = {}
for _, chunk in ipairs(DQyVDNob) do
    for _, byte in ipairs(chunk) do
        table.insert(zMfCRaqw_flat, byte)
    end
end

local decrypted = hhQRLSbp(zMfCRaqw_flat, IMkWDuzN)
local vLFacnDK, LijYAYUA = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(zMfCRaqw_flat)
zMfCRaqw_flat = nil

if vLFacnDK then 
    local result = vLFacnDK() 
    decrypted = nil
    vLFacnDK = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(LijYAYUA)) 
end
