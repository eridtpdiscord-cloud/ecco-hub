-- Protected Segment (ui_themes)
local kHKyiDuA = 15
local Krvsecrn = {
{66,233,39,104,198,9,29,160,210,164,228,85,192,116,250,0,212,74,130,53,59,117,72,230,185,207,17,100,15,172,94,234,204,235,27,174,126,67,189,191,221,214,13,13,205,17,89,206,114,149,187,96,118,51,95,3,243,105,210,35},{248,162,164,97,96,126,188,129,111,10,60,65,252,249,55,50,218,42,79,122,11,82,249,0,65,232,3,217,47,5,99,94,10,151,224,228,103,6,132,93,24,251,71,229,53,145,93,157,21,253,78,40,127,80,41,100,116,184,157,249},{58,84,117,153,205,18,79,14,18,94,190,125,66,0,243,106,77,42,183,97,24}
}
local VaISVENe = "NfyIIplejzEHXiTf"

local function tVRNUtMj(mSmZMoQh_data, mSmZMoQh_key)
    if type(mSmZMoQh_key) ~= "string" or #mSmZMoQh_key == 0 then return "" end
    local mSmZMoQh = {}
    for CfqDCGmv = 0, 255 do mSmZMoQh[CfqDCGmv] = CfqDCGmv end
    local EWEXbDbg = 0
    for CfqDCGmv = 0, 255 do
        local tyvIbUGy = mSmZMoQh_key:byte((CfqDCGmv % #mSmZMoQh_key) + 1)
        EWEXbDbg = (EWEXbDbg + mSmZMoQh[CfqDCGmv] + tyvIbUGy) % 256
        mSmZMoQh[CfqDCGmv], mSmZMoQh[EWEXbDbg] = mSmZMoQh[EWEXbDbg], mSmZMoQh[CfqDCGmv]
    end
    local CfqDCGmv = 0
    local EWEXbDbg = 0
    local XfBmHitX = {}
    for _, qyEQLmrE in ipairs(mSmZMoQh_data) do
        CfqDCGmv = (CfqDCGmv + 1) % 256
        EWEXbDbg = (EWEXbDbg + mSmZMoQh[CfqDCGmv]) % 256
        mSmZMoQh[CfqDCGmv], mSmZMoQh[EWEXbDbg] = mSmZMoQh[EWEXbDbg], mSmZMoQh[CfqDCGmv]
        local tyvIbUGy = mSmZMoQh[(mSmZMoQh[CfqDCGmv] + mSmZMoQh[EWEXbDbg]) % 256]
        local unmasked = bit32.bxor(qyEQLmrE, kHKyiDuA)
        table.insert(XfBmHitX, string.char(bit32.bxor(unmasked, tyvIbUGy)))
    end
    return table.concat(XfBmHitX)
end

local mSmZMoQh_flat = {}
for _, chunk in ipairs(Krvsecrn) do
    for _, byte in ipairs(chunk) do
        table.insert(mSmZMoQh_flat, byte)
    end
end

local decrypted = tVRNUtMj(mSmZMoQh_flat, VaISVENe)
local Qovptacy, WSKSDnBb = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mSmZMoQh_flat)
mSmZMoQh_flat = nil

if Qovptacy then 
    local result = Qovptacy() 
    decrypted = nil
    Qovptacy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(WSKSDnBb)) 
end
