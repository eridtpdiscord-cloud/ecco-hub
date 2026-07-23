-- Protected Segment (tween_library)
local tOfhmRoO = 127
local cVMBUiPY = {
{128,142,202,71,138,255,28,210,13,73,240,22,114,0,47,149,58,2,168,66,69,113,211,40,249,219,136,131,33,195,226,147,32,51,235,25,71,106,234,224,198,138,182,166,219,116,244,49,67,5,83,79,185,63,115,59,204,124,208,185},{153,139,176,25,4,157,45,194,0,241,41,73,125,40,76,110,200,28,186,75,224,135,245,175,34,150,223,127,121,7,185,105,225,6,152,18,38,61,181,106,28,189,89,19,60,74,168,179,215,250,60,249,24,79,162,157,124,99,159,220},{106,39,33,8,204,72,19,8,131,196,245,166,9,253,27,43,76,72,23,252,121,33,142,86,32}
}
local xjWaDOmB = "FfNiuIWSUDhrZFex"

local function TPgraCtE(sLjqKYIy_data, sLjqKYIy_key)
    if type(sLjqKYIy_key) ~= "string" or #sLjqKYIy_key == 0 then return "" end
    local sLjqKYIy = {}
    for qImreoCD = 0, 255 do sLjqKYIy[qImreoCD] = qImreoCD end
    local jIFxRwIy = 0
    for qImreoCD = 0, 255 do
        local jGOWkAFV = sLjqKYIy_key:byte((qImreoCD % #sLjqKYIy_key) + 1)
        jIFxRwIy = (jIFxRwIy + sLjqKYIy[qImreoCD] + jGOWkAFV) % 256
        sLjqKYIy[qImreoCD], sLjqKYIy[jIFxRwIy] = sLjqKYIy[jIFxRwIy], sLjqKYIy[qImreoCD]
    end
    local qImreoCD = 0
    local jIFxRwIy = 0
    local WToUIuDw = {}
    for _, LUWCMamC in ipairs(sLjqKYIy_data) do
        qImreoCD = (qImreoCD + 1) % 256
        jIFxRwIy = (jIFxRwIy + sLjqKYIy[qImreoCD]) % 256
        sLjqKYIy[qImreoCD], sLjqKYIy[jIFxRwIy] = sLjqKYIy[jIFxRwIy], sLjqKYIy[qImreoCD]
        local jGOWkAFV = sLjqKYIy[(sLjqKYIy[qImreoCD] + sLjqKYIy[jIFxRwIy]) % 256]
        local unmasked = bit32.bxor(LUWCMamC, tOfhmRoO)
        table.insert(WToUIuDw, string.char(bit32.bxor(unmasked, jGOWkAFV)))
    end
    return table.concat(WToUIuDw)
end

local sLjqKYIy_flat = {}
for _, chunk in ipairs(cVMBUiPY) do
    for _, byte in ipairs(chunk) do
        table.insert(sLjqKYIy_flat, byte)
    end
end

local decrypted = TPgraCtE(sLjqKYIy_flat, xjWaDOmB)
local rIQjkJBG, DwEGQago = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(sLjqKYIy_flat)
sLjqKYIy_flat = nil

if rIQjkJBG then 
    local result = rIQjkJBG() 
    decrypted = nil
    rIQjkJBG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(DwEGQago)) 
end
