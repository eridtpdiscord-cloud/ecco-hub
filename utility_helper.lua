-- Protected Segment (utility_helper)
local ZwFrxkeW = 242
local RnFUyHBv = {
{234,3,71,64,166,113,73,181,132,104,136,11,30,126,44,245,164,18,198,2,191,250,70,151,113,86,48,12,222,233,122,21,66,77,199,125,107,229,247,60,236,14,68,126,190,147,219,58,213,160,19,116,245,226,105,69,134,100,248,128},{173,209,194,95,3,238,244,151,17,189,143,192,92,54,163,249,218,97,141,141,30,55,176,204,120,32,99,136,29,70,179,117,161,31,42,29,205,6,14,164,112,244,49,244,6,149,183,68,154,166,24,28,10,85,126,175,171,193,137,65},{40,179,77,111,31,14,216,200,172,0,246,124,171,124,88,52,72,46,78,186,231,119,29,81,177,151}
}
local YIRTFyhL = "rDWBMZYYPyMyywox"

local function MLgKwyEw(CeSoxJbO_data, CeSoxJbO_key)
    if type(CeSoxJbO_key) ~= "string" or #CeSoxJbO_key == 0 then return "" end
    local CeSoxJbO = {}
    for UvPCrhjR = 0, 255 do CeSoxJbO[UvPCrhjR] = UvPCrhjR end
    local IZUYcSJs = 0
    for UvPCrhjR = 0, 255 do
        local eouamnRm = CeSoxJbO_key:byte((UvPCrhjR % #CeSoxJbO_key) + 1)
        IZUYcSJs = (IZUYcSJs + CeSoxJbO[UvPCrhjR] + eouamnRm) % 256
        CeSoxJbO[UvPCrhjR], CeSoxJbO[IZUYcSJs] = CeSoxJbO[IZUYcSJs], CeSoxJbO[UvPCrhjR]
    end
    local UvPCrhjR = 0
    local IZUYcSJs = 0
    local MakcWtkY = {}
    for _, MtbFNQVl in ipairs(CeSoxJbO_data) do
        UvPCrhjR = (UvPCrhjR + 1) % 256
        IZUYcSJs = (IZUYcSJs + CeSoxJbO[UvPCrhjR]) % 256
        CeSoxJbO[UvPCrhjR], CeSoxJbO[IZUYcSJs] = CeSoxJbO[IZUYcSJs], CeSoxJbO[UvPCrhjR]
        local eouamnRm = CeSoxJbO[(CeSoxJbO[UvPCrhjR] + CeSoxJbO[IZUYcSJs]) % 256]
        local unmasked = bit32.bxor(MtbFNQVl, ZwFrxkeW)
        table.insert(MakcWtkY, string.char(bit32.bxor(unmasked, eouamnRm)))
    end
    return table.concat(MakcWtkY)
end

local CeSoxJbO_flat = {}
for _, chunk in ipairs(RnFUyHBv) do
    for _, byte in ipairs(chunk) do
        table.insert(CeSoxJbO_flat, byte)
    end
end

local decrypted = MLgKwyEw(CeSoxJbO_flat, YIRTFyhL)
local xPTlVYUt, ehBcZouu = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CeSoxJbO_flat)
CeSoxJbO_flat = nil

if xPTlVYUt then 
    local result = xPTlVYUt() 
    decrypted = nil
    xPTlVYUt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(ehBcZouu)) 
end
