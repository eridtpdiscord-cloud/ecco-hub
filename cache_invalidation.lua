-- Protected Segment (cache_invalidation)
local OBTzwGsU = 173
local gfFXpBwC = {
{183,91,22,218,49,53,11,133,61,241,92,3,138,118,186,60,161,84,5,47,206,128,10,1,148,179,193,44,194,132,234,139,22,156,102,34,58,89,199,215,73,167,70,198,44,111,120,102,240,36,134,24,63,63,61,50,178,159,51,105},{46,196,64,25,172,5,54,82,104,44,222,143,51,155,67,149,201,110,131,52,176,125,98,29,213,18,200,33,141,3,241,121,228,90,151,59,246,53,236,125,163,90,26,89,171,165,205,12,162,91,171,210,181,213,16,238,104,42,240,15},{231,32,14,198,147,135,57,250,206,174,226,137,58,88,66,115,150,106,134,80,18,165,119,106,75,80,187,159,227,163}
}
local JeZVrfSZ = "TPMVRpqQzUGfeVts"

local function xeKWgXgm(SShJyiVi_data, SShJyiVi_key)
    if type(SShJyiVi_key) ~= "string" or #SShJyiVi_key == 0 then return "" end
    local SShJyiVi = {}
    for XEwNnoWX = 0, 255 do SShJyiVi[XEwNnoWX] = XEwNnoWX end
    local nPtaoPma = 0
    for XEwNnoWX = 0, 255 do
        local ttpzewJx = SShJyiVi_key:byte((XEwNnoWX % #SShJyiVi_key) + 1)
        nPtaoPma = (nPtaoPma + SShJyiVi[XEwNnoWX] + ttpzewJx) % 256
        SShJyiVi[XEwNnoWX], SShJyiVi[nPtaoPma] = SShJyiVi[nPtaoPma], SShJyiVi[XEwNnoWX]
    end
    local XEwNnoWX = 0
    local nPtaoPma = 0
    local lebAbCKQ = {}
    for _, BtrMYPat in ipairs(SShJyiVi_data) do
        XEwNnoWX = (XEwNnoWX + 1) % 256
        nPtaoPma = (nPtaoPma + SShJyiVi[XEwNnoWX]) % 256
        SShJyiVi[XEwNnoWX], SShJyiVi[nPtaoPma] = SShJyiVi[nPtaoPma], SShJyiVi[XEwNnoWX]
        local ttpzewJx = SShJyiVi[(SShJyiVi[XEwNnoWX] + SShJyiVi[nPtaoPma]) % 256]
        local unmasked = bit32.bxor(BtrMYPat, OBTzwGsU)
        table.insert(lebAbCKQ, string.char(bit32.bxor(unmasked, ttpzewJx)))
    end
    return table.concat(lebAbCKQ)
end

local SShJyiVi_flat = {}
for _, chunk in ipairs(gfFXpBwC) do
    for _, byte in ipairs(chunk) do
        table.insert(SShJyiVi_flat, byte)
    end
end

local decrypted = xeKWgXgm(SShJyiVi_flat, JeZVrfSZ)
local lIPqOwSR, kKBOoFbL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SShJyiVi_flat)
SShJyiVi_flat = nil

if lIPqOwSR then 
    local result = lIPqOwSR() 
    decrypted = nil
    lIPqOwSR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(kKBOoFbL)) 
end
