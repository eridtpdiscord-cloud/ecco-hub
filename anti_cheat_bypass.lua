-- Protected Segment (anti_cheat_bypass)
local BLgRlqqO = 5
local NzudhNKo = {
{185,141,66,130,44,99,100,167,172,78,137,108,91,235,229,48,144,195,221,218,51,83,5,167,60,67,203,25,231,65,179,165,63,234,12,53,121,148,151,87,84,10,62,250,4,219,164,246,41,99,206,108,216,251,117,240,47,73,56,53},{210,4,32,161,236,76,230,84,212,16,166,171,90,5,222,171,168,230,12,228,104,37,209,3,146,173,21,168,108,100,19,178,235,130,10,220,59,186,192,245,230,170,173,149,21,72,123,95,134,13,137,98,178,147,148,202,75,6,15,166},{35,158,212,35,106,111,115,25,215,154,231,141,29,157,97,54,95,237,138,223,236,98,69,19,179,194,4,156,223}
}
local HMewrxXo = "xlEVrcmoHTBObiZW"

local function HADFgFRN(yuqJhHLP_data, yuqJhHLP_key)
    if type(yuqJhHLP_key) ~= "string" or #yuqJhHLP_key == 0 then return "" end
    local yuqJhHLP = {}
    for mtOQIQYZ = 0, 255 do yuqJhHLP[mtOQIQYZ] = mtOQIQYZ end
    local HGMisvXJ = 0
    for mtOQIQYZ = 0, 255 do
        local AYxEDRBw = yuqJhHLP_key:byte((mtOQIQYZ % #yuqJhHLP_key) + 1)
        HGMisvXJ = (HGMisvXJ + yuqJhHLP[mtOQIQYZ] + AYxEDRBw) % 256
        yuqJhHLP[mtOQIQYZ], yuqJhHLP[HGMisvXJ] = yuqJhHLP[HGMisvXJ], yuqJhHLP[mtOQIQYZ]
    end
    local mtOQIQYZ = 0
    local HGMisvXJ = 0
    local ZRfOrYhb = {}
    for _, eWrnyrPq in ipairs(yuqJhHLP_data) do
        mtOQIQYZ = (mtOQIQYZ + 1) % 256
        HGMisvXJ = (HGMisvXJ + yuqJhHLP[mtOQIQYZ]) % 256
        yuqJhHLP[mtOQIQYZ], yuqJhHLP[HGMisvXJ] = yuqJhHLP[HGMisvXJ], yuqJhHLP[mtOQIQYZ]
        local AYxEDRBw = yuqJhHLP[(yuqJhHLP[mtOQIQYZ] + yuqJhHLP[HGMisvXJ]) % 256]
        local unmasked = bit32.bxor(eWrnyrPq, BLgRlqqO)
        table.insert(ZRfOrYhb, string.char(bit32.bxor(unmasked, AYxEDRBw)))
    end
    return table.concat(ZRfOrYhb)
end

local yuqJhHLP_flat = {}
for _, chunk in ipairs(NzudhNKo) do
    for _, byte in ipairs(chunk) do
        table.insert(yuqJhHLP_flat, byte)
    end
end

local decrypted = HADFgFRN(yuqJhHLP_flat, HMewrxXo)
local ciQZayHD, cBvRerTs = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yuqJhHLP_flat)
yuqJhHLP_flat = nil

if ciQZayHD then 
    local result = ciQZayHD() 
    decrypted = nil
    ciQZayHD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(cBvRerTs)) 
end
