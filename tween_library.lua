-- Protected Segment (tween_library)
local USWYaOMo = 152
local zmVhXDUb = {
{102,193,68,107,104,205,77,214,7,76,254,238,99,57,155,96,35,233,190,40,174,205,188,197,214,206,94,123,162,214,74,194,86,237,200,187,71,145,0,30,48,28,200,252,145,185,137,64,203,255,216,89,121,193,191,35,165,15,211,54},{210,101,229,25,53,111,178,250,35,130,3,191,125,157,175,237,73,68,29,184,238,162,246,196,119,142,181,55,72,198,128,140,101,39,67,211,171,169,87,143,53,233,137,55,47,183,57,250,228,97,0,66,232,140,155,216,78,101,98,103},{94,55,129,177,169,236,224,59,217,187,155,33,95,93,165,121,120,32,180,185,108,241,31,45,149}
}
local klkSEyQH = "VNwOVGIBejjhtckX"

local function rnZoQeKV(yFZsReBK_data, yFZsReBK_key)
    if type(yFZsReBK_key) ~= "string" or #yFZsReBK_key == 0 then return "" end
    local yFZsReBK = {}
    for YcmJMfed = 0, 255 do yFZsReBK[YcmJMfed] = YcmJMfed end
    local pBAYiHfU = 0
    for YcmJMfed = 0, 255 do
        local UDvWqIAw = yFZsReBK_key:byte((YcmJMfed % #yFZsReBK_key) + 1)
        pBAYiHfU = (pBAYiHfU + yFZsReBK[YcmJMfed] + UDvWqIAw) % 256
        yFZsReBK[YcmJMfed], yFZsReBK[pBAYiHfU] = yFZsReBK[pBAYiHfU], yFZsReBK[YcmJMfed]
    end
    local YcmJMfed = 0
    local pBAYiHfU = 0
    local UjcuCrel = {}
    for _, uHxnfTGb in ipairs(yFZsReBK_data) do
        YcmJMfed = (YcmJMfed + 1) % 256
        pBAYiHfU = (pBAYiHfU + yFZsReBK[YcmJMfed]) % 256
        yFZsReBK[YcmJMfed], yFZsReBK[pBAYiHfU] = yFZsReBK[pBAYiHfU], yFZsReBK[YcmJMfed]
        local UDvWqIAw = yFZsReBK[(yFZsReBK[YcmJMfed] + yFZsReBK[pBAYiHfU]) % 256]
        local unmasked = bit32.bxor(uHxnfTGb, USWYaOMo)
        table.insert(UjcuCrel, string.char(bit32.bxor(unmasked, UDvWqIAw)))
    end
    return table.concat(UjcuCrel)
end

local yFZsReBK_flat = {}
for _, chunk in ipairs(zmVhXDUb) do
    for _, byte in ipairs(chunk) do
        table.insert(yFZsReBK_flat, byte)
    end
end

local decrypted = rnZoQeKV(yFZsReBK_flat, klkSEyQH)
local xpnxIpSx, dnAqJDLo = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yFZsReBK_flat)
yFZsReBK_flat = nil

if xpnxIpSx then 
    local result = xpnxIpSx() 
    decrypted = nil
    xpnxIpSx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(dnAqJDLo)) 
end
