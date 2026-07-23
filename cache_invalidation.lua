-- Protected Segment (cache_invalidation)
local EkWaaouc = 139
local ZCxEdfqD = {
{250,39,218,252,39,225,183,132,189,12,69,225,154,15,183,143,107,38,93,2,187,148,82,17,195,180,105,86,50,44,44,23,48,123,134,56,34,61,119,159,90,38,101,64,181,20,246,99,33,32,170,149,148,74,15,125,164,157,35,86},{88,237,162,190,173,89,194,46,160,57,209,95,169,239,59,12,36,216,224,141,69,17,253,87,61,43,202,211,122,140,90,238,38,84,124,231,222,133,32,9,233,235,167,237,174,243,230,223,184,157,220,166,237,192,115,213,158,46,139,56},{129,31,218,0,39,87,217,19,201,163,200,56,34,110,147,182,202,170,119,118,101,0,30,145,7,229,25,141,224,229}
}
local WJjEjhtS = "GdMrtYuQwmOdpAoO"

local function HwjCJOxc(LpXxJfVd_data, LpXxJfVd_key)
    if type(LpXxJfVd_key) ~= "string" or #LpXxJfVd_key == 0 then return "" end
    local LpXxJfVd = {}
    for ruLKHXTs = 0, 255 do LpXxJfVd[ruLKHXTs] = ruLKHXTs end
    local HYlKQkoR = 0
    for ruLKHXTs = 0, 255 do
        local jVhRXQzf = LpXxJfVd_key:byte((ruLKHXTs % #LpXxJfVd_key) + 1)
        HYlKQkoR = (HYlKQkoR + LpXxJfVd[ruLKHXTs] + jVhRXQzf) % 256
        LpXxJfVd[ruLKHXTs], LpXxJfVd[HYlKQkoR] = LpXxJfVd[HYlKQkoR], LpXxJfVd[ruLKHXTs]
    end
    local ruLKHXTs = 0
    local HYlKQkoR = 0
    local brrpjZpd = {}
    for _, XjqepwYa in ipairs(LpXxJfVd_data) do
        ruLKHXTs = (ruLKHXTs + 1) % 256
        HYlKQkoR = (HYlKQkoR + LpXxJfVd[ruLKHXTs]) % 256
        LpXxJfVd[ruLKHXTs], LpXxJfVd[HYlKQkoR] = LpXxJfVd[HYlKQkoR], LpXxJfVd[ruLKHXTs]
        local jVhRXQzf = LpXxJfVd[(LpXxJfVd[ruLKHXTs] + LpXxJfVd[HYlKQkoR]) % 256]
        local unmasked = bit32.bxor(XjqepwYa, EkWaaouc)
        table.insert(brrpjZpd, string.char(bit32.bxor(unmasked, jVhRXQzf)))
    end
    return table.concat(brrpjZpd)
end

local LpXxJfVd_flat = {}
for _, chunk in ipairs(ZCxEdfqD) do
    for _, byte in ipairs(chunk) do
        table.insert(LpXxJfVd_flat, byte)
    end
end

local decrypted = HwjCJOxc(LpXxJfVd_flat, WJjEjhtS)
local nfgvqYLi, iwGJHwhj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(LpXxJfVd_flat)
LpXxJfVd_flat = nil

if nfgvqYLi then 
    local result = nfgvqYLi() 
    decrypted = nil
    nfgvqYLi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(iwGJHwhj)) 
end
