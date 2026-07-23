-- Protected Segment (network_optimizer)
local pqtnjlBC = 128
local ILdXsTDG = {
{253,244,103,149,72,28,154,141,70,235,112,181,93,141,107,87,46,69,90,134,165,205,134,6,243,199,110,200,38,68,240,121,144,131,193,142,110,122,1,6,71,26,10,134,8,40,232,199,222,124,227,250,141,119,50,159,211,38,58,50},{129,161,27,136,192,71,109,172,244,250,193,241,246,185,28,191,69,65,6,238,69,228,160,205,133,17,51,13,98,118,185,85,152,77,199,81,96,182,241,208,212,19,33,116,106,129,22,121,236,154,42,37,228,15,195,27,163,173,154,103},{52,130,23,214,215,195,204,223,0,136,169,24,205,29,20,9,176,212,29,73,47,52,221,162,82,189,173,102,180}
}
local koyqENyI = "bBZmhhgzvaynXFlH"

local function QABoYfCe(yBGmCerA_data, yBGmCerA_key)
    if type(yBGmCerA_key) ~= "string" or #yBGmCerA_key == 0 then return "" end
    local yBGmCerA = {}
    for YDbeNeES = 0, 255 do yBGmCerA[YDbeNeES] = YDbeNeES end
    local vdTYYESR = 0
    for YDbeNeES = 0, 255 do
        local PoxspxpS = yBGmCerA_key:byte((YDbeNeES % #yBGmCerA_key) + 1)
        vdTYYESR = (vdTYYESR + yBGmCerA[YDbeNeES] + PoxspxpS) % 256
        yBGmCerA[YDbeNeES], yBGmCerA[vdTYYESR] = yBGmCerA[vdTYYESR], yBGmCerA[YDbeNeES]
    end
    local YDbeNeES = 0
    local vdTYYESR = 0
    local gNHYyeQW = {}
    for _, wOiBTWJd in ipairs(yBGmCerA_data) do
        YDbeNeES = (YDbeNeES + 1) % 256
        vdTYYESR = (vdTYYESR + yBGmCerA[YDbeNeES]) % 256
        yBGmCerA[YDbeNeES], yBGmCerA[vdTYYESR] = yBGmCerA[vdTYYESR], yBGmCerA[YDbeNeES]
        local PoxspxpS = yBGmCerA[(yBGmCerA[YDbeNeES] + yBGmCerA[vdTYYESR]) % 256]
        local unmasked = bit32.bxor(wOiBTWJd, pqtnjlBC)
        table.insert(gNHYyeQW, string.char(bit32.bxor(unmasked, PoxspxpS)))
    end
    return table.concat(gNHYyeQW)
end

local yBGmCerA_flat = {}
for _, chunk in ipairs(ILdXsTDG) do
    for _, byte in ipairs(chunk) do
        table.insert(yBGmCerA_flat, byte)
    end
end

local decrypted = QABoYfCe(yBGmCerA_flat, koyqENyI)
local rsBCNBYe, wfUpLDuG = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yBGmCerA_flat)
yBGmCerA_flat = nil

if rsBCNBYe then 
    local result = rsBCNBYe() 
    decrypted = nil
    rsBCNBYe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(wfUpLDuG)) 
end
