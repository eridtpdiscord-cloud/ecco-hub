-- Compiled secure segment
local xKfgWUMZ = {
{231,245,206,247,27,157,16,202,231,137,116,137,51,89,255,40,57,12,230,151,245,62,217,229,122,38,182,252,100,247,201,54,150,82,228,55,107,156,44,156,230,7,84,215,123,114,119,134,141,238,117,20,69,127,227,176,43,43,106,77},{162,183,97,99,152,53,75,241,181,83,183,145,21,199,151,5,122,116,19,181,238,79,141,148,120,40,96,239,27,83,2,216,114,219,39,130,5,150,208,247,145,110,143,126,202,109,62,161,97,86,91,64,104,34,155,13,111,247,79,125},{86,148,186,162,94,61,12,62,64,55,115,149,162,100,31,92,62,76,109,55,3,25,67,130,124,212}
}
local iNTtUiUO = "VDxXroTAEEBZLKPO"

local function zEDQgcPd(nzFinCkI_data, nzFinCkI_key)
    local nzFinCkI = {}
    for DaxlpOQI = 0, 255 do nzFinCkI[DaxlpOQI] = DaxlpOQI end
    local qqkNceWE = 0
    for DaxlpOQI = 0, 255 do
        local UglgUMsD = nzFinCkI_key:byte((DaxlpOQI % #nzFinCkI_key) + 1)
        qqkNceWE = (qqkNceWE + nzFinCkI[DaxlpOQI] + UglgUMsD) % 256
        nzFinCkI[DaxlpOQI], nzFinCkI[qqkNceWE] = nzFinCkI[qqkNceWE], nzFinCkI[DaxlpOQI]
    end
    local DaxlpOQI = 0
    local qqkNceWE = 0
    local avsliHKX = {}
    for _, LfJaUzIK in ipairs(nzFinCkI_data) do
        DaxlpOQI = (DaxlpOQI + 1) % 256
        qqkNceWE = (qqkNceWE + nzFinCkI[DaxlpOQI]) % 256
        nzFinCkI[DaxlpOQI], nzFinCkI[qqkNceWE] = nzFinCkI[qqkNceWE], nzFinCkI[DaxlpOQI]
        local UglgUMsD = nzFinCkI[(nzFinCkI[DaxlpOQI] + nzFinCkI[qqkNceWE]) % 256]
        table.insert(avsliHKX, string.char(bit32.bxor(LfJaUzIK, UglgUMsD)))
    end
    return table.concat(avsliHKX)
end

local nzFinCkI_flat = {}
for _, chunk in ipairs(xKfgWUMZ) do
    for _, byte in ipairs(chunk) do
        table.insert(nzFinCkI_flat, byte)
    end
end

local decrypted = zEDQgcPd(nzFinCkI_flat, iNTtUiUO)
local sAOIuhfy, SHBBQHnF = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(nzFinCkI_flat)
nzFinCkI_flat = nil

if sAOIuhfy then 
    local result = sAOIuhfy() 
    decrypted = nil
    sAOIuhfy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(SHBBQHnF)) 
end
