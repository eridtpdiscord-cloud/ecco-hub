-- Protected Segment (tween_library)
local WluYxelv = 194
local HxmWevji = {
{7,149,61,140,210,213,154,170,70,112,33,132,43,91,244,207,12,231,192,76,147,4,42,28,153,9,130,44,30,50,103,222,124,99,227,51,73,60,151,4,183,196,58,218,3,82,8,73,205,177,121,144,1,233,133,238,182,9,58,178},{96,92,159,251,50,131,23,101,233,147,181,233,23,213,88,102,180,38,53,51,65,150,235,50,115,193,60,189,179,230,249,200,202,221,147,63,235,1,226,111,77,50,111,123,24,157,3,217,21,50,114,215,144,225,166,78,212,175,234,172},{40,90,178,247,149,176,40,116,58,126,147,203,13,70,124,22,168,106,211,105,144,34,18,98,85}
}
local HKamUJLt = "lITrsZCMkEbRsxwS"

local function dqTWVpup(kuWCgmby_data, kuWCgmby_key)
    if type(kuWCgmby_key) ~= "string" or #kuWCgmby_key == 0 then return "" end
    local kuWCgmby = {}
    for WkeBjJQT = 0, 255 do kuWCgmby[WkeBjJQT] = WkeBjJQT end
    local bofKNKaw = 0
    for WkeBjJQT = 0, 255 do
        local XQNZrQil = kuWCgmby_key:byte((WkeBjJQT % #kuWCgmby_key) + 1)
        bofKNKaw = (bofKNKaw + kuWCgmby[WkeBjJQT] + XQNZrQil) % 256
        kuWCgmby[WkeBjJQT], kuWCgmby[bofKNKaw] = kuWCgmby[bofKNKaw], kuWCgmby[WkeBjJQT]
    end
    local WkeBjJQT = 0
    local bofKNKaw = 0
    local MXkBrQRh = {}
    for _, OhVvjpTL in ipairs(kuWCgmby_data) do
        WkeBjJQT = (WkeBjJQT + 1) % 256
        bofKNKaw = (bofKNKaw + kuWCgmby[WkeBjJQT]) % 256
        kuWCgmby[WkeBjJQT], kuWCgmby[bofKNKaw] = kuWCgmby[bofKNKaw], kuWCgmby[WkeBjJQT]
        local XQNZrQil = kuWCgmby[(kuWCgmby[WkeBjJQT] + kuWCgmby[bofKNKaw]) % 256]
        local unmasked = bit32.bxor(OhVvjpTL, WluYxelv)
        table.insert(MXkBrQRh, string.char(bit32.bxor(unmasked, XQNZrQil)))
    end
    return table.concat(MXkBrQRh)
end

local kuWCgmby_flat = {}
for _, chunk in ipairs(HxmWevji) do
    for _, byte in ipairs(chunk) do
        table.insert(kuWCgmby_flat, byte)
    end
end

local decrypted = dqTWVpup(kuWCgmby_flat, HKamUJLt)
local IBydzDnA, ILGZoKWh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(kuWCgmby_flat)
kuWCgmby_flat = nil

if IBydzDnA then 
    local result = IBydzDnA() 
    decrypted = nil
    IBydzDnA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(ILGZoKWh)) 
end
