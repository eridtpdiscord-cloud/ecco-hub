-- Protected Segment (utility_helper)
local qKIgVdbt = 46
local wtBEWqmt = {
{115,37,171,89,54,20,68,104,41,182,93,249,226,250,0,14,16,6,40,32,157,44,242,212,177,5,91,243,145,171,235,174,154,18,101,42,255,251,79,63,77,53,28,194,169,86,78,96,36,255,249,120,194,227,5,158,244,129,19,95},{77,99,59,6,250,214,209,155,197,152,46,173,22,250,122,3,39,165,212,172,84,109,158,88,75,31,149,248,239,49,250,227,244,236,215,149,128,33,34,230,185,153,247,91,9,195,230,26,139,214,212,17,15,216,177,172,114,152,160,59},{160,224,102,181,126,221,113,201,242,52,203,136,215,189,48,134,211,31,135,138,115,30,191,236,31,138}
}
local kzNxVpPD = "GmANDTCKTuFfwANM"

local function xszIMbWJ(bWDAjDSm_data, bWDAjDSm_key)
    local bWDAjDSm = {}
    for DGIwyafn = 0, 255 do bWDAjDSm[DGIwyafn] = DGIwyafn end
    local FzrTWpgA = 0
    for DGIwyafn = 0, 255 do
        local KDjdQFVY = bWDAjDSm_key:byte((DGIwyafn % #bWDAjDSm_key) + 1)
        FzrTWpgA = (FzrTWpgA + bWDAjDSm[DGIwyafn] + KDjdQFVY) % 256
        bWDAjDSm[DGIwyafn], bWDAjDSm[FzrTWpgA] = bWDAjDSm[FzrTWpgA], bWDAjDSm[DGIwyafn]
    end
    local DGIwyafn = 0
    local FzrTWpgA = 0
    local YLBvbgkl = {}
    for _, vWUvBxXP in ipairs(bWDAjDSm_data) do
        DGIwyafn = (DGIwyafn + 1) % 256
        FzrTWpgA = (FzrTWpgA + bWDAjDSm[DGIwyafn]) % 256
        bWDAjDSm[DGIwyafn], bWDAjDSm[FzrTWpgA] = bWDAjDSm[FzrTWpgA], bWDAjDSm[DGIwyafn]
        local KDjdQFVY = bWDAjDSm[(bWDAjDSm[DGIwyafn] + bWDAjDSm[FzrTWpgA]) % 256]
        local unmasked = bit32.bxor(vWUvBxXP, qKIgVdbt)
        table.insert(YLBvbgkl, string.char(bit32.bxor(unmasked, KDjdQFVY)))
    end
    return table.concat(YLBvbgkl)
end

local bWDAjDSm_flat = {}
for _, chunk in ipairs(wtBEWqmt) do
    for _, byte in ipairs(chunk) do
        table.insert(bWDAjDSm_flat, byte)
    end
end

local decrypted = xszIMbWJ(bWDAjDSm_flat, kzNxVpPD)
local YZUpeHYv, yYnGtzPB = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bWDAjDSm_flat)
bWDAjDSm_flat = nil

if YZUpeHYv then 
    local result = YZUpeHYv() 
    decrypted = nil
    YZUpeHYv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(yYnGtzPB)) 
end
