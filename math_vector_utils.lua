-- Protected Segment (math_vector_utils)
local SudtIGoy = 254
local KoqmnPzQ = {
{214,78,178,237,161,50,66,246,228,138,160,204,132,4,242,117,62,144,205,14,23,62,92,211,244,153,234,176,108,197,144,73,54,41,164,96,7,132,117,215,115,247,143,144,225,193,69,61,128,169,247,58,218,156,114,147,243,180,120,83},{199,86,104,10,111,143,203,125,183,36,245,169,34,255,191,181,47,9,143,93,24,129,43,84,105,254,242,127,250,237,43,5,76,1,94,15,232,109,57,103,21,101,46,132,71,159,192,130,210,60,213,39,65,253,250,62,151,47,132,142},{194,183,231,39,200,207,108,199,121,19,137,104,42,11,140,194,81,134,18,221,168,112,191,152,9,174,1,190,93}
}
local RIFaJtav = "eDZtxdqfebTerkJy"

local function BQgyNEyr(nOSKGIUB_data, nOSKGIUB_key)
    local nOSKGIUB = {}
    for OvvuMBNB = 0, 255 do nOSKGIUB[OvvuMBNB] = OvvuMBNB end
    local gIlzxNeS = 0
    for OvvuMBNB = 0, 255 do
        local upcjbpsX = nOSKGIUB_key:byte((OvvuMBNB % #nOSKGIUB_key) + 1)
        gIlzxNeS = (gIlzxNeS + nOSKGIUB[OvvuMBNB] + upcjbpsX) % 256
        nOSKGIUB[OvvuMBNB], nOSKGIUB[gIlzxNeS] = nOSKGIUB[gIlzxNeS], nOSKGIUB[OvvuMBNB]
    end
    local OvvuMBNB = 0
    local gIlzxNeS = 0
    local TZyCuGJU = {}
    for _, EWIJVgkX in ipairs(nOSKGIUB_data) do
        OvvuMBNB = (OvvuMBNB + 1) % 256
        gIlzxNeS = (gIlzxNeS + nOSKGIUB[OvvuMBNB]) % 256
        nOSKGIUB[OvvuMBNB], nOSKGIUB[gIlzxNeS] = nOSKGIUB[gIlzxNeS], nOSKGIUB[OvvuMBNB]
        local upcjbpsX = nOSKGIUB[(nOSKGIUB[OvvuMBNB] + nOSKGIUB[gIlzxNeS]) % 256]
        local unmasked = bit32.bxor(EWIJVgkX, SudtIGoy)
        table.insert(TZyCuGJU, string.char(bit32.bxor(unmasked, upcjbpsX)))
    end
    return table.concat(TZyCuGJU)
end

local nOSKGIUB_flat = {}
for _, chunk in ipairs(KoqmnPzQ) do
    for _, byte in ipairs(chunk) do
        table.insert(nOSKGIUB_flat, byte)
    end
end

local decrypted = BQgyNEyr(nOSKGIUB_flat, RIFaJtav)
local aAnxiciX, whMAYcYX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(nOSKGIUB_flat)
nOSKGIUB_flat = nil

if aAnxiciX then 
    local result = aAnxiciX() 
    decrypted = nil
    aAnxiciX = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(whMAYcYX)) 
end
