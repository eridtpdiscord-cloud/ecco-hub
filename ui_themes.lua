-- Protected Segment (ui_themes)
local YhFiQdhJ = 42
local YrGjilEg = {
{148,74,212,203,129,23,240,129,111,117,126,188,191,5,235,47,114,234,92,4,167,242,93,88,78,203,34,232,43,33,36,209,159,248,72,12,167,162,249,189,70,226,160,155,205,75,79,234,32,213,216,166,162,194,85,86,181,46,133,221},{22,198,222,131,250,23,236,174,186,206,34,155,3,239,233,183,185,10,171,237,130,98,66,146,178,18,144,128,232,20,108,24,183,160,82,82,142,142,210,16,36,218,80,98,47,116,212,181,236,105,108,195,208,164,28,143,98,79,50,5},{72,194,246,239,196,134,15,248,11,250,180,251,46,119,131,245,205,59,210,89,58}
}
local HqexMyPb = "sxyxCLVxijRimJrz"

local function UloPxFVj(PHZpkiCr_data, PHZpkiCr_key)
    if type(PHZpkiCr_key) ~= "string" or #PHZpkiCr_key == 0 then return "" end
    local PHZpkiCr = {}
    for uCQbgjHD = 0, 255 do PHZpkiCr[uCQbgjHD] = uCQbgjHD end
    local UitCDczX = 0
    for uCQbgjHD = 0, 255 do
        local QRDwnkwD = PHZpkiCr_key:byte((uCQbgjHD % #PHZpkiCr_key) + 1)
        UitCDczX = (UitCDczX + PHZpkiCr[uCQbgjHD] + QRDwnkwD) % 256
        PHZpkiCr[uCQbgjHD], PHZpkiCr[UitCDczX] = PHZpkiCr[UitCDczX], PHZpkiCr[uCQbgjHD]
    end
    local uCQbgjHD = 0
    local UitCDczX = 0
    local ODwcybuA = {}
    for _, ivpGqkyp in ipairs(PHZpkiCr_data) do
        uCQbgjHD = (uCQbgjHD + 1) % 256
        UitCDczX = (UitCDczX + PHZpkiCr[uCQbgjHD]) % 256
        PHZpkiCr[uCQbgjHD], PHZpkiCr[UitCDczX] = PHZpkiCr[UitCDczX], PHZpkiCr[uCQbgjHD]
        local QRDwnkwD = PHZpkiCr[(PHZpkiCr[uCQbgjHD] + PHZpkiCr[UitCDczX]) % 256]
        local unmasked = bit32.bxor(ivpGqkyp, YhFiQdhJ)
        table.insert(ODwcybuA, string.char(bit32.bxor(unmasked, QRDwnkwD)))
    end
    return table.concat(ODwcybuA)
end

local PHZpkiCr_flat = {}
for _, chunk in ipairs(YrGjilEg) do
    for _, byte in ipairs(chunk) do
        table.insert(PHZpkiCr_flat, byte)
    end
end

local decrypted = UloPxFVj(PHZpkiCr_flat, HqexMyPb)
local qiTqrxhl, ZUypBsoQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PHZpkiCr_flat)
PHZpkiCr_flat = nil

if qiTqrxhl then 
    local result = qiTqrxhl() 
    decrypted = nil
    qiTqrxhl = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(ZUypBsoQ)) 
end
