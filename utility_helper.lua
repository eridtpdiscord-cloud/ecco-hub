-- Protected Segment (utility_helper)
local mhXoYbKq = 131
local fFhtggip = {
{81,31,208,87,152,245,232,251,9,247,187,176,248,49,133,158,97,27,150,171,78,100,13,171,47,13,182,243,89,113,117,123,197,179,248,253,4,143,175,2,85,83,48,28,158,121,228,160,165,12,52,5,233,249,67,5,175,198,115,75},{38,239,170,99,237,136,138,68,33,66,32,118,220,88,159,39,171,33,136,91,125,235,142,182,222,100,136,28,135,23,99,158,27,226,110,149,99,156,179,255,202,158,251,170,96,214,127,243,218,126,27,107,184,126,178,36,247,90,35,73},{63,98,25,29,86,138,226,137,27,149,128,172,26,132,29,200,199,41,225,75,213,221,159,165,183,26}
}
local EWVoecVD = "rkUqsjbMcRjGjLBV"

local function lnOIelGC(hgbkztaE_data, hgbkztaE_key)
    local hgbkztaE = {}
    for nNwDoVPO = 0, 255 do hgbkztaE[nNwDoVPO] = nNwDoVPO end
    local hYMSChzl = 0
    for nNwDoVPO = 0, 255 do
        local ucecUpTj = hgbkztaE_key:byte((nNwDoVPO % #hgbkztaE_key) + 1)
        hYMSChzl = (hYMSChzl + hgbkztaE[nNwDoVPO] + ucecUpTj) % 256
        hgbkztaE[nNwDoVPO], hgbkztaE[hYMSChzl] = hgbkztaE[hYMSChzl], hgbkztaE[nNwDoVPO]
    end
    local nNwDoVPO = 0
    local hYMSChzl = 0
    local msFyiFuV = {}
    for _, QtkhxBIf in ipairs(hgbkztaE_data) do
        nNwDoVPO = (nNwDoVPO + 1) % 256
        hYMSChzl = (hYMSChzl + hgbkztaE[nNwDoVPO]) % 256
        hgbkztaE[nNwDoVPO], hgbkztaE[hYMSChzl] = hgbkztaE[hYMSChzl], hgbkztaE[nNwDoVPO]
        local ucecUpTj = hgbkztaE[(hgbkztaE[nNwDoVPO] + hgbkztaE[hYMSChzl]) % 256]
        local unmasked = bit32.bxor(QtkhxBIf, mhXoYbKq)
        table.insert(msFyiFuV, string.char(bit32.bxor(unmasked, ucecUpTj)))
    end
    return table.concat(msFyiFuV)
end

local hgbkztaE_flat = {}
for _, chunk in ipairs(fFhtggip) do
    for _, byte in ipairs(chunk) do
        table.insert(hgbkztaE_flat, byte)
    end
end

local decrypted = lnOIelGC(hgbkztaE_flat, EWVoecVD)
local rpPECHTi, ydXnEnSK = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(hgbkztaE_flat)
hgbkztaE_flat = nil

if rpPECHTi then 
    local result = rpPECHTi() 
    decrypted = nil
    rpPECHTi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(ydXnEnSK)) 
end
