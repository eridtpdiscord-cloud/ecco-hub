-- Protected Segment (db)
local RVWIVJIV = 90
local SxZQgjsN = {
{196,174,16,99,212,254,59,84,205,53,166,111,130,139,156,53,65,217,211,78,97,79,121,165,63,245,206,88,109,250,183,62,224,145,103,55,120,86,82,2,63,10,124,110,65,63,80,0,221,147,148,83,86,42,141,14,204,123,195,107},{130,146,105,195,140,211,143,229,80,211,77,192,81,82,90,20,74,0,145,214,55,250,86,146,111,121,90,115,74,69,199,224,119,202,44,240,161,25,196,212,14,82,232,211,14,207,83,243,176,108,234,167,208,36,213,88,25,13,52,81},{115,192,178,46,181,232,52,163,60,251,35,240,105,184,18,77,80,223,158,114,231,62,23,207,217,142,248,254,216,196,116,204,86,188,155,234,44,87,1,252,27,153,131,200,54,228,124,20,169,137,180,41,39,4,158,181,58,117,36,222},{182,19,224,106,218,25,255,115,123,66,118,229,242,135,200,149,163,22,12,122,166,146,188,213,91,129,20,9,125,74,125,172,123,252,208,115,201,220,238,163,14,142,143,127,82,79,39,154,29,151,207,127,85,9,40,35,230,86,24,78},{238,245,70,69,225,132,202,187,14,104,77,70,140,172,155,216,239,200,2,84,234,230,151,109,24,131,117,25,130,234,38,240,3,146,213,194,242,24,196,166,251,94,211,96,225,37,51,188,54,247,183,184,192,94,72,28,235,170,200,247},{210,201,80,66,29,155,63,213,53,129,213,41,19,87,45,20,148,96,133,93,3,144,138,23,205,45,153,243,147,78,234,196,12,40,14,0,201,151,67,137,214,193,144,215,43,245,12,43,196,254,11,131,250,51,167,217,82,250,140,182},{224,35,155,247,216,83,162,89,181,20,21,127,9,208,39,253,105,227,39,115,184,65,153,209,30,170,63,147,31,109,89,86,107,38,193,67,133,33,21,229,89,51,99,149,44,23,167,33}
}
local UTsspZoV = "mPDUMfTxpuSEbNld"

local function dxOEScfg(PQsuFyUA_data, PQsuFyUA_key)
    local PQsuFyUA = {}
    for lMHQhDDn = 0, 255 do PQsuFyUA[lMHQhDDn] = lMHQhDDn end
    local TMgcMTrJ = 0
    for lMHQhDDn = 0, 255 do
        local OUJwjSuX = PQsuFyUA_key:byte((lMHQhDDn % #PQsuFyUA_key) + 1)
        TMgcMTrJ = (TMgcMTrJ + PQsuFyUA[lMHQhDDn] + OUJwjSuX) % 256
        PQsuFyUA[lMHQhDDn], PQsuFyUA[TMgcMTrJ] = PQsuFyUA[TMgcMTrJ], PQsuFyUA[lMHQhDDn]
    end
    local lMHQhDDn = 0
    local TMgcMTrJ = 0
    local iqYEOjCM = {}
    for _, mrOVDAhk in ipairs(PQsuFyUA_data) do
        lMHQhDDn = (lMHQhDDn + 1) % 256
        TMgcMTrJ = (TMgcMTrJ + PQsuFyUA[lMHQhDDn]) % 256
        PQsuFyUA[lMHQhDDn], PQsuFyUA[TMgcMTrJ] = PQsuFyUA[TMgcMTrJ], PQsuFyUA[lMHQhDDn]
        local OUJwjSuX = PQsuFyUA[(PQsuFyUA[lMHQhDDn] + PQsuFyUA[TMgcMTrJ]) % 256]
        local unmasked = bit32.bxor(mrOVDAhk, RVWIVJIV)
        table.insert(iqYEOjCM, string.char(bit32.bxor(unmasked, OUJwjSuX)))
    end
    return table.concat(iqYEOjCM)
end

local PQsuFyUA_flat = {}
for _, chunk in ipairs(SxZQgjsN) do
    for _, byte in ipairs(chunk) do
        table.insert(PQsuFyUA_flat, byte)
    end
end

local decrypted = dxOEScfg(PQsuFyUA_flat, UTsspZoV)
local wriqPjTP, RxzxYwzB = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PQsuFyUA_flat)
PQsuFyUA_flat = nil

if wriqPjTP then 
    local result = wriqPjTP() 
    decrypted = nil
    wriqPjTP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(RxzxYwzB)) 
end
