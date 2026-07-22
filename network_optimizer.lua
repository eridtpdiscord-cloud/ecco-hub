-- Protected Segment (network_optimizer)
local buCzcPcN = 12
local BmzPSiME = {
{190,255,251,99,17,52,66,174,67,177,200,226,155,169,255,171,52,248,132,94,17,210,139,138,122,234,228,125,154,122,24,93,163,108,42,214,85,145,215,19,139,20,240,146,102,60,142,156,124,187,217,200,27,149,92,195,158,116,141,139},{56,57,66,94,100,175,235,55,170,166,13,103,135,254,1,201,97,121,172,85,211,246,220,87,96,143,13,112,95,127,148,204,140,77,58,101,122,104,250,13,68,162,136,97,48,109,88,14,36,40,180,209,154,78,141,248,235,179,37,218},{178,35,38,170,209,42,89,199,98,150,15,32,245,21,53,245,22,160,189,36,1,241,140,138,138,189,61,46,41}
}
local PVDgqCbH = "iARwNfhWyRRRehki"

local function WHhqeUPE(fRGHxltr_data, fRGHxltr_key)
    local fRGHxltr = {}
    for TbEFToQp = 0, 255 do fRGHxltr[TbEFToQp] = TbEFToQp end
    local pFcpjcKV = 0
    for TbEFToQp = 0, 255 do
        local zUZmisLR = fRGHxltr_key:byte((TbEFToQp % #fRGHxltr_key) + 1)
        pFcpjcKV = (pFcpjcKV + fRGHxltr[TbEFToQp] + zUZmisLR) % 256
        fRGHxltr[TbEFToQp], fRGHxltr[pFcpjcKV] = fRGHxltr[pFcpjcKV], fRGHxltr[TbEFToQp]
    end
    local TbEFToQp = 0
    local pFcpjcKV = 0
    local awaRqyIq = {}
    for _, faCXqIoG in ipairs(fRGHxltr_data) do
        TbEFToQp = (TbEFToQp + 1) % 256
        pFcpjcKV = (pFcpjcKV + fRGHxltr[TbEFToQp]) % 256
        fRGHxltr[TbEFToQp], fRGHxltr[pFcpjcKV] = fRGHxltr[pFcpjcKV], fRGHxltr[TbEFToQp]
        local zUZmisLR = fRGHxltr[(fRGHxltr[TbEFToQp] + fRGHxltr[pFcpjcKV]) % 256]
        local unmasked = bit32.bxor(faCXqIoG, buCzcPcN)
        table.insert(awaRqyIq, string.char(bit32.bxor(unmasked, zUZmisLR)))
    end
    return table.concat(awaRqyIq)
end

local fRGHxltr_flat = {}
for _, chunk in ipairs(BmzPSiME) do
    for _, byte in ipairs(chunk) do
        table.insert(fRGHxltr_flat, byte)
    end
end

local decrypted = WHhqeUPE(fRGHxltr_flat, PVDgqCbH)
local IabAIzGH, HfemcgmO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fRGHxltr_flat)
fRGHxltr_flat = nil

if IabAIzGH then 
    local result = IabAIzGH() 
    decrypted = nil
    IabAIzGH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(HfemcgmO)) 
end
