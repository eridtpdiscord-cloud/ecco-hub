-- Protected Segment (ui_themes)
local PfcfinIA = 68
local YmzGUkPV = {
{141,150,113,165,1,60,25,147,237,39,199,15,251,152,156,230,93,158,74,170,227,172,43,182,182,3,164,253,9,148,30,229,185,120,46,73,231,177,123,108,187,168,85,139,77,77,103,158,230,228,189,204,99,255,189,204,215,208,14,214},{6,228,138,250,180,49,202,22,182,93,217,155,97,143,20,40,85,83,217,238,170,130,24,57,80,234,232,42,150,19,99,235,156,195,167,188,228,231,199,231,4,228,2,161,19,243,244,165,126,220,167,80,85,0,107,33,148,146,76,22},{88,209,105,60,101,136,236,162,219,214,155,1,117,227,27,54,144,52,209,31,206}
}
local ZWGjQHsb = "fZkyQpTOifgnRWqq"

local function OFsHATnJ(ZcCZCrwT_data, ZcCZCrwT_key)
    local ZcCZCrwT = {}
    for utdlalVm = 0, 255 do ZcCZCrwT[utdlalVm] = utdlalVm end
    local FKzzNFAl = 0
    for utdlalVm = 0, 255 do
        local nfTpbaVI = ZcCZCrwT_key:byte((utdlalVm % #ZcCZCrwT_key) + 1)
        FKzzNFAl = (FKzzNFAl + ZcCZCrwT[utdlalVm] + nfTpbaVI) % 256
        ZcCZCrwT[utdlalVm], ZcCZCrwT[FKzzNFAl] = ZcCZCrwT[FKzzNFAl], ZcCZCrwT[utdlalVm]
    end
    local utdlalVm = 0
    local FKzzNFAl = 0
    local ZResPJSt = {}
    for _, FEvStkaM in ipairs(ZcCZCrwT_data) do
        utdlalVm = (utdlalVm + 1) % 256
        FKzzNFAl = (FKzzNFAl + ZcCZCrwT[utdlalVm]) % 256
        ZcCZCrwT[utdlalVm], ZcCZCrwT[FKzzNFAl] = ZcCZCrwT[FKzzNFAl], ZcCZCrwT[utdlalVm]
        local nfTpbaVI = ZcCZCrwT[(ZcCZCrwT[utdlalVm] + ZcCZCrwT[FKzzNFAl]) % 256]
        local unmasked = bit32.bxor(FEvStkaM, PfcfinIA)
        table.insert(ZResPJSt, string.char(bit32.bxor(unmasked, nfTpbaVI)))
    end
    return table.concat(ZResPJSt)
end

local ZcCZCrwT_flat = {}
for _, chunk in ipairs(YmzGUkPV) do
    for _, byte in ipairs(chunk) do
        table.insert(ZcCZCrwT_flat, byte)
    end
end

local decrypted = OFsHATnJ(ZcCZCrwT_flat, ZWGjQHsb)
local xAKPHqxb, yDjYxJWg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZcCZCrwT_flat)
ZcCZCrwT_flat = nil

if xAKPHqxb then 
    local result = xAKPHqxb() 
    decrypted = nil
    xAKPHqxb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(yDjYxJWg)) 
end
