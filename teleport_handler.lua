-- Protected Segment (teleport_handler)
local jIfIytBj = 54
local pGfIvxAW = {
{132,20,40,81,6,221,79,17,195,158,181,84,237,203,67,0,139,53,67,164,137,56,173,170,204,175,167,57,64,231,64,138,107,176,18,215,53,83,166,201,171,177,77,229,248,50,164,202,163,88,153,140,187,58,4,222,247,90,241,103},{34,96,164,76,216,180,179,131,214,101,245,172,2,121,206,123,139,133,13,68,228,154,255,206,61,145,109,30,93,225,66,85,188,80,232,11,9,160,173,247,239,199,118,120,83,127,148,222,3,105,164,16,171,231,220,89,224,246,215,16},{214,66,157,116,43,120,180,38,145,144,140,48,70,197,112,18,212,247,103,105,13,91,21,16,42,141,115,108}
}
local CkkHAMCR = "lEhVpdfshTvHAAdX"

local function ZkadtSXP(NKuWjEOa_data, NKuWjEOa_key)
    if type(NKuWjEOa_key) ~= "string" or #NKuWjEOa_key == 0 then return "" end
    local NKuWjEOa = {}
    for VWYXaeAq = 0, 255 do NKuWjEOa[VWYXaeAq] = VWYXaeAq end
    local MQTnROVp = 0
    for VWYXaeAq = 0, 255 do
        local aLAWreXT = NKuWjEOa_key:byte((VWYXaeAq % #NKuWjEOa_key) + 1)
        MQTnROVp = (MQTnROVp + NKuWjEOa[VWYXaeAq] + aLAWreXT) % 256
        NKuWjEOa[VWYXaeAq], NKuWjEOa[MQTnROVp] = NKuWjEOa[MQTnROVp], NKuWjEOa[VWYXaeAq]
    end
    local VWYXaeAq = 0
    local MQTnROVp = 0
    local jRNdabaM = {}
    for _, McXhQeOa in ipairs(NKuWjEOa_data) do
        VWYXaeAq = (VWYXaeAq + 1) % 256
        MQTnROVp = (MQTnROVp + NKuWjEOa[VWYXaeAq]) % 256
        NKuWjEOa[VWYXaeAq], NKuWjEOa[MQTnROVp] = NKuWjEOa[MQTnROVp], NKuWjEOa[VWYXaeAq]
        local aLAWreXT = NKuWjEOa[(NKuWjEOa[VWYXaeAq] + NKuWjEOa[MQTnROVp]) % 256]
        local unmasked = bit32.bxor(McXhQeOa, jIfIytBj)
        table.insert(jRNdabaM, string.char(bit32.bxor(unmasked, aLAWreXT)))
    end
    return table.concat(jRNdabaM)
end

local NKuWjEOa_flat = {}
for _, chunk in ipairs(pGfIvxAW) do
    for _, byte in ipairs(chunk) do
        table.insert(NKuWjEOa_flat, byte)
    end
end

local decrypted = ZkadtSXP(NKuWjEOa_flat, CkkHAMCR)
local wuDrszdR, HKaCqtwd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NKuWjEOa_flat)
NKuWjEOa_flat = nil

if wuDrszdR then 
    local result = wuDrszdR() 
    decrypted = nil
    wuDrszdR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(HKaCqtwd)) 
end
