-- Compiled secure segment
local lKBZeDNM = {
{112,118,183,111,44,59,60,11,188,15,98,131,94,34,239,42,22,250,206,237,208,214,15,59,231,229,103,93,54,227,36,14,103,1,103,58,80,128,54,221,173,169,162,211,145,15,26,184,132,113,78,130,63,169,148,250,104,15,204,114},{245,234,47,101,250,52,88,173,0,34,134,204,117,153,77,158,244,80,17,244,156,73,110,229,86,247,184,110,4,144,253,132,52,191,193,182,129,219,98,91,49,206,125,238,202,101,180,156,221,203,250,252,23,220,224,3,62,13,129,54},{222,57,69,188,27,171,47,75,45,145,71,111,220,32,101,160,92,188,122,89,244,141,217,191,245,122,204,198,160,211}
}
local kzUVYMsR = "ybPvoVNggpNvLiEt"

local function GtLnnucD(JmApHOHC_data, JmApHOHC_key)
    local JmApHOHC = {}
    for ArhAZUFI = 0, 255 do JmApHOHC[ArhAZUFI] = ArhAZUFI end
    local FgeIIcPS = 0
    for ArhAZUFI = 0, 255 do
        local HZwDLuOh = JmApHOHC_key:byte((ArhAZUFI % #JmApHOHC_key) + 1)
        FgeIIcPS = (FgeIIcPS + JmApHOHC[ArhAZUFI] + HZwDLuOh) % 256
        JmApHOHC[ArhAZUFI], JmApHOHC[FgeIIcPS] = JmApHOHC[FgeIIcPS], JmApHOHC[ArhAZUFI]
    end
    local ArhAZUFI = 0
    local FgeIIcPS = 0
    local unhUnKSJ = {}
    for _, gkXklsFs in ipairs(JmApHOHC_data) do
        ArhAZUFI = (ArhAZUFI + 1) % 256
        FgeIIcPS = (FgeIIcPS + JmApHOHC[ArhAZUFI]) % 256
        JmApHOHC[ArhAZUFI], JmApHOHC[FgeIIcPS] = JmApHOHC[FgeIIcPS], JmApHOHC[ArhAZUFI]
        local HZwDLuOh = JmApHOHC[(JmApHOHC[ArhAZUFI] + JmApHOHC[FgeIIcPS]) % 256]
        table.insert(unhUnKSJ, string.char(bit32.bxor(gkXklsFs, HZwDLuOh)))
    end
    return table.concat(unhUnKSJ)
end

local JmApHOHC_flat = {}
for _, chunk in ipairs(lKBZeDNM) do
    for _, byte in ipairs(chunk) do
        table.insert(JmApHOHC_flat, byte)
    end
end

local decrypted = GtLnnucD(JmApHOHC_flat, kzUVYMsR)
local jKvKVUtF, KwYynpiC = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(JmApHOHC_flat)
JmApHOHC_flat = nil

if jKvKVUtF then 
    local result = jKvKVUtF() 
    decrypted = nil
    jKvKVUtF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(KwYynpiC)) 
end
