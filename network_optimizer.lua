-- Protected Segment (network_optimizer)
local KJfXtaFT = 147
local mlbXLIRS = {
{134,66,75,21,164,89,119,209,105,222,150,39,2,128,88,120,52,228,248,254,234,255,188,173,152,254,243,250,197,217,204,144,143,124,214,216,157,26,65,234,90,129,251,52,3,190,211,143,70,27,10,201,76,132,4,225,124,33,249,228},{97,67,53,122,2,222,101,227,35,73,19,152,35,49,131,95,193,190,253,107,215,150,92,173,190,51,101,75,199,150,104,83,167,197,237,26,228,117,8,99,188,71,200,90,188,100,122,95,146,84,154,105,135,107,62,148,132,169,12,167},{150,248,231,161,88,112,236,80,91,76,155,37,197,176,170,66,154,64,76,128,247,108,234,204,146,156,169,10,30}
}
local bSmnlzIY = "FGhUGLStFGHuBCfF"

local function KMHdCcCC(JaJBdiov_data, JaJBdiov_key)
    local JaJBdiov = {}
    for GXpVBbzR = 0, 255 do JaJBdiov[GXpVBbzR] = GXpVBbzR end
    local qCUsRNgq = 0
    for GXpVBbzR = 0, 255 do
        local CbntazPC = JaJBdiov_key:byte((GXpVBbzR % #JaJBdiov_key) + 1)
        qCUsRNgq = (qCUsRNgq + JaJBdiov[GXpVBbzR] + CbntazPC) % 256
        JaJBdiov[GXpVBbzR], JaJBdiov[qCUsRNgq] = JaJBdiov[qCUsRNgq], JaJBdiov[GXpVBbzR]
    end
    local GXpVBbzR = 0
    local qCUsRNgq = 0
    local NAVlwicD = {}
    for _, jvXwvBHt in ipairs(JaJBdiov_data) do
        GXpVBbzR = (GXpVBbzR + 1) % 256
        qCUsRNgq = (qCUsRNgq + JaJBdiov[GXpVBbzR]) % 256
        JaJBdiov[GXpVBbzR], JaJBdiov[qCUsRNgq] = JaJBdiov[qCUsRNgq], JaJBdiov[GXpVBbzR]
        local CbntazPC = JaJBdiov[(JaJBdiov[GXpVBbzR] + JaJBdiov[qCUsRNgq]) % 256]
        local unmasked = bit32.bxor(jvXwvBHt, KJfXtaFT)
        table.insert(NAVlwicD, string.char(bit32.bxor(unmasked, CbntazPC)))
    end
    return table.concat(NAVlwicD)
end

local JaJBdiov_flat = {}
for _, chunk in ipairs(mlbXLIRS) do
    for _, byte in ipairs(chunk) do
        table.insert(JaJBdiov_flat, byte)
    end
end

local decrypted = KMHdCcCC(JaJBdiov_flat, bSmnlzIY)
local vemmvpma, ujcsTjyO = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JaJBdiov_flat)
JaJBdiov_flat = nil

if vemmvpma then 
    local result = vemmvpma() 
    decrypted = nil
    vemmvpma = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(ujcsTjyO)) 
end
