-- Protected Segment (network_optimizer)
local WZZpmlpk = 50
local lIEiPWrp = {
{192,86,104,45,32,156,47,155,34,154,30,124,201,213,203,32,212,58,165,195,85,228,173,143,108,122,83,118,23,140,167,93,192,162,13,21,100,172,48,233,186,137,26,35,55,38,10,92,151,203,178,136,198,88,26,99,18,239,59,43},{212,178,184,55,145,34,26,22,11,97,108,131,47,145,52,26,90,255,91,216,152,50,4,195,142,26,128,131,40,187,250,105,119,93,128,205,229,254,78,129,132,59,157,161,243,66,200,90,208,57,178,248,51,35,210,203,180,192,193,156},{63,143,136,30,22,185,221,186,73,129,31,137,123,86,249,225,88,144,127,95,56,139,61,122,62,207,190,130,75}
}
local IWmEqove = "JmQrBvWVXmaPKMee"

local function AHbwGyuS(HuwmFsRf_data, HuwmFsRf_key)
    local HuwmFsRf = {}
    for LxRzxUmT = 0, 255 do HuwmFsRf[LxRzxUmT] = LxRzxUmT end
    local AEDlxbYX = 0
    for LxRzxUmT = 0, 255 do
        local fXacIRIT = HuwmFsRf_key:byte((LxRzxUmT % #HuwmFsRf_key) + 1)
        AEDlxbYX = (AEDlxbYX + HuwmFsRf[LxRzxUmT] + fXacIRIT) % 256
        HuwmFsRf[LxRzxUmT], HuwmFsRf[AEDlxbYX] = HuwmFsRf[AEDlxbYX], HuwmFsRf[LxRzxUmT]
    end
    local LxRzxUmT = 0
    local AEDlxbYX = 0
    local lFcavPSM = {}
    for _, RAyXQmDs in ipairs(HuwmFsRf_data) do
        LxRzxUmT = (LxRzxUmT + 1) % 256
        AEDlxbYX = (AEDlxbYX + HuwmFsRf[LxRzxUmT]) % 256
        HuwmFsRf[LxRzxUmT], HuwmFsRf[AEDlxbYX] = HuwmFsRf[AEDlxbYX], HuwmFsRf[LxRzxUmT]
        local fXacIRIT = HuwmFsRf[(HuwmFsRf[LxRzxUmT] + HuwmFsRf[AEDlxbYX]) % 256]
        local unmasked = bit32.bxor(RAyXQmDs, WZZpmlpk)
        table.insert(lFcavPSM, string.char(bit32.bxor(unmasked, fXacIRIT)))
    end
    return table.concat(lFcavPSM)
end

local HuwmFsRf_flat = {}
for _, chunk in ipairs(lIEiPWrp) do
    for _, byte in ipairs(chunk) do
        table.insert(HuwmFsRf_flat, byte)
    end
end

local decrypted = AHbwGyuS(HuwmFsRf_flat, IWmEqove)
local elyVUGvD, ZJrFXxYf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HuwmFsRf_flat)
HuwmFsRf_flat = nil

if elyVUGvD then 
    local result = elyVUGvD() 
    decrypted = nil
    elyVUGvD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(ZJrFXxYf)) 
end
