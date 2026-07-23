-- Protected Segment (tween_library)
local gpCVNfbT = 146
local NeRGcvVP = {
{17,182,27,85,71,114,40,68,198,144,24,67,124,127,125,93,49,176,31,91,4,160,78,184,133,178,202,130,77,86,218,246,57,64,181,243,203,105,23,223,192,103,218,90,140,245,140,155,177,242,138,138,216,231,83,43,207,186,217,44},{81,2,130,176,242,103,208,161,254,0,197,8,49,115,231,153,72,174,20,21,168,53,180,74,160,10,174,81,3,254,190,210,180,22,67,70,49,12,156,76,78,124,209,75,171,237,51,70,41,85,167,157,187,187,52,57,34,5,96,38},{245,158,86,52,254,190,37,84,9,36,183,38,60,6,238,214,130,183,163,64,157,123,135,236,21}
}
local EIMjXJPL = "lYlSjlsgCNOudXis"

local function tilvaVZk(mlIJGmxo_data, mlIJGmxo_key)
    if type(mlIJGmxo_key) ~= "string" or #mlIJGmxo_key == 0 then return "" end
    local mlIJGmxo = {}
    for APfSAltS = 0, 255 do mlIJGmxo[APfSAltS] = APfSAltS end
    local LWzMknSr = 0
    for APfSAltS = 0, 255 do
        local cbqdAZgv = mlIJGmxo_key:byte((APfSAltS % #mlIJGmxo_key) + 1)
        LWzMknSr = (LWzMknSr + mlIJGmxo[APfSAltS] + cbqdAZgv) % 256
        mlIJGmxo[APfSAltS], mlIJGmxo[LWzMknSr] = mlIJGmxo[LWzMknSr], mlIJGmxo[APfSAltS]
    end
    local APfSAltS = 0
    local LWzMknSr = 0
    local ebwCLVpt = {}
    for _, ykZcfbpD in ipairs(mlIJGmxo_data) do
        APfSAltS = (APfSAltS + 1) % 256
        LWzMknSr = (LWzMknSr + mlIJGmxo[APfSAltS]) % 256
        mlIJGmxo[APfSAltS], mlIJGmxo[LWzMknSr] = mlIJGmxo[LWzMknSr], mlIJGmxo[APfSAltS]
        local cbqdAZgv = mlIJGmxo[(mlIJGmxo[APfSAltS] + mlIJGmxo[LWzMknSr]) % 256]
        local unmasked = bit32.bxor(ykZcfbpD, gpCVNfbT)
        table.insert(ebwCLVpt, string.char(bit32.bxor(unmasked, cbqdAZgv)))
    end
    return table.concat(ebwCLVpt)
end

local mlIJGmxo_flat = {}
for _, chunk in ipairs(NeRGcvVP) do
    for _, byte in ipairs(chunk) do
        table.insert(mlIJGmxo_flat, byte)
    end
end

local decrypted = tilvaVZk(mlIJGmxo_flat, EIMjXJPL)
local aQHaKVkZ, DrgoyyFk = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mlIJGmxo_flat)
mlIJGmxo_flat = nil

if aQHaKVkZ then 
    local result = aQHaKVkZ() 
    decrypted = nil
    aQHaKVkZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(DrgoyyFk)) 
end
