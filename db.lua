-- Protected Segment (db)
local bXOMcGan = 179
local ffJYBzmH = {
{106,133,47,74,132,209,169,143,191,218,65,188,132,165,173,151,63,55,226,132,5,133,89,107,126,158,159,173,130,204,178,110,129,123,109,142,31,172,106,117,44,0,59,90,208,59,156,99,65,16,235,203,11,226,107,235,125,79,42,80},{23,193,172,101,28,162,158,141,90,7,255,158,252,97,53,198,144,96,51,6,205,49,70,37,141,216,155,136,41,142,216,162,14,109,226,137,101,20,84,142,26,61,153,83,26,69,16,62,130,221,60,105,168,96,58,105,216,76,128,189},{254,223,185,204,131,52,141,2,69,5,90,65,25,177,34,144,66,141,169,187,96,197,27,176,85,190,10,111,85,144,80,224,253,89,59,118,121,210,128,117,78,56,19,199,202,85,176,192,226,17,49,76,14,149,202,46,233,160,193,83},{137,249,225,98,91,242,96,73,26,90,57,124,241,200,12,199,103,252,196,35,125,23,211,99,143,62,32,159,230,183,84,27,23,186,246,97,155,130,184,143,71,20,180,127,91,41,213,194,199,121,118,29,249,67,105,145,189,248,236,117},{207,153,100,166,195,4,236,194,196,14,41,250,114,80,211,141,235,110,86,151,51,193,169,44,117,207,63,176,213,120,163,66,110,251,146,165,35,197,86,29,122,253,188,89,199,228,4,115,12,243,18,92,28,130,88,51,40,61,51,102},{69,26,30,79,204,157,87,207,38,166,21,243,123,119,74,176,121,31,26,240,235,169,94,231,166,155,156,98,119,255,0,128,149,29,34,246,24,79,169,14,180,191,73,234,159,106,120,149,25,144,199,154,100,75,5,226,62,4,52,73},{141,239,50,33,3,154,66,85,211,211,134,36,190,10,114,139,95,25,224,248,52,160,57,38,188,181,161,202,145,237,168,176,238,196,178,63,190,82,150,125,209,166,51,118,30,47,70,135,85,52,169,57,111,185,65,162,197,128,150,143},{227,181,169,96,16,96,217,24,176,89,251,23,237,117,151,192,123,152,219,229,75,199,1,7,210,222,171,63,154,14,130,246,67,97,96,79,130,15,189,4,70,28,7,88,98,247,61,186,33,230,147,202,217,12,158,156,84,115,211}
}
local yjcEvlVo = "JSYxcOIZUOssxdvF"

local function TxpTIVQW(hNWCwtLN_data, hNWCwtLN_key)
    if type(hNWCwtLN_key) ~= "string" or #hNWCwtLN_key == 0 then return "" end
    local hNWCwtLN = {}
    for VPfikqRm = 0, 255 do hNWCwtLN[VPfikqRm] = VPfikqRm end
    local jbTibfKS = 0
    for VPfikqRm = 0, 255 do
        local joqoGaKd = hNWCwtLN_key:byte((VPfikqRm % #hNWCwtLN_key) + 1)
        jbTibfKS = (jbTibfKS + hNWCwtLN[VPfikqRm] + joqoGaKd) % 256
        hNWCwtLN[VPfikqRm], hNWCwtLN[jbTibfKS] = hNWCwtLN[jbTibfKS], hNWCwtLN[VPfikqRm]
    end
    local VPfikqRm = 0
    local jbTibfKS = 0
    local EGDEqjZL = {}
    for _, XcjzZDVr in ipairs(hNWCwtLN_data) do
        VPfikqRm = (VPfikqRm + 1) % 256
        jbTibfKS = (jbTibfKS + hNWCwtLN[VPfikqRm]) % 256
        hNWCwtLN[VPfikqRm], hNWCwtLN[jbTibfKS] = hNWCwtLN[jbTibfKS], hNWCwtLN[VPfikqRm]
        local joqoGaKd = hNWCwtLN[(hNWCwtLN[VPfikqRm] + hNWCwtLN[jbTibfKS]) % 256]
        local unmasked = bit32.bxor(XcjzZDVr, bXOMcGan)
        table.insert(EGDEqjZL, string.char(bit32.bxor(unmasked, joqoGaKd)))
    end
    return table.concat(EGDEqjZL)
end

local hNWCwtLN_flat = {}
for _, chunk in ipairs(ffJYBzmH) do
    for _, byte in ipairs(chunk) do
        table.insert(hNWCwtLN_flat, byte)
    end
end

local decrypted = TxpTIVQW(hNWCwtLN_flat, yjcEvlVo)
local xilVtzsN, EvJYrbuY = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(hNWCwtLN_flat)
hNWCwtLN_flat = nil

if xilVtzsN then 
    local result = xilVtzsN() 
    decrypted = nil
    xilVtzsN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(EvJYrbuY)) 
end
