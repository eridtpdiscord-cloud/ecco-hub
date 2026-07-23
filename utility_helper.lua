-- Protected Segment (utility_helper)
local NbpfBbkr = 2
local TkLnuYOl = {
{73,46,240,179,131,180,183,44,30,212,219,199,161,13,200,167,37,47,125,69,202,95,23,251,176,130,45,125,195,93,199,89,208,214,40,225,19,11,27,134,4,3,236,167,149,81,60,137,85,254,190,146,55,199,183,28,218,55,221,216},{56,218,72,219,144,112,111,88,204,16,72,91,118,103,113,115,69,181,175,59,61,169,208,134,26,217,120,116,122,107,130,108,255,237,102,136,244,120,23,55,140,174,59,207,80,200,127,56,183,9,134,38,223,206,198,51,210,221,82,144},{42,196,223,127,110,150,99,61,12,110,118,70,3,247,163,8,122,42,17,197,98,125,0,138,207,137}
}
local sQLTvyyg = "edCvuaTjxAhpZDmE"

local function eqYLKPAp(eFltvXIa_data, eFltvXIa_key)
    if type(eFltvXIa_key) ~= "string" or #eFltvXIa_key == 0 then return "" end
    local eFltvXIa = {}
    for RXTbWzeN = 0, 255 do eFltvXIa[RXTbWzeN] = RXTbWzeN end
    local IIzHyTpp = 0
    for RXTbWzeN = 0, 255 do
        local DMGUVtSx = eFltvXIa_key:byte((RXTbWzeN % #eFltvXIa_key) + 1)
        IIzHyTpp = (IIzHyTpp + eFltvXIa[RXTbWzeN] + DMGUVtSx) % 256
        eFltvXIa[RXTbWzeN], eFltvXIa[IIzHyTpp] = eFltvXIa[IIzHyTpp], eFltvXIa[RXTbWzeN]
    end
    local RXTbWzeN = 0
    local IIzHyTpp = 0
    local lzsnLTuf = {}
    for _, GcRHTkhv in ipairs(eFltvXIa_data) do
        RXTbWzeN = (RXTbWzeN + 1) % 256
        IIzHyTpp = (IIzHyTpp + eFltvXIa[RXTbWzeN]) % 256
        eFltvXIa[RXTbWzeN], eFltvXIa[IIzHyTpp] = eFltvXIa[IIzHyTpp], eFltvXIa[RXTbWzeN]
        local DMGUVtSx = eFltvXIa[(eFltvXIa[RXTbWzeN] + eFltvXIa[IIzHyTpp]) % 256]
        local unmasked = bit32.bxor(GcRHTkhv, NbpfBbkr)
        table.insert(lzsnLTuf, string.char(bit32.bxor(unmasked, DMGUVtSx)))
    end
    return table.concat(lzsnLTuf)
end

local eFltvXIa_flat = {}
for _, chunk in ipairs(TkLnuYOl) do
    for _, byte in ipairs(chunk) do
        table.insert(eFltvXIa_flat, byte)
    end
end

local decrypted = eqYLKPAp(eFltvXIa_flat, sQLTvyyg)
local yoIxMoGO, hPGLZpyz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eFltvXIa_flat)
eFltvXIa_flat = nil

if yoIxMoGO then 
    local result = yoIxMoGO() 
    decrypted = nil
    yoIxMoGO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(hPGLZpyz)) 
end
