-- Protected Segment (cache_invalidation)
local qeohDYeb = 129
local hgBoQYAn = {
{126,241,122,193,4,168,242,19,107,34,114,220,245,25,45,104,31,72,118,2,86,132,219,165,209,6,135,163,181,41,115,73,82,209,25,211,191,92,75,169,155,12,62,185,109,32,165,238,225,55,209,74,246,191,116,248,109,1,189,212},{236,158,124,236,90,109,129,39,110,215,107,226,231,75,210,48,99,2,144,31,77,218,100,38,35,143,225,111,58,125,31,72,234,12,58,51,57,164,206,232,96,240,120,221,76,40,120,22,80,58,253,212,62,190,129,112,33,118,19,253},{20,130,108,170,250,119,162,28,32,19,191,46,12,76,193,20,195,56,219,144,197,98,105,253,163,61,158,166,202,118}
}
local wwHOiTqe = "fJikSPwZDLzAOWZU"

local function YYicdsKs(sGgoZMMg_data, sGgoZMMg_key)
    local sGgoZMMg = {}
    for rrrFvZbj = 0, 255 do sGgoZMMg[rrrFvZbj] = rrrFvZbj end
    local ZembGjcW = 0
    for rrrFvZbj = 0, 255 do
        local lfJTCqAS = sGgoZMMg_key:byte((rrrFvZbj % #sGgoZMMg_key) + 1)
        ZembGjcW = (ZembGjcW + sGgoZMMg[rrrFvZbj] + lfJTCqAS) % 256
        sGgoZMMg[rrrFvZbj], sGgoZMMg[ZembGjcW] = sGgoZMMg[ZembGjcW], sGgoZMMg[rrrFvZbj]
    end
    local rrrFvZbj = 0
    local ZembGjcW = 0
    local HtFpAdYL = {}
    for _, EamsUOYz in ipairs(sGgoZMMg_data) do
        rrrFvZbj = (rrrFvZbj + 1) % 256
        ZembGjcW = (ZembGjcW + sGgoZMMg[rrrFvZbj]) % 256
        sGgoZMMg[rrrFvZbj], sGgoZMMg[ZembGjcW] = sGgoZMMg[ZembGjcW], sGgoZMMg[rrrFvZbj]
        local lfJTCqAS = sGgoZMMg[(sGgoZMMg[rrrFvZbj] + sGgoZMMg[ZembGjcW]) % 256]
        local unmasked = bit32.bxor(EamsUOYz, qeohDYeb)
        table.insert(HtFpAdYL, string.char(bit32.bxor(unmasked, lfJTCqAS)))
    end
    return table.concat(HtFpAdYL)
end

local sGgoZMMg_flat = {}
for _, chunk in ipairs(hgBoQYAn) do
    for _, byte in ipairs(chunk) do
        table.insert(sGgoZMMg_flat, byte)
    end
end

local decrypted = YYicdsKs(sGgoZMMg_flat, wwHOiTqe)
local UnoCMyGt, OScTQGsP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(sGgoZMMg_flat)
sGgoZMMg_flat = nil

if UnoCMyGt then 
    local result = UnoCMyGt() 
    decrypted = nil
    UnoCMyGt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(OScTQGsP)) 
end
