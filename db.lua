-- Compiled secure segment
local xWfYXtXx = {
{24,65,5,198,127,132,115,19,42,207,141,72,100,21,206,250,230,243,131,249,30,132,248,225,127,235,2,231,146,235,133,247,171,18,133,162,236,38,62,204,24,170,209,74,70,220,41,209,12,145,187,191,202,75,150,59,151,88,150,233},{143,150,212,76,80,12,229,106,110,248,74,79,81,254,142,227,230,143,222,93,3,233,140,45,22,55,141,23,125,244,16,10,180,96,217,84,211,90,250,179,91,231,131,118,226,92,78,250,248,208,44,96,60,251,110,136,247,101,111,124},{92,107,14,97,122,223,82,17,50,171,241,198,74,173,104,191,150,17,131,56,55,64,234,66,105,153,143,223,235,20,7,163,233,75,231,129,214,180,235,69,89,79,101,106,93,186,137,87,160,28,208,168,81,198,78,213,235,7,73,89},{71,71,23,6,153,167,56,38,125,66,159,207,99,202,40,48,14,131,238,106,35,55,185,239,182,150,160,133,57,198,178,229,241,88,24,226,90,189,76,138,96,198,215,187,213,183,144,173,48,97,142,26,12,203,116,183,149,163,111,18},{182,193,241,37,139,151,178,32,244,26,68,195,215,142,106,228,202,179,34,51,67,139,169,224,166,6,165,241,97,61,176,31,1,239,119,13,60,51,211,86,135,58,83,192,194,249,221,118,67,249,50,233,161,216,66,158,171,40,45,96},{94,241,165,251,182,27,87,119,6,27,10,106,185,136,23,120,201,224,212,216,140,2,170,154,227,69,225,142,188,67,189,241,44,244,41,71,184,233,71,220,209,84,60,134,45,26,58,185,31,198,180,35,11,151,51,1,58,85,123,232},{79,97,89,94,109,134,26,240,188,91,105,244,130,183,43,215,175,206,132,3,177,155,72,33,44,255,155,140,6,102,11,253,110,213,185,120,206,26,7,61,79,162,182}
}
local DStlrLyj = "yIPlPXOSFdtcXZZJ"

local function OZVPoKxI(GeehrKvs_data, GeehrKvs_key)
    local GeehrKvs = {}
    for bNfCZpDY = 0, 255 do GeehrKvs[bNfCZpDY] = bNfCZpDY end
    local DvpNoGmo = 0
    for bNfCZpDY = 0, 255 do
        local LuFTzjaT = GeehrKvs_key:byte((bNfCZpDY % #GeehrKvs_key) + 1)
        DvpNoGmo = (DvpNoGmo + GeehrKvs[bNfCZpDY] + LuFTzjaT) % 256
        GeehrKvs[bNfCZpDY], GeehrKvs[DvpNoGmo] = GeehrKvs[DvpNoGmo], GeehrKvs[bNfCZpDY]
    end
    local bNfCZpDY = 0
    local DvpNoGmo = 0
    local oXYyuoqg = {}
    for _, FuEJgRFt in ipairs(GeehrKvs_data) do
        bNfCZpDY = (bNfCZpDY + 1) % 256
        DvpNoGmo = (DvpNoGmo + GeehrKvs[bNfCZpDY]) % 256
        GeehrKvs[bNfCZpDY], GeehrKvs[DvpNoGmo] = GeehrKvs[DvpNoGmo], GeehrKvs[bNfCZpDY]
        local LuFTzjaT = GeehrKvs[(GeehrKvs[bNfCZpDY] + GeehrKvs[DvpNoGmo]) % 256]
        table.insert(oXYyuoqg, string.char(bit32.bxor(FuEJgRFt, LuFTzjaT)))
    end
    return table.concat(oXYyuoqg)
end

local GeehrKvs_flat = {}
for _, chunk in ipairs(xWfYXtXx) do
    for _, byte in ipairs(chunk) do
        table.insert(GeehrKvs_flat, byte)
    end
end

local decrypted = OZVPoKxI(GeehrKvs_flat, DStlrLyj)
local RAhGxjOt, SnXmOzdg = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(GeehrKvs_flat)
GeehrKvs_flat = nil

if RAhGxjOt then 
    local result = RAhGxjOt() 
    decrypted = nil
    RAhGxjOt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(SnXmOzdg)) 
end
