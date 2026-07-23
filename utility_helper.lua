-- Protected Segment (utility_helper)
local wcUsQKuv = 251
local aNYaPGRU = {
{208,216,129,61,235,162,32,125,37,10,231,0,20,118,105,63,182,15,132,68,66,33,37,123,167,129,178,16,84,21,25,132,108,2,28,98,10,185,63,242,33,44,37,253,135,102,20,176,185,55,192,178,109,134,35,157,208,45,134,168},{240,21,73,150,223,100,158,140,121,62,72,216,147,92,22,37,58,188,220,178,176,182,69,42,64,235,32,223,198,188,192,91,221,70,222,84,26,155,12,71,135,199,80,146,216,191,157,144,253,172,79,245,110,222,129,9,219,85,184,169},{26,37,201,160,118,78,128,162,65,150,41,12,88,177,228,137,78,57,7,177,237,25,202,210,155,184}
}
local oRAGbWxi = "LmOzxaQeRUEKtiCB"

local function RPJiizof(fmGhmNFD_data, fmGhmNFD_key)
    if type(fmGhmNFD_key) ~= "string" or #fmGhmNFD_key == 0 then return "" end
    local fmGhmNFD = {}
    for uWvBgGCx = 0, 255 do fmGhmNFD[uWvBgGCx] = uWvBgGCx end
    local zGksnSzD = 0
    for uWvBgGCx = 0, 255 do
        local BHoludqr = fmGhmNFD_key:byte((uWvBgGCx % #fmGhmNFD_key) + 1)
        zGksnSzD = (zGksnSzD + fmGhmNFD[uWvBgGCx] + BHoludqr) % 256
        fmGhmNFD[uWvBgGCx], fmGhmNFD[zGksnSzD] = fmGhmNFD[zGksnSzD], fmGhmNFD[uWvBgGCx]
    end
    local uWvBgGCx = 0
    local zGksnSzD = 0
    local DcuXFkFG = {}
    for _, sIVIOekR in ipairs(fmGhmNFD_data) do
        uWvBgGCx = (uWvBgGCx + 1) % 256
        zGksnSzD = (zGksnSzD + fmGhmNFD[uWvBgGCx]) % 256
        fmGhmNFD[uWvBgGCx], fmGhmNFD[zGksnSzD] = fmGhmNFD[zGksnSzD], fmGhmNFD[uWvBgGCx]
        local BHoludqr = fmGhmNFD[(fmGhmNFD[uWvBgGCx] + fmGhmNFD[zGksnSzD]) % 256]
        local unmasked = bit32.bxor(sIVIOekR, wcUsQKuv)
        table.insert(DcuXFkFG, string.char(bit32.bxor(unmasked, BHoludqr)))
    end
    return table.concat(DcuXFkFG)
end

local fmGhmNFD_flat = {}
for _, chunk in ipairs(aNYaPGRU) do
    for _, byte in ipairs(chunk) do
        table.insert(fmGhmNFD_flat, byte)
    end
end

local decrypted = RPJiizof(fmGhmNFD_flat, oRAGbWxi)
local iixyRbwy, dkCCGTdF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fmGhmNFD_flat)
fmGhmNFD_flat = nil

if iixyRbwy then 
    local result = iixyRbwy() 
    decrypted = nil
    iixyRbwy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(dkCCGTdF)) 
end
