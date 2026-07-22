-- Protected Segment (anti_cheat_bypass)
local QPhWmBxy = 5
local eSYQufgQ = {
{191,49,33,255,78,34,237,125,15,251,34,67,236,188,197,122,254,183,252,225,90,229,192,120,28,103,21,7,129,126,248,63,253,30,218,138,59,84,219,98,111,181,68,150,239,40,218,116,166,36,64,250,11,33,118,14,183,62,18,220},{98,132,125,218,22,239,241,230,69,126,139,211,15,104,181,166,38,145,37,227,68,169,217,243,242,44,120,132,204,174,243,196,48,226,159,81,143,132,73,124,95,139,102,48,11,196,202,200,106,68,80,87,192,151,133,221,104,114,21,149},{124,68,180,146,37,182,2,145,163,162,140,250,226,140,176,145,138,162,215,14,81,95,13,109,96,112,137,103,137}
}
local mKLzDnIx = "aUTyxBBeOzKJZdOD"

local function sgiKftav(NbiJhjzu_data, NbiJhjzu_key)
    local NbiJhjzu = {}
    for cJELJyou = 0, 255 do NbiJhjzu[cJELJyou] = cJELJyou end
    local WTUfFieG = 0
    for cJELJyou = 0, 255 do
        local jzGcodsi = NbiJhjzu_key:byte((cJELJyou % #NbiJhjzu_key) + 1)
        WTUfFieG = (WTUfFieG + NbiJhjzu[cJELJyou] + jzGcodsi) % 256
        NbiJhjzu[cJELJyou], NbiJhjzu[WTUfFieG] = NbiJhjzu[WTUfFieG], NbiJhjzu[cJELJyou]
    end
    local cJELJyou = 0
    local WTUfFieG = 0
    local pvKowluj = {}
    for _, dGbiUYma in ipairs(NbiJhjzu_data) do
        cJELJyou = (cJELJyou + 1) % 256
        WTUfFieG = (WTUfFieG + NbiJhjzu[cJELJyou]) % 256
        NbiJhjzu[cJELJyou], NbiJhjzu[WTUfFieG] = NbiJhjzu[WTUfFieG], NbiJhjzu[cJELJyou]
        local jzGcodsi = NbiJhjzu[(NbiJhjzu[cJELJyou] + NbiJhjzu[WTUfFieG]) % 256]
        local unmasked = bit32.bxor(dGbiUYma, QPhWmBxy)
        table.insert(pvKowluj, string.char(bit32.bxor(unmasked, jzGcodsi)))
    end
    return table.concat(pvKowluj)
end

local NbiJhjzu_flat = {}
for _, chunk in ipairs(eSYQufgQ) do
    for _, byte in ipairs(chunk) do
        table.insert(NbiJhjzu_flat, byte)
    end
end

local decrypted = sgiKftav(NbiJhjzu_flat, mKLzDnIx)
local GJYkXLmR, ZUmFAkke = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NbiJhjzu_flat)
NbiJhjzu_flat = nil

if GJYkXLmR then 
    local result = GJYkXLmR() 
    decrypted = nil
    GJYkXLmR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(ZUmFAkke)) 
end
