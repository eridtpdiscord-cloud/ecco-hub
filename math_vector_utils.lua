-- Protected Segment (math_vector_utils)
local oJYrssqU = 193
local iIFcVTkW = {
{181,227,103,217,63,193,7,131,22,134,7,203,10,130,190,136,252,27,161,122,237,62,161,197,108,3,141,109,82,70,160,23,117,50,130,17,173,112,223,51,160,115,226,4,109,103,253,42,244,236,149,148,136,206,16,223,31,215,117,241},{110,223,1,115,94,111,46,141,15,209,232,202,102,114,203,56,205,205,105,141,202,94,158,31,245,168,136,27,190,249,158,50,54,199,100,22,110,210,49,75,201,153,239,106,126,20,255,230,33,19,180,200,71,222,2,159,156,218,106,230},{155,193,26,239,2,39,108,37,203,11,219,237,113,49,24,13,220,245,109,167,48,104,43,182,218,36,164,159,7}
}
local SoMJXUFM = "RdZvjBWSsRzilVJU"

local function rTiohtzq(OYhlruYp_data, OYhlruYp_key)
    if type(OYhlruYp_key) ~= "string" or #OYhlruYp_key == 0 then return "" end
    local OYhlruYp = {}
    for YkVGXhxj = 0, 255 do OYhlruYp[YkVGXhxj] = YkVGXhxj end
    local GdIXSzUr = 0
    for YkVGXhxj = 0, 255 do
        local NCxWipuW = OYhlruYp_key:byte((YkVGXhxj % #OYhlruYp_key) + 1)
        GdIXSzUr = (GdIXSzUr + OYhlruYp[YkVGXhxj] + NCxWipuW) % 256
        OYhlruYp[YkVGXhxj], OYhlruYp[GdIXSzUr] = OYhlruYp[GdIXSzUr], OYhlruYp[YkVGXhxj]
    end
    local YkVGXhxj = 0
    local GdIXSzUr = 0
    local ZySUyivI = {}
    for _, dXCKYjEP in ipairs(OYhlruYp_data) do
        YkVGXhxj = (YkVGXhxj + 1) % 256
        GdIXSzUr = (GdIXSzUr + OYhlruYp[YkVGXhxj]) % 256
        OYhlruYp[YkVGXhxj], OYhlruYp[GdIXSzUr] = OYhlruYp[GdIXSzUr], OYhlruYp[YkVGXhxj]
        local NCxWipuW = OYhlruYp[(OYhlruYp[YkVGXhxj] + OYhlruYp[GdIXSzUr]) % 256]
        local unmasked = bit32.bxor(dXCKYjEP, oJYrssqU)
        table.insert(ZySUyivI, string.char(bit32.bxor(unmasked, NCxWipuW)))
    end
    return table.concat(ZySUyivI)
end

local OYhlruYp_flat = {}
for _, chunk in ipairs(iIFcVTkW) do
    for _, byte in ipairs(chunk) do
        table.insert(OYhlruYp_flat, byte)
    end
end

local decrypted = rTiohtzq(OYhlruYp_flat, SoMJXUFM)
local FfUVIlrm, rNQwLOwG = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OYhlruYp_flat)
OYhlruYp_flat = nil

if FfUVIlrm then 
    local result = FfUVIlrm() 
    decrypted = nil
    FfUVIlrm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(rNQwLOwG)) 
end
