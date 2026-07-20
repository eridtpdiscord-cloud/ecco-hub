-- Compiled secure segment
local LxzTVTSb = {
{44,58,84,253,103,110,196,196,50,224,238,250,246,206,129,94,5,144,224,160,177,39,222,57,2,103,75,32,158,118,40,216,234,22,62,189,212,200,239,239,182,85,244,1,236,191,134,42,2,188,54,207,251,87,173,44,2,108,45,147},{38,223,9,35,9,183,53,78,4,115,213,108,81,65,164,192,73,87,154,77,57,237,165,48,50,244,140,178,34,81,196,130,128,27,216,191,250,165,147,79,91,159,154,228,205,45,119,172,109,115,203,167,246,229,100,143,17,1,210,168},{96,125,199,144,246,27,209,23,248,168,219,244,77,109,216,189,196,181,193,233,140,54,60,150,221,51,49,183,12,73}
}
local GZccHjQi = "GowJhzMIgSHXFhjA"

local function fmgOPwxm(CnSnLDSW_data, CnSnLDSW_key)
    local CnSnLDSW = {}
    for lxNmlFLh = 0, 255 do CnSnLDSW[lxNmlFLh] = lxNmlFLh end
    local VgtFiZEM = 0
    for lxNmlFLh = 0, 255 do
        local SDNeMUOi = CnSnLDSW_key:byte((lxNmlFLh % #CnSnLDSW_key) + 1)
        VgtFiZEM = (VgtFiZEM + CnSnLDSW[lxNmlFLh] + SDNeMUOi) % 256
        CnSnLDSW[lxNmlFLh], CnSnLDSW[VgtFiZEM] = CnSnLDSW[VgtFiZEM], CnSnLDSW[lxNmlFLh]
    end
    local lxNmlFLh = 0
    local VgtFiZEM = 0
    local tudPjJEB = {}
    for _, oPLrWAKK in ipairs(CnSnLDSW_data) do
        lxNmlFLh = (lxNmlFLh + 1) % 256
        VgtFiZEM = (VgtFiZEM + CnSnLDSW[lxNmlFLh]) % 256
        CnSnLDSW[lxNmlFLh], CnSnLDSW[VgtFiZEM] = CnSnLDSW[VgtFiZEM], CnSnLDSW[lxNmlFLh]
        local SDNeMUOi = CnSnLDSW[(CnSnLDSW[lxNmlFLh] + CnSnLDSW[VgtFiZEM]) % 256]
        table.insert(tudPjJEB, string.char(bit32.bxor(oPLrWAKK, SDNeMUOi)))
    end
    return table.concat(tudPjJEB)
end

local CnSnLDSW_flat = {}
for _, chunk in ipairs(LxzTVTSb) do
    for _, byte in ipairs(chunk) do
        table.insert(CnSnLDSW_flat, byte)
    end
end

local decrypted = fmgOPwxm(CnSnLDSW_flat, GZccHjQi)
local ODlbKLdZ, zHMkIJCz = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(CnSnLDSW_flat)
CnSnLDSW_flat = nil

if ODlbKLdZ then 
    local result = ODlbKLdZ() 
    decrypted = nil
    ODlbKLdZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(zHMkIJCz)) 
end
