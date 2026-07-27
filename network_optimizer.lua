-- Protected Segment (network_optimizer)
local fyJTlOoA = 126
local CIXHuUDI = {
{148,227,51,209,54,104,196,124,176,62,173,157,155,39,20,40,149,241,99,73,90,144,183,68,31,27,133,13,186,21,214,67,17,226,140,147,78,129,193,133,67,165,35,55,135,242,70,134,220,78,33,189,65,226,83,143,180,77,163,199},{35,201,172,103,196,205,23,188,216,85,179,241,221,203,197,65,158,95,12,177,170,121,13,234,206,108,87,125,176,249,214,247,74,57,236,20,234,242,169,215,85,235,130,130,11,182,169,136,254,159,188,173,249,102,27,96,100,218,93,215},{85,145,239,143,22,36,131,89,150,16,215,17,8,214,215,111,153,237,243,111,229,207,41,249,167,79,137,56,134}
}
local oomtWrBx = "pAoejJBMQKGlFFiO"

local function IrlzUnvl(uyvsBzjZ_data, uyvsBzjZ_key)
    if type(uyvsBzjZ_key) ~= "string" or #uyvsBzjZ_key == 0 then return "" end
    local uyvsBzjZ = {}
    for hQeSDsAd = 0, 255 do uyvsBzjZ[hQeSDsAd] = hQeSDsAd end
    local rXZIvVSo = 0
    for hQeSDsAd = 0, 255 do
        local zGoRmRVr = uyvsBzjZ_key:byte((hQeSDsAd % #uyvsBzjZ_key) + 1)
        rXZIvVSo = (rXZIvVSo + uyvsBzjZ[hQeSDsAd] + zGoRmRVr) % 256
        uyvsBzjZ[hQeSDsAd], uyvsBzjZ[rXZIvVSo] = uyvsBzjZ[rXZIvVSo], uyvsBzjZ[hQeSDsAd]
    end
    local hQeSDsAd = 0
    local rXZIvVSo = 0
    local qENHotkI = {}
    for _, sIxXkQHQ in ipairs(uyvsBzjZ_data) do
        hQeSDsAd = (hQeSDsAd + 1) % 256
        rXZIvVSo = (rXZIvVSo + uyvsBzjZ[hQeSDsAd]) % 256
        uyvsBzjZ[hQeSDsAd], uyvsBzjZ[rXZIvVSo] = uyvsBzjZ[rXZIvVSo], uyvsBzjZ[hQeSDsAd]
        local zGoRmRVr = uyvsBzjZ[(uyvsBzjZ[hQeSDsAd] + uyvsBzjZ[rXZIvVSo]) % 256]
        local unmasked = bit32.bxor(sIxXkQHQ, fyJTlOoA)
        table.insert(qENHotkI, string.char(bit32.bxor(unmasked, zGoRmRVr)))
    end
    return table.concat(qENHotkI)
end

local uyvsBzjZ_flat = {}
for _, chunk in ipairs(CIXHuUDI) do
    for _, byte in ipairs(chunk) do
        table.insert(uyvsBzjZ_flat, byte)
    end
end

local decrypted = IrlzUnvl(uyvsBzjZ_flat, oomtWrBx)
local ugdTFSxs, OVamPUeZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(uyvsBzjZ_flat)
uyvsBzjZ_flat = nil

if ugdTFSxs then 
    local result = ugdTFSxs() 
    decrypted = nil
    ugdTFSxs = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(OVamPUeZ)) 
end
