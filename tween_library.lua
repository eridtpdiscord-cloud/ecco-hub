-- Protected Segment (tween_library)
local ofiHscLs = 128
local fBMPjWOG = {
{124,109,199,218,179,135,218,124,35,19,143,10,131,182,210,238,55,115,24,136,124,98,46,174,98,237,174,96,199,93,9,140,56,72,222,106,95,193,35,23,119,229,27,74,231,163,173,115,17,251,240,48,78,142,35,205,203,116,242,145},{19,201,5,3,82,39,198,217,135,173,157,4,152,110,116,161,152,159,103,105,91,107,25,202,10,24,168,210,104,147,129,186,44,82,189,184,54,153,159,206,46,75,20,85,48,175,197,20,142,98,94,141,198,180,72,189,45,141,88,174},{229,31,192,207,176,176,214,145,56,177,146,71,156,119,161,190,141,181,145,206,152,249,96,161,221}
}
local sbMByllp = "PDKBENtBkHkFhFZB"

local function QZlTpXpc(KgUnWKov_data, KgUnWKov_key)
    local KgUnWKov = {}
    for zcjVvFTs = 0, 255 do KgUnWKov[zcjVvFTs] = zcjVvFTs end
    local bmhcxPoE = 0
    for zcjVvFTs = 0, 255 do
        local UnoTAOoK = KgUnWKov_key:byte((zcjVvFTs % #KgUnWKov_key) + 1)
        bmhcxPoE = (bmhcxPoE + KgUnWKov[zcjVvFTs] + UnoTAOoK) % 256
        KgUnWKov[zcjVvFTs], KgUnWKov[bmhcxPoE] = KgUnWKov[bmhcxPoE], KgUnWKov[zcjVvFTs]
    end
    local zcjVvFTs = 0
    local bmhcxPoE = 0
    local RyqPgXvI = {}
    for _, koHiZpLG in ipairs(KgUnWKov_data) do
        zcjVvFTs = (zcjVvFTs + 1) % 256
        bmhcxPoE = (bmhcxPoE + KgUnWKov[zcjVvFTs]) % 256
        KgUnWKov[zcjVvFTs], KgUnWKov[bmhcxPoE] = KgUnWKov[bmhcxPoE], KgUnWKov[zcjVvFTs]
        local UnoTAOoK = KgUnWKov[(KgUnWKov[zcjVvFTs] + KgUnWKov[bmhcxPoE]) % 256]
        local unmasked = bit32.bxor(koHiZpLG, ofiHscLs)
        table.insert(RyqPgXvI, string.char(bit32.bxor(unmasked, UnoTAOoK)))
    end
    return table.concat(RyqPgXvI)
end

local KgUnWKov_flat = {}
for _, chunk in ipairs(fBMPjWOG) do
    for _, byte in ipairs(chunk) do
        table.insert(KgUnWKov_flat, byte)
    end
end

local decrypted = QZlTpXpc(KgUnWKov_flat, sbMByllp)
local MNWEqmXw, GsHGUncL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(KgUnWKov_flat)
KgUnWKov_flat = nil

if MNWEqmXw then 
    local result = MNWEqmXw() 
    decrypted = nil
    MNWEqmXw = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(GsHGUncL)) 
end
