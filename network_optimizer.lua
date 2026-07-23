-- Protected Segment (network_optimizer)
local HXSEkrXT = 112
local gAqKZFEQ = {
{121,66,32,84,232,171,54,35,123,133,193,194,158,0,245,187,89,169,128,212,21,86,238,233,39,151,7,19,226,133,224,136,175,153,129,185,35,58,99,64,216,253,209,98,32,194,92,46,175,106,21,118,94,87,221,62,127,51,92,62},{167,218,240,46,243,196,199,172,95,158,168,197,68,71,181,83,218,79,217,227,163,19,5,205,148,126,61,7,35,77,237,167,209,110,196,229,6,154,126,91,115,202,130,166,238,58,138,85,20,170,110,64,91,126,164,119,50,73,224,160},{121,159,152,63,92,193,148,43,212,152,70,216,20,101,195,204,200,162,169,85,212,240,71,22,224,127,166,157,165}
}
local jEUzxXAj = "cghuPsOFNesabCGk"

local function nZgQxmlS(EfjhNHAQ_data, EfjhNHAQ_key)
    if type(EfjhNHAQ_key) ~= "string" or #EfjhNHAQ_key == 0 then return "" end
    local EfjhNHAQ = {}
    for OvNgeSQd = 0, 255 do EfjhNHAQ[OvNgeSQd] = OvNgeSQd end
    local OhjXqjtD = 0
    for OvNgeSQd = 0, 255 do
        local xloiTefq = EfjhNHAQ_key:byte((OvNgeSQd % #EfjhNHAQ_key) + 1)
        OhjXqjtD = (OhjXqjtD + EfjhNHAQ[OvNgeSQd] + xloiTefq) % 256
        EfjhNHAQ[OvNgeSQd], EfjhNHAQ[OhjXqjtD] = EfjhNHAQ[OhjXqjtD], EfjhNHAQ[OvNgeSQd]
    end
    local OvNgeSQd = 0
    local OhjXqjtD = 0
    local LWgmjEub = {}
    for _, RInYOjVJ in ipairs(EfjhNHAQ_data) do
        OvNgeSQd = (OvNgeSQd + 1) % 256
        OhjXqjtD = (OhjXqjtD + EfjhNHAQ[OvNgeSQd]) % 256
        EfjhNHAQ[OvNgeSQd], EfjhNHAQ[OhjXqjtD] = EfjhNHAQ[OhjXqjtD], EfjhNHAQ[OvNgeSQd]
        local xloiTefq = EfjhNHAQ[(EfjhNHAQ[OvNgeSQd] + EfjhNHAQ[OhjXqjtD]) % 256]
        local unmasked = bit32.bxor(RInYOjVJ, HXSEkrXT)
        table.insert(LWgmjEub, string.char(bit32.bxor(unmasked, xloiTefq)))
    end
    return table.concat(LWgmjEub)
end

local EfjhNHAQ_flat = {}
for _, chunk in ipairs(gAqKZFEQ) do
    for _, byte in ipairs(chunk) do
        table.insert(EfjhNHAQ_flat, byte)
    end
end

local decrypted = nZgQxmlS(EfjhNHAQ_flat, jEUzxXAj)
local gKkeiZzT, KJcqESTI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EfjhNHAQ_flat)
EfjhNHAQ_flat = nil

if gKkeiZzT then 
    local result = gKkeiZzT() 
    decrypted = nil
    gKkeiZzT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(KJcqESTI)) 
end
