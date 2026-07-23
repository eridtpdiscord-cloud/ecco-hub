-- Protected Segment (network_optimizer)
local nAGjqWoX = 202
local emJRuhdt = {
{158,24,76,102,247,7,236,103,240,38,173,158,156,175,41,220,199,235,198,176,242,29,184,116,249,205,128,129,192,112,192,149,4,146,162,123,188,0,81,52,93,223,49,122,106,156,193,233,133,219,184,192,171,136,28,51,246,95,36,54},{163,81,112,132,226,51,209,23,186,72,142,33,221,8,124,246,164,209,71,141,243,126,74,223,179,109,219,242,60,62,157,82,61,90,152,32,131,42,175,118,96,55,194,169,239,171,234,69,182,66,89,241,129,144,76,89,254,142,87,108},{91,129,191,168,13,150,248,253,211,67,152,99,181,126,187,192,72,194,216,110,189,190,86,6,251,26,132,137,214}
}
local FmxWpQfb = "pkmgDxLMqAtwgcio"

local function DtBizXZF(dlyTShXU_data, dlyTShXU_key)
    if type(dlyTShXU_key) ~= "string" or #dlyTShXU_key == 0 then return "" end
    local dlyTShXU = {}
    for jaucenWy = 0, 255 do dlyTShXU[jaucenWy] = jaucenWy end
    local FiPRdkqK = 0
    for jaucenWy = 0, 255 do
        local HvOMiNNP = dlyTShXU_key:byte((jaucenWy % #dlyTShXU_key) + 1)
        FiPRdkqK = (FiPRdkqK + dlyTShXU[jaucenWy] + HvOMiNNP) % 256
        dlyTShXU[jaucenWy], dlyTShXU[FiPRdkqK] = dlyTShXU[FiPRdkqK], dlyTShXU[jaucenWy]
    end
    local jaucenWy = 0
    local FiPRdkqK = 0
    local tIrhTeMA = {}
    for _, aIDxUAjM in ipairs(dlyTShXU_data) do
        jaucenWy = (jaucenWy + 1) % 256
        FiPRdkqK = (FiPRdkqK + dlyTShXU[jaucenWy]) % 256
        dlyTShXU[jaucenWy], dlyTShXU[FiPRdkqK] = dlyTShXU[FiPRdkqK], dlyTShXU[jaucenWy]
        local HvOMiNNP = dlyTShXU[(dlyTShXU[jaucenWy] + dlyTShXU[FiPRdkqK]) % 256]
        local unmasked = bit32.bxor(aIDxUAjM, nAGjqWoX)
        table.insert(tIrhTeMA, string.char(bit32.bxor(unmasked, HvOMiNNP)))
    end
    return table.concat(tIrhTeMA)
end

local dlyTShXU_flat = {}
for _, chunk in ipairs(emJRuhdt) do
    for _, byte in ipairs(chunk) do
        table.insert(dlyTShXU_flat, byte)
    end
end

local decrypted = DtBizXZF(dlyTShXU_flat, FmxWpQfb)
local EtVVehGF, fGoaSRTR = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dlyTShXU_flat)
dlyTShXU_flat = nil

if EtVVehGF then 
    local result = EtVVehGF() 
    decrypted = nil
    EtVVehGF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(fGoaSRTR)) 
end
