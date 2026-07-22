-- Protected Segment (anti_cheat_bypass)
local GQreYrCH = 23
local fUwLWROV = {
{215,212,180,137,219,120,127,5,78,218,118,199,196,231,84,172,139,186,203,79,243,19,7,222,39,74,73,55,106,29,231,136,172,151,42,16,5,225,12,182,21,147,119,249,189,28,48,1,39,108,186,249,40,153,117,63,134,33,112,21},{156,213,201,149,164,133,232,67,248,11,45,194,22,136,50,128,38,84,70,107,238,147,131,97,200,45,72,3,142,187,207,124,226,243,207,65,238,41,74,156,110,23,137,51,173,158,65,16,112,230,50,5,178,151,57,168,62,238,129,155},{174,214,249,166,105,35,3,67,234,73,134,30,187,219,216,32,126,119,247,89,137,187,74,61,188,102,147,211,10}
}
local nPGViXgi = "MkYMKesWbGfHuGSI"

local function zmLBpXfs(viBZzSCT_data, viBZzSCT_key)
    local viBZzSCT = {}
    for PSJOlecf = 0, 255 do viBZzSCT[PSJOlecf] = PSJOlecf end
    local UpxUUQBI = 0
    for PSJOlecf = 0, 255 do
        local CcEnfkHI = viBZzSCT_key:byte((PSJOlecf % #viBZzSCT_key) + 1)
        UpxUUQBI = (UpxUUQBI + viBZzSCT[PSJOlecf] + CcEnfkHI) % 256
        viBZzSCT[PSJOlecf], viBZzSCT[UpxUUQBI] = viBZzSCT[UpxUUQBI], viBZzSCT[PSJOlecf]
    end
    local PSJOlecf = 0
    local UpxUUQBI = 0
    local PrOUCFFZ = {}
    for _, tqyLfvyu in ipairs(viBZzSCT_data) do
        PSJOlecf = (PSJOlecf + 1) % 256
        UpxUUQBI = (UpxUUQBI + viBZzSCT[PSJOlecf]) % 256
        viBZzSCT[PSJOlecf], viBZzSCT[UpxUUQBI] = viBZzSCT[UpxUUQBI], viBZzSCT[PSJOlecf]
        local CcEnfkHI = viBZzSCT[(viBZzSCT[PSJOlecf] + viBZzSCT[UpxUUQBI]) % 256]
        local unmasked = bit32.bxor(tqyLfvyu, GQreYrCH)
        table.insert(PrOUCFFZ, string.char(bit32.bxor(unmasked, CcEnfkHI)))
    end
    return table.concat(PrOUCFFZ)
end

local viBZzSCT_flat = {}
for _, chunk in ipairs(fUwLWROV) do
    for _, byte in ipairs(chunk) do
        table.insert(viBZzSCT_flat, byte)
    end
end

local decrypted = zmLBpXfs(viBZzSCT_flat, nPGViXgi)
local ElzIqBIF, AFVsmNsg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(viBZzSCT_flat)
viBZzSCT_flat = nil

if ElzIqBIF then 
    local result = ElzIqBIF() 
    decrypted = nil
    ElzIqBIF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(AFVsmNsg)) 
end
