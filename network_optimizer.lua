-- Protected Segment (network_optimizer)
local EdwbGImI = 58
local bRmHdySc = {
{69,42,10,208,46,164,10,208,198,39,65,166,52,122,108,198,72,193,209,196,14,98,177,93,43,82,16,2,125,133,145,240,106,229,174,48,65,147,17,96,238,159,165,143,124,231,255,5,164,24,162,101,251,100,192,130,160,37,85,212},{74,238,250,153,68,111,4,158,187,56,74,21,109,159,241,86,238,233,17,61,91,15,122,254,177,209,96,219,204,187,20,18,44,79,194,193,215,46,38,6,176,62,20,133,105,238,60,108,98,31,170,3,113,191,77,192,76,190,5,172},{138,162,26,236,133,148,151,233,2,76,192,118,202,180,16,12,86,62,197,88,233,220,105,248,218,139,157,247,150}
}
local aYLbwPzk = "iBpMBPzGtyjKgdpI"

local function JoNNLRTT(zaAqaptj_data, zaAqaptj_key)
    if type(zaAqaptj_key) ~= "string" or #zaAqaptj_key == 0 then return "" end
    local zaAqaptj = {}
    for eVnIJAZN = 0, 255 do zaAqaptj[eVnIJAZN] = eVnIJAZN end
    local peagrTnJ = 0
    for eVnIJAZN = 0, 255 do
        local NdBgAIDX = zaAqaptj_key:byte((eVnIJAZN % #zaAqaptj_key) + 1)
        peagrTnJ = (peagrTnJ + zaAqaptj[eVnIJAZN] + NdBgAIDX) % 256
        zaAqaptj[eVnIJAZN], zaAqaptj[peagrTnJ] = zaAqaptj[peagrTnJ], zaAqaptj[eVnIJAZN]
    end
    local eVnIJAZN = 0
    local peagrTnJ = 0
    local nINTDubq = {}
    for _, ETfrbApd in ipairs(zaAqaptj_data) do
        eVnIJAZN = (eVnIJAZN + 1) % 256
        peagrTnJ = (peagrTnJ + zaAqaptj[eVnIJAZN]) % 256
        zaAqaptj[eVnIJAZN], zaAqaptj[peagrTnJ] = zaAqaptj[peagrTnJ], zaAqaptj[eVnIJAZN]
        local NdBgAIDX = zaAqaptj[(zaAqaptj[eVnIJAZN] + zaAqaptj[peagrTnJ]) % 256]
        local unmasked = bit32.bxor(ETfrbApd, EdwbGImI)
        table.insert(nINTDubq, string.char(bit32.bxor(unmasked, NdBgAIDX)))
    end
    return table.concat(nINTDubq)
end

local zaAqaptj_flat = {}
for _, chunk in ipairs(bRmHdySc) do
    for _, byte in ipairs(chunk) do
        table.insert(zaAqaptj_flat, byte)
    end
end

local decrypted = JoNNLRTT(zaAqaptj_flat, aYLbwPzk)
local FoBDioLq, uSYlKJDz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(zaAqaptj_flat)
zaAqaptj_flat = nil

if FoBDioLq then 
    local result = FoBDioLq() 
    decrypted = nil
    FoBDioLq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(uSYlKJDz)) 
end
