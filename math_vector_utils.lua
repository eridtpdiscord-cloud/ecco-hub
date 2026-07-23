-- Protected Segment (math_vector_utils)
local PvRBlxoI = 210
local wzRVkNAW = {
{217,95,222,204,88,30,226,103,154,233,72,155,209,195,215,51,162,87,156,184,109,239,60,85,88,221,3,185,246,158,207,137,78,234,155,203,141,108,58,177,112,231,159,200,10,1,244,163,26,115,18,88,58,131,164,160,113,62,80,173},{95,126,185,132,81,126,146,154,130,88,124,11,235,73,188,229,87,210,192,172,166,239,87,3,83,20,47,23,149,53,208,27,242,251,3,23,39,208,75,36,43,248,159,136,71,14,49,201,120,145,115,202,163,206,232,244,30,46,136,49},{103,77,237,154,118,73,12,14,55,105,169,96,208,132,4,39,52,130,5,210,250,87,106,41,113,196,217,80,174}
}
local KBdxreLu = "hAEaHrWHxQnzQJeJ"

local function vNxMGTvg(qazQXeoI_data, qazQXeoI_key)
    if type(qazQXeoI_key) ~= "string" or #qazQXeoI_key == 0 then return "" end
    local qazQXeoI = {}
    for UIgRdUdq = 0, 255 do qazQXeoI[UIgRdUdq] = UIgRdUdq end
    local LifjeVAP = 0
    for UIgRdUdq = 0, 255 do
        local mqfcwkDV = qazQXeoI_key:byte((UIgRdUdq % #qazQXeoI_key) + 1)
        LifjeVAP = (LifjeVAP + qazQXeoI[UIgRdUdq] + mqfcwkDV) % 256
        qazQXeoI[UIgRdUdq], qazQXeoI[LifjeVAP] = qazQXeoI[LifjeVAP], qazQXeoI[UIgRdUdq]
    end
    local UIgRdUdq = 0
    local LifjeVAP = 0
    local IKuFPdkd = {}
    for _, AOyaUkDs in ipairs(qazQXeoI_data) do
        UIgRdUdq = (UIgRdUdq + 1) % 256
        LifjeVAP = (LifjeVAP + qazQXeoI[UIgRdUdq]) % 256
        qazQXeoI[UIgRdUdq], qazQXeoI[LifjeVAP] = qazQXeoI[LifjeVAP], qazQXeoI[UIgRdUdq]
        local mqfcwkDV = qazQXeoI[(qazQXeoI[UIgRdUdq] + qazQXeoI[LifjeVAP]) % 256]
        local unmasked = bit32.bxor(AOyaUkDs, PvRBlxoI)
        table.insert(IKuFPdkd, string.char(bit32.bxor(unmasked, mqfcwkDV)))
    end
    return table.concat(IKuFPdkd)
end

local qazQXeoI_flat = {}
for _, chunk in ipairs(wzRVkNAW) do
    for _, byte in ipairs(chunk) do
        table.insert(qazQXeoI_flat, byte)
    end
end

local decrypted = vNxMGTvg(qazQXeoI_flat, KBdxreLu)
local izVPHdqx, MLaMimJj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qazQXeoI_flat)
qazQXeoI_flat = nil

if izVPHdqx then 
    local result = izVPHdqx() 
    decrypted = nil
    izVPHdqx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(MLaMimJj)) 
end
