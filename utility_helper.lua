-- Protected Segment (utility_helper)
local xwDIidiJ = 86
local EZeyHjhB = {
{53,245,146,148,254,136,218,1,82,248,162,251,22,149,222,244,54,28,169,213,239,244,206,28,137,93,11,138,167,100,90,184,227,216,102,133,37,179,133,175,129,48,60,103,161,246,93,184,56,33,96,24,11,148,255,198,11,174,192,201},{146,172,237,186,172,32,185,79,124,163,250,243,22,208,214,63,207,213,240,197,187,9,114,224,155,125,193,153,2,139,171,253,124,90,237,62,98,104,21,34,109,177,214,98,113,5,88,58,20,150,72,191,43,251,29,223,211,193,239,158},{39,86,67,149,224,24,238,20,95,150,87,45,75,218,152,188,19,155,188,73,238,165,55,151,134,39}
}
local bNBeSLFP = "QVzOVchxwMFimFSf"

local function AbAgCKnt(sLWNobWW_data, sLWNobWW_key)
    if type(sLWNobWW_key) ~= "string" or #sLWNobWW_key == 0 then return "" end
    local sLWNobWW = {}
    for smnxKEEc = 0, 255 do sLWNobWW[smnxKEEc] = smnxKEEc end
    local bElGaVUA = 0
    for smnxKEEc = 0, 255 do
        local dBtdEzfM = sLWNobWW_key:byte((smnxKEEc % #sLWNobWW_key) + 1)
        bElGaVUA = (bElGaVUA + sLWNobWW[smnxKEEc] + dBtdEzfM) % 256
        sLWNobWW[smnxKEEc], sLWNobWW[bElGaVUA] = sLWNobWW[bElGaVUA], sLWNobWW[smnxKEEc]
    end
    local smnxKEEc = 0
    local bElGaVUA = 0
    local UmCbVeQW = {}
    for _, ndnozNku in ipairs(sLWNobWW_data) do
        smnxKEEc = (smnxKEEc + 1) % 256
        bElGaVUA = (bElGaVUA + sLWNobWW[smnxKEEc]) % 256
        sLWNobWW[smnxKEEc], sLWNobWW[bElGaVUA] = sLWNobWW[bElGaVUA], sLWNobWW[smnxKEEc]
        local dBtdEzfM = sLWNobWW[(sLWNobWW[smnxKEEc] + sLWNobWW[bElGaVUA]) % 256]
        local unmasked = bit32.bxor(ndnozNku, xwDIidiJ)
        table.insert(UmCbVeQW, string.char(bit32.bxor(unmasked, dBtdEzfM)))
    end
    return table.concat(UmCbVeQW)
end

local sLWNobWW_flat = {}
for _, chunk in ipairs(EZeyHjhB) do
    for _, byte in ipairs(chunk) do
        table.insert(sLWNobWW_flat, byte)
    end
end

local decrypted = AbAgCKnt(sLWNobWW_flat, bNBeSLFP)
local XvZsaBvI, ejeegEhk = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(sLWNobWW_flat)
sLWNobWW_flat = nil

if XvZsaBvI then 
    local result = XvZsaBvI() 
    decrypted = nil
    XvZsaBvI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(ejeegEhk)) 
end
