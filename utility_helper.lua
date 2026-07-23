-- Protected Segment (utility_helper)
local aSESAoZF = 19
local XNXjqItz = {
{177,50,67,198,170,217,14,208,222,200,154,205,167,138,166,153,224,5,51,143,100,132,142,121,21,79,124,173,209,171,184,36,233,161,155,143,231,38,218,193,53,92,205,89,194,255,178,116,155,214,8,237,27,189,137,209,164,139,129,98},{206,239,103,180,58,202,141,78,220,87,33,70,109,209,84,51,125,137,53,183,205,186,65,84,30,6,129,79,237,185,208,160,0,61,34,120,175,246,102,233,52,20,171,168,68,20,218,112,36,249,141,96,7,44,246,44,42,152,165,252},{28,129,218,7,79,50,88,174,70,68,119,5,124,13,249,89,106,64,236,26,195,202,193,4,49,135}
}
local bjpFklLa = "VpyTOhsQxuPViHqe"

local function xoxQmuUR(GZwqWTHy_data, GZwqWTHy_key)
    if type(GZwqWTHy_key) ~= "string" or #GZwqWTHy_key == 0 then return "" end
    local GZwqWTHy = {}
    for wjXRtGkp = 0, 255 do GZwqWTHy[wjXRtGkp] = wjXRtGkp end
    local Hkgvfnmp = 0
    for wjXRtGkp = 0, 255 do
        local NTbNAlNf = GZwqWTHy_key:byte((wjXRtGkp % #GZwqWTHy_key) + 1)
        Hkgvfnmp = (Hkgvfnmp + GZwqWTHy[wjXRtGkp] + NTbNAlNf) % 256
        GZwqWTHy[wjXRtGkp], GZwqWTHy[Hkgvfnmp] = GZwqWTHy[Hkgvfnmp], GZwqWTHy[wjXRtGkp]
    end
    local wjXRtGkp = 0
    local Hkgvfnmp = 0
    local OjbKsPAV = {}
    for _, IRqZsSeU in ipairs(GZwqWTHy_data) do
        wjXRtGkp = (wjXRtGkp + 1) % 256
        Hkgvfnmp = (Hkgvfnmp + GZwqWTHy[wjXRtGkp]) % 256
        GZwqWTHy[wjXRtGkp], GZwqWTHy[Hkgvfnmp] = GZwqWTHy[Hkgvfnmp], GZwqWTHy[wjXRtGkp]
        local NTbNAlNf = GZwqWTHy[(GZwqWTHy[wjXRtGkp] + GZwqWTHy[Hkgvfnmp]) % 256]
        local unmasked = bit32.bxor(IRqZsSeU, aSESAoZF)
        table.insert(OjbKsPAV, string.char(bit32.bxor(unmasked, NTbNAlNf)))
    end
    return table.concat(OjbKsPAV)
end

local GZwqWTHy_flat = {}
for _, chunk in ipairs(XNXjqItz) do
    for _, byte in ipairs(chunk) do
        table.insert(GZwqWTHy_flat, byte)
    end
end

local decrypted = xoxQmuUR(GZwqWTHy_flat, bjpFklLa)
local rmRGOiWJ, NxymxyKO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GZwqWTHy_flat)
GZwqWTHy_flat = nil

if rmRGOiWJ then 
    local result = rmRGOiWJ() 
    decrypted = nil
    rmRGOiWJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(NxymxyKO)) 
end
