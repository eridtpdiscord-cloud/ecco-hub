-- Protected Segment (cache_invalidation)
local YpHroInu = 66
local QHeqZukq = {
{9,31,146,230,121,194,139,41,120,37,157,85,32,177,33,103,175,53,2,254,237,182,125,89,89,21,155,89,115,109,109,107,114,149,30,26,225,239,136,106,227,123,133,167,159,8,118,63,40,187,234,46,242,190,100,59,202,100,85,175},{254,170,248,85,57,166,202,56,49,117,115,69,74,33,139,6,224,222,122,210,68,211,46,110,116,245,236,235,90,83,95,213,64,237,190,252,29,112,250,56,174,246,29,51,78,22,31,12,229,97,70,74,223,213,85,30,172,138,107,97},{179,80,218,189,112,71,67,252,31,151,153,189,196,174,165,64,104,246,32,119,163,108,26,60,178,170,155,191,200,57}
}
local XHVfldAs = "dSEHHqqFilyeFEMW"

local function TteIKpfR(lIhrZxqv_data, lIhrZxqv_key)
    if type(lIhrZxqv_key) ~= "string" or #lIhrZxqv_key == 0 then return "" end
    local lIhrZxqv = {}
    for AZriLVVm = 0, 255 do lIhrZxqv[AZriLVVm] = AZriLVVm end
    local onDEZmYl = 0
    for AZriLVVm = 0, 255 do
        local EUADKFXp = lIhrZxqv_key:byte((AZriLVVm % #lIhrZxqv_key) + 1)
        onDEZmYl = (onDEZmYl + lIhrZxqv[AZriLVVm] + EUADKFXp) % 256
        lIhrZxqv[AZriLVVm], lIhrZxqv[onDEZmYl] = lIhrZxqv[onDEZmYl], lIhrZxqv[AZriLVVm]
    end
    local AZriLVVm = 0
    local onDEZmYl = 0
    local kEUfnAHP = {}
    for _, FskuTSQn in ipairs(lIhrZxqv_data) do
        AZriLVVm = (AZriLVVm + 1) % 256
        onDEZmYl = (onDEZmYl + lIhrZxqv[AZriLVVm]) % 256
        lIhrZxqv[AZriLVVm], lIhrZxqv[onDEZmYl] = lIhrZxqv[onDEZmYl], lIhrZxqv[AZriLVVm]
        local EUADKFXp = lIhrZxqv[(lIhrZxqv[AZriLVVm] + lIhrZxqv[onDEZmYl]) % 256]
        local unmasked = bit32.bxor(FskuTSQn, YpHroInu)
        table.insert(kEUfnAHP, string.char(bit32.bxor(unmasked, EUADKFXp)))
    end
    return table.concat(kEUfnAHP)
end

local lIhrZxqv_flat = {}
for _, chunk in ipairs(QHeqZukq) do
    for _, byte in ipairs(chunk) do
        table.insert(lIhrZxqv_flat, byte)
    end
end

local decrypted = TteIKpfR(lIhrZxqv_flat, XHVfldAs)
local BxojARNh, JMfjvxyE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(lIhrZxqv_flat)
lIhrZxqv_flat = nil

if BxojARNh then 
    local result = BxojARNh() 
    decrypted = nil
    BxojARNh = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(JMfjvxyE)) 
end
