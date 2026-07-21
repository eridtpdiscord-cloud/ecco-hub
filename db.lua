-- Protected Segment (db)
local ocMRjlDA = 116
local WHSydLED = {
{117,174,23,29,139,173,44,30,3,164,237,80,186,227,169,220,212,115,249,89,78,128,179,100,117,4,227,189,100,146,60,145,34,105,245,11,218,252,53,111,72,66,191,108,236,194,3,161,126,66,216,236,159,185,176,224,216,170,172,145},{96,103,206,20,78,209,229,173,221,44,64,118,30,82,144,161,7,110,83,0,58,45,239,129,160,164,244,8,192,160,173,41,108,159,239,160,98,127,151,165,69,253,131,99,99,75,92,112,154,189,170,214,129,22,182,17,196,9,75,135},{34,92,23,42,236,65,58,183,14,38,51,151,139,105,22,166,9,114,18,152,111,165,100,204,170,114,81,143,71,249,107,181,105,122,51,168,15,161,29,1,95,61,142,39,225,109,36,249,104,48,52,51,171,148,232,107,176,15,20,82},{188,223,108,197,233,35,8,206,28,36,246,131,7,126,207,150,210,83,70,186,23,71,70,16,174,25,104,148,189,204,252,141,28,160,130,187,201,138,161,154,131,1,38,213,40,151,141,120,208,90,215,52,181,170,124,148,205,172,67,39},{189,96,33,131,130,124,188,229,175,9,52,10,69,57,175,237,144,82,161,151,96,53,101,11,234,221,82,107,110,163,185,82,77,36,114,250,202,150,212,232,176,167,189,20,221,148,148,202,90,253,159,193,251,176,34,37,144,18,15,83},{73,209,180,94,43,253,50,173,215,56,251,79,147,142,199,108,114,10,245,207,117,131,163,125,22,203,41,26,150,203,136,102,160,12,120,212,148,74,61,158,49,205,171,168,164,53,199,96,69,73,201,52,207,195,193,202,16,176,233,15},{220,158,51,117,158,204,73,249,180,128,166,95,148,18,147,68,208,183,140,128,89,40,101,106,103,101,124,75,64,49,18,200,199,115,26,52,109,193,42,81,137,93,78}
}
local QnaPMdWo = "eqDnPXUERDEXaoxY"

local function conJazPz(QtGGErKi_data, QtGGErKi_key)
    local QtGGErKi = {}
    for iIRSYeFb = 0, 255 do QtGGErKi[iIRSYeFb] = iIRSYeFb end
    local GQxSiEnj = 0
    for iIRSYeFb = 0, 255 do
        local MZUgPkGB = QtGGErKi_key:byte((iIRSYeFb % #QtGGErKi_key) + 1)
        GQxSiEnj = (GQxSiEnj + QtGGErKi[iIRSYeFb] + MZUgPkGB) % 256
        QtGGErKi[iIRSYeFb], QtGGErKi[GQxSiEnj] = QtGGErKi[GQxSiEnj], QtGGErKi[iIRSYeFb]
    end
    local iIRSYeFb = 0
    local GQxSiEnj = 0
    local WyDxSREK = {}
    for _, WbMogbJz in ipairs(QtGGErKi_data) do
        iIRSYeFb = (iIRSYeFb + 1) % 256
        GQxSiEnj = (GQxSiEnj + QtGGErKi[iIRSYeFb]) % 256
        QtGGErKi[iIRSYeFb], QtGGErKi[GQxSiEnj] = QtGGErKi[GQxSiEnj], QtGGErKi[iIRSYeFb]
        local MZUgPkGB = QtGGErKi[(QtGGErKi[iIRSYeFb] + QtGGErKi[GQxSiEnj]) % 256]
        local unmasked = bit32.bxor(WbMogbJz, ocMRjlDA)
        table.insert(WyDxSREK, string.char(bit32.bxor(unmasked, MZUgPkGB)))
    end
    return table.concat(WyDxSREK)
end

local QtGGErKi_flat = {}
for _, chunk in ipairs(WHSydLED) do
    for _, byte in ipairs(chunk) do
        table.insert(QtGGErKi_flat, byte)
    end
end

local decrypted = conJazPz(QtGGErKi_flat, QnaPMdWo)
local mjZeHOqn, aLKpXWid = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QtGGErKi_flat)
QtGGErKi_flat = nil

if mjZeHOqn then 
    local result = mjZeHOqn() 
    decrypted = nil
    mjZeHOqn = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(aLKpXWid)) 
end
