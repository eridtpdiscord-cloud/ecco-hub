-- Protected Segment (tween_library)
local CIlwVEZw = 107
local yfCqqNCf = {
{37,214,137,19,72,81,123,244,52,121,180,31,107,65,44,134,85,231,131,197,56,89,17,199,233,99,162,243,10,99,196,178,238,54,112,72,226,216,111,250,157,68,124,220,115,160,207,246,38,109,176,142,249,171,120,184,11,238,216,159},{40,39,122,203,134,115,192,32,109,88,97,87,222,46,43,24,10,1,61,125,146,57,139,44,173,237,254,121,92,16,159,132,137,60,9,182,241,126,110,72,117,255,207,74,207,161,44,184,78,62,103,144,75,219,40,49,120,156,12,160},{5,66,202,175,190,223,80,230,245,171,14,198,111,93,219,61,215,25,53,165,28,54,26,49,7}
}
local NBlmbCOA = "vbPBDsgpKQuctjkw"

local function wQKKEmNF(IAETdEiX_data, IAETdEiX_key)
    if type(IAETdEiX_key) ~= "string" or #IAETdEiX_key == 0 then return "" end
    local IAETdEiX = {}
    for edbuMEGA = 0, 255 do IAETdEiX[edbuMEGA] = edbuMEGA end
    local bDrTZYMP = 0
    for edbuMEGA = 0, 255 do
        local KkINzZFT = IAETdEiX_key:byte((edbuMEGA % #IAETdEiX_key) + 1)
        bDrTZYMP = (bDrTZYMP + IAETdEiX[edbuMEGA] + KkINzZFT) % 256
        IAETdEiX[edbuMEGA], IAETdEiX[bDrTZYMP] = IAETdEiX[bDrTZYMP], IAETdEiX[edbuMEGA]
    end
    local edbuMEGA = 0
    local bDrTZYMP = 0
    local SafQUFyX = {}
    for _, myIhLOmT in ipairs(IAETdEiX_data) do
        edbuMEGA = (edbuMEGA + 1) % 256
        bDrTZYMP = (bDrTZYMP + IAETdEiX[edbuMEGA]) % 256
        IAETdEiX[edbuMEGA], IAETdEiX[bDrTZYMP] = IAETdEiX[bDrTZYMP], IAETdEiX[edbuMEGA]
        local KkINzZFT = IAETdEiX[(IAETdEiX[edbuMEGA] + IAETdEiX[bDrTZYMP]) % 256]
        local unmasked = bit32.bxor(myIhLOmT, CIlwVEZw)
        table.insert(SafQUFyX, string.char(bit32.bxor(unmasked, KkINzZFT)))
    end
    return table.concat(SafQUFyX)
end

local IAETdEiX_flat = {}
for _, chunk in ipairs(yfCqqNCf) do
    for _, byte in ipairs(chunk) do
        table.insert(IAETdEiX_flat, byte)
    end
end

local decrypted = wQKKEmNF(IAETdEiX_flat, NBlmbCOA)
local yplHhSOM, LKexJABl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(IAETdEiX_flat)
IAETdEiX_flat = nil

if yplHhSOM then 
    local result = yplHhSOM() 
    decrypted = nil
    yplHhSOM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(LKexJABl)) 
end
