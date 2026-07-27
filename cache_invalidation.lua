-- Protected Segment (cache_invalidation)
local GdGYxWme = 194
local JvbjjBXU = {
{109,54,29,119,184,32,4,79,201,31,224,168,250,239,114,36,113,203,131,245,230,120,163,59,48,96,220,142,161,148,56,95,249,15,10,204,18,173,108,76,232,251,240,226,116,218,195,80,208,105,20,65,24,50,65,214,212,124,201,46},{180,111,87,86,73,47,166,63,36,74,40,47,199,107,225,28,44,125,121,233,140,210,185,218,78,233,59,107,86,199,143,71,158,122,88,99,45,202,52,232,218,137,11,140,207,181,65,21,211,64,95,94,168,96,5,230,93,173,180,69},{52,186,163,113,246,124,220,185,147,43,218,4,190,98,224,184,131,215,234,144,185,179,161,203,137,132,131,86,190,136}
}
local QdmLXAeu = "LxnYfxZsjuwNKqUX"

local function wtxwBZhR(ljFNOBsn_data, ljFNOBsn_key)
    if type(ljFNOBsn_key) ~= "string" or #ljFNOBsn_key == 0 then return "" end
    local ljFNOBsn = {}
    for wzdtGIUT = 0, 255 do ljFNOBsn[wzdtGIUT] = wzdtGIUT end
    local DXArOxFt = 0
    for wzdtGIUT = 0, 255 do
        local hgZsJNMC = ljFNOBsn_key:byte((wzdtGIUT % #ljFNOBsn_key) + 1)
        DXArOxFt = (DXArOxFt + ljFNOBsn[wzdtGIUT] + hgZsJNMC) % 256
        ljFNOBsn[wzdtGIUT], ljFNOBsn[DXArOxFt] = ljFNOBsn[DXArOxFt], ljFNOBsn[wzdtGIUT]
    end
    local wzdtGIUT = 0
    local DXArOxFt = 0
    local AgpCEJzZ = {}
    for _, EXRcyaha in ipairs(ljFNOBsn_data) do
        wzdtGIUT = (wzdtGIUT + 1) % 256
        DXArOxFt = (DXArOxFt + ljFNOBsn[wzdtGIUT]) % 256
        ljFNOBsn[wzdtGIUT], ljFNOBsn[DXArOxFt] = ljFNOBsn[DXArOxFt], ljFNOBsn[wzdtGIUT]
        local hgZsJNMC = ljFNOBsn[(ljFNOBsn[wzdtGIUT] + ljFNOBsn[DXArOxFt]) % 256]
        local unmasked = bit32.bxor(EXRcyaha, GdGYxWme)
        table.insert(AgpCEJzZ, string.char(bit32.bxor(unmasked, hgZsJNMC)))
    end
    return table.concat(AgpCEJzZ)
end

local ljFNOBsn_flat = {}
for _, chunk in ipairs(JvbjjBXU) do
    for _, byte in ipairs(chunk) do
        table.insert(ljFNOBsn_flat, byte)
    end
end

local decrypted = wtxwBZhR(ljFNOBsn_flat, QdmLXAeu)
local JzqbEBrr, QOQnaDta = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ljFNOBsn_flat)
ljFNOBsn_flat = nil

if JzqbEBrr then 
    local result = JzqbEBrr() 
    decrypted = nil
    JzqbEBrr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(QOQnaDta)) 
end
