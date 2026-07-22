-- Protected Segment (utility_helper)
local eyMGUJMK = 142
local JgqLkEKy = {
{246,97,4,123,122,220,137,152,183,202,242,179,215,210,189,21,174,131,130,206,37,90,208,176,224,32,234,71,160,164,191,203,98,29,177,161,93,6,151,1,23,255,33,96,211,160,83,123,107,236,53,244,214,34,217,162,196,215,45,55},{229,180,149,110,175,135,227,134,215,77,132,200,65,90,166,57,141,160,50,56,146,244,166,213,7,85,26,88,36,102,12,30,66,218,41,53,79,238,209,152,215,38,156,143,216,43,88,58,165,255,146,240,29,17,200,27,30,117,248,107},{224,185,185,106,186,1,88,22,214,39,162,199,79,22,12,104,229,193,231,77,158,68,235,107,30,89}
}
local uvQLvEYE = "ZvOJmXWSAcuGZVvM"

local function HzzHplTJ(anUdVFWJ_data, anUdVFWJ_key)
    local anUdVFWJ = {}
    for QUmSqXIP = 0, 255 do anUdVFWJ[QUmSqXIP] = QUmSqXIP end
    local PfbckDSE = 0
    for QUmSqXIP = 0, 255 do
        local MrHpKrfK = anUdVFWJ_key:byte((QUmSqXIP % #anUdVFWJ_key) + 1)
        PfbckDSE = (PfbckDSE + anUdVFWJ[QUmSqXIP] + MrHpKrfK) % 256
        anUdVFWJ[QUmSqXIP], anUdVFWJ[PfbckDSE] = anUdVFWJ[PfbckDSE], anUdVFWJ[QUmSqXIP]
    end
    local QUmSqXIP = 0
    local PfbckDSE = 0
    local pQddwSAi = {}
    for _, SuBzvptI in ipairs(anUdVFWJ_data) do
        QUmSqXIP = (QUmSqXIP + 1) % 256
        PfbckDSE = (PfbckDSE + anUdVFWJ[QUmSqXIP]) % 256
        anUdVFWJ[QUmSqXIP], anUdVFWJ[PfbckDSE] = anUdVFWJ[PfbckDSE], anUdVFWJ[QUmSqXIP]
        local MrHpKrfK = anUdVFWJ[(anUdVFWJ[QUmSqXIP] + anUdVFWJ[PfbckDSE]) % 256]
        local unmasked = bit32.bxor(SuBzvptI, eyMGUJMK)
        table.insert(pQddwSAi, string.char(bit32.bxor(unmasked, MrHpKrfK)))
    end
    return table.concat(pQddwSAi)
end

local anUdVFWJ_flat = {}
for _, chunk in ipairs(JgqLkEKy) do
    for _, byte in ipairs(chunk) do
        table.insert(anUdVFWJ_flat, byte)
    end
end

local decrypted = HzzHplTJ(anUdVFWJ_flat, uvQLvEYE)
local uLyfesRG, DXIXSovr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(anUdVFWJ_flat)
anUdVFWJ_flat = nil

if uLyfesRG then 
    local result = uLyfesRG() 
    decrypted = nil
    uLyfesRG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(DXIXSovr)) 
end
