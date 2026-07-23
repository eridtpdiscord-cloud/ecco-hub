-- Protected Segment (ui_themes)
local cvpvEoHO = 20
local UKleQlbR = {
{230,91,224,130,209,142,66,57,217,26,98,193,46,3,91,26,186,9,224,60,196,237,112,80,252,98,217,215,82,218,249,206,178,243,110,242,50,74,179,45,130,25,174,253,100,52,38,141,44,147,204,1,58,22,122,200,141,211,24,31},{201,99,129,142,183,114,45,224,79,57,89,96,245,156,20,208,144,181,203,109,72,199,96,10,116,114,151,158,82,156,194,234,89,20,105,180,228,239,7,61,176,190,147,23,210,82,219,8,205,177,62,97,171,75,207,81,254,136,77,167},{251,247,198,110,206,251,34,39,200,33,208,172,249,139,254,46,32,24,162,214,38}
}
local sHuoYSNC = "aJUvButLjPrqyzff"

local function NOwoeOlW(vgudxEHc_data, vgudxEHc_key)
    if type(vgudxEHc_key) ~= "string" or #vgudxEHc_key == 0 then return "" end
    local vgudxEHc = {}
    for MUJbwmZE = 0, 255 do vgudxEHc[MUJbwmZE] = MUJbwmZE end
    local HQnpVNPg = 0
    for MUJbwmZE = 0, 255 do
        local wIeArSZs = vgudxEHc_key:byte((MUJbwmZE % #vgudxEHc_key) + 1)
        HQnpVNPg = (HQnpVNPg + vgudxEHc[MUJbwmZE] + wIeArSZs) % 256
        vgudxEHc[MUJbwmZE], vgudxEHc[HQnpVNPg] = vgudxEHc[HQnpVNPg], vgudxEHc[MUJbwmZE]
    end
    local MUJbwmZE = 0
    local HQnpVNPg = 0
    local NcqurAmO = {}
    for _, ViTxxXKP in ipairs(vgudxEHc_data) do
        MUJbwmZE = (MUJbwmZE + 1) % 256
        HQnpVNPg = (HQnpVNPg + vgudxEHc[MUJbwmZE]) % 256
        vgudxEHc[MUJbwmZE], vgudxEHc[HQnpVNPg] = vgudxEHc[HQnpVNPg], vgudxEHc[MUJbwmZE]
        local wIeArSZs = vgudxEHc[(vgudxEHc[MUJbwmZE] + vgudxEHc[HQnpVNPg]) % 256]
        local unmasked = bit32.bxor(ViTxxXKP, cvpvEoHO)
        table.insert(NcqurAmO, string.char(bit32.bxor(unmasked, wIeArSZs)))
    end
    return table.concat(NcqurAmO)
end

local vgudxEHc_flat = {}
for _, chunk in ipairs(UKleQlbR) do
    for _, byte in ipairs(chunk) do
        table.insert(vgudxEHc_flat, byte)
    end
end

local decrypted = NOwoeOlW(vgudxEHc_flat, sHuoYSNC)
local CvfwuCXm, LJWNTSWs = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vgudxEHc_flat)
vgudxEHc_flat = nil

if CvfwuCXm then 
    local result = CvfwuCXm() 
    decrypted = nil
    CvfwuCXm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(LJWNTSWs)) 
end
