-- Protected Segment (math_vector_utils)
local SBYzDXij = 76
local udEpBTQb = {
{251,242,84,232,57,190,139,32,235,138,60,55,54,124,51,192,226,182,107,117,241,110,233,84,109,164,36,165,24,24,117,203,230,82,161,205,173,143,203,42,64,199,192,101,54,61,188,94,196,35,74,36,104,177,183,175,88,233,107,134},{84,38,186,130,12,55,194,115,110,156,52,36,38,145,84,220,158,238,70,184,49,18,1,18,26,195,189,112,136,146,75,160,22,191,147,220,88,222,74,74,97,135,17,143,91,169,201,143,205,74,252,250,16,188,91,148,84,76,99,178},{252,112,63,114,64,172,192,213,212,117,147,4,75,223,198,239,225,216,194,244,104,118,227,203,175,230,63,4,85}
}
local yNRPzFsC = "qWKLMfyXLpMZnpBR"

local function wCIuIwSO(QjxVUVMK_data, QjxVUVMK_key)
    if type(QjxVUVMK_key) ~= "string" or #QjxVUVMK_key == 0 then return "" end
    local QjxVUVMK = {}
    for uiwpDSqu = 0, 255 do QjxVUVMK[uiwpDSqu] = uiwpDSqu end
    local FWubCbAU = 0
    for uiwpDSqu = 0, 255 do
        local rcVvHUoI = QjxVUVMK_key:byte((uiwpDSqu % #QjxVUVMK_key) + 1)
        FWubCbAU = (FWubCbAU + QjxVUVMK[uiwpDSqu] + rcVvHUoI) % 256
        QjxVUVMK[uiwpDSqu], QjxVUVMK[FWubCbAU] = QjxVUVMK[FWubCbAU], QjxVUVMK[uiwpDSqu]
    end
    local uiwpDSqu = 0
    local FWubCbAU = 0
    local FZmMAASN = {}
    for _, VhOfQtWE in ipairs(QjxVUVMK_data) do
        uiwpDSqu = (uiwpDSqu + 1) % 256
        FWubCbAU = (FWubCbAU + QjxVUVMK[uiwpDSqu]) % 256
        QjxVUVMK[uiwpDSqu], QjxVUVMK[FWubCbAU] = QjxVUVMK[FWubCbAU], QjxVUVMK[uiwpDSqu]
        local rcVvHUoI = QjxVUVMK[(QjxVUVMK[uiwpDSqu] + QjxVUVMK[FWubCbAU]) % 256]
        local unmasked = bit32.bxor(VhOfQtWE, SBYzDXij)
        table.insert(FZmMAASN, string.char(bit32.bxor(unmasked, rcVvHUoI)))
    end
    return table.concat(FZmMAASN)
end

local QjxVUVMK_flat = {}
for _, chunk in ipairs(udEpBTQb) do
    for _, byte in ipairs(chunk) do
        table.insert(QjxVUVMK_flat, byte)
    end
end

local decrypted = wCIuIwSO(QjxVUVMK_flat, yNRPzFsC)
local qgrNDCzO, MihTSsIn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QjxVUVMK_flat)
QjxVUVMK_flat = nil

if qgrNDCzO then 
    local result = qgrNDCzO() 
    decrypted = nil
    qgrNDCzO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(MihTSsIn)) 
end
