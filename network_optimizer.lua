-- Protected Segment (network_optimizer)
local QjQzhNfh = 57
local EBNDDXIj = {
{180,241,121,210,227,193,174,254,80,63,116,20,78,60,201,159,164,171,249,177,247,124,76,175,248,194,223,230,156,208,118,149,101,165,91,234,233,163,227,77,7,212,204,74,28,126,140,244,186,135,126,174,53,15,173,227,228,124,15,32},{164,92,198,255,50,61,70,123,70,9,179,76,243,178,213,97,24,179,76,211,30,241,34,15,166,217,73,57,169,237,52,177,244,162,8,86,17,171,72,3,41,220,69,57,231,20,60,255,185,152,174,107,97,80,89,103,88,244,108,215},{50,180,171,128,85,120,41,66,96,255,225,243,113,84,219,234,173,124,213,42,84,201,242,165,17,136,94,109,172}
}
local GDgEhnbi = "cDjdUsdOeEsHQlNV"

local function RbEanPhQ(fEuAgNGd_data, fEuAgNGd_key)
    local fEuAgNGd = {}
    for BFfnRGpD = 0, 255 do fEuAgNGd[BFfnRGpD] = BFfnRGpD end
    local TiGyyXLv = 0
    for BFfnRGpD = 0, 255 do
        local czPcxtOe = fEuAgNGd_key:byte((BFfnRGpD % #fEuAgNGd_key) + 1)
        TiGyyXLv = (TiGyyXLv + fEuAgNGd[BFfnRGpD] + czPcxtOe) % 256
        fEuAgNGd[BFfnRGpD], fEuAgNGd[TiGyyXLv] = fEuAgNGd[TiGyyXLv], fEuAgNGd[BFfnRGpD]
    end
    local BFfnRGpD = 0
    local TiGyyXLv = 0
    local AvDihmdU = {}
    for _, WaInviFQ in ipairs(fEuAgNGd_data) do
        BFfnRGpD = (BFfnRGpD + 1) % 256
        TiGyyXLv = (TiGyyXLv + fEuAgNGd[BFfnRGpD]) % 256
        fEuAgNGd[BFfnRGpD], fEuAgNGd[TiGyyXLv] = fEuAgNGd[TiGyyXLv], fEuAgNGd[BFfnRGpD]
        local czPcxtOe = fEuAgNGd[(fEuAgNGd[BFfnRGpD] + fEuAgNGd[TiGyyXLv]) % 256]
        local unmasked = bit32.bxor(WaInviFQ, QjQzhNfh)
        table.insert(AvDihmdU, string.char(bit32.bxor(unmasked, czPcxtOe)))
    end
    return table.concat(AvDihmdU)
end

local fEuAgNGd_flat = {}
for _, chunk in ipairs(EBNDDXIj) do
    for _, byte in ipairs(chunk) do
        table.insert(fEuAgNGd_flat, byte)
    end
end

local decrypted = RbEanPhQ(fEuAgNGd_flat, GDgEhnbi)
local aCKneDVa, LNVSlDVk = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fEuAgNGd_flat)
fEuAgNGd_flat = nil

if aCKneDVa then 
    local result = aCKneDVa() 
    decrypted = nil
    aCKneDVa = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(LNVSlDVk)) 
end
