-- Protected Segment (ui_themes)
local dhhmnEmA = 18
local KMDqyHAs = {
{164,71,191,43,253,153,11,128,127,1,102,178,204,78,156,103,86,202,144,180,8,6,206,194,177,215,230,75,26,79,126,146,65,17,58,119,31,28,64,52,47,250,27,114,27,148,144,46,132,133,235,118,30,156,236,240,164,12,107,241},{58,4,217,142,161,250,23,8,220,38,227,31,162,90,27,32,100,115,178,238,23,29,32,110,188,136,118,210,117,2,137,41,235,200,226,69,0,153,39,114,87,228,145,79,173,196,91,218,94,26,206,86,39,176,241,118,77,247,160,144},{243,89,77,71,26,120,62,206,248,165,248,21,28,80,130,227,110,254,87,28,140}
}
local ofeFWyoQ = "SXQvgXMmdhUAhKVQ"

local function cUfzybKS(QAwZmspm_data, QAwZmspm_key)
    if type(QAwZmspm_key) ~= "string" or #QAwZmspm_key == 0 then return "" end
    local QAwZmspm = {}
    for EYyTtEIC = 0, 255 do QAwZmspm[EYyTtEIC] = EYyTtEIC end
    local GLaeKRAI = 0
    for EYyTtEIC = 0, 255 do
        local NwmMUbGT = QAwZmspm_key:byte((EYyTtEIC % #QAwZmspm_key) + 1)
        GLaeKRAI = (GLaeKRAI + QAwZmspm[EYyTtEIC] + NwmMUbGT) % 256
        QAwZmspm[EYyTtEIC], QAwZmspm[GLaeKRAI] = QAwZmspm[GLaeKRAI], QAwZmspm[EYyTtEIC]
    end
    local EYyTtEIC = 0
    local GLaeKRAI = 0
    local aEEWUThz = {}
    for _, rIGVXxOt in ipairs(QAwZmspm_data) do
        EYyTtEIC = (EYyTtEIC + 1) % 256
        GLaeKRAI = (GLaeKRAI + QAwZmspm[EYyTtEIC]) % 256
        QAwZmspm[EYyTtEIC], QAwZmspm[GLaeKRAI] = QAwZmspm[GLaeKRAI], QAwZmspm[EYyTtEIC]
        local NwmMUbGT = QAwZmspm[(QAwZmspm[EYyTtEIC] + QAwZmspm[GLaeKRAI]) % 256]
        local unmasked = bit32.bxor(rIGVXxOt, dhhmnEmA)
        table.insert(aEEWUThz, string.char(bit32.bxor(unmasked, NwmMUbGT)))
    end
    return table.concat(aEEWUThz)
end

local QAwZmspm_flat = {}
for _, chunk in ipairs(KMDqyHAs) do
    for _, byte in ipairs(chunk) do
        table.insert(QAwZmspm_flat, byte)
    end
end

local decrypted = cUfzybKS(QAwZmspm_flat, ofeFWyoQ)
local WtgivfQv, vpSvKmpd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QAwZmspm_flat)
QAwZmspm_flat = nil

if WtgivfQv then 
    local result = WtgivfQv() 
    decrypted = nil
    WtgivfQv = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(vpSvKmpd)) 
end
