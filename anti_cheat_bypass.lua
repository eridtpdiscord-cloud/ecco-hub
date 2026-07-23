-- Protected Segment (anti_cheat_bypass)
local gNOnWJqU = 250
local XitlXFay = {
{235,179,134,121,191,168,61,76,46,31,109,162,243,254,210,162,237,91,40,104,180,37,71,169,204,131,195,116,47,207,33,254,83,190,34,35,109,244,146,19,250,27,209,140,148,61,2,53,180,16,86,246,114,216,60,91,232,202,24,92},{219,211,77,39,169,112,54,10,212,150,114,177,190,163,139,33,58,44,84,34,123,11,70,218,157,178,230,12,140,37,153,178,43,56,115,203,7,205,34,23,241,97,43,243,178,131,212,139,179,158,250,197,10,88,191,111,77,177,219,122},{194,135,185,33,231,124,98,167,5,197,39,252,71,46,145,46,109,139,72,204,117,206,126,75,229,44,245,82,225}
}
local pvwSgyey = "UfieKQYXdzQzOAup"

local function KRnEFUuK(vdmgcPdE_data, vdmgcPdE_key)
    if type(vdmgcPdE_key) ~= "string" or #vdmgcPdE_key == 0 then return "" end
    local vdmgcPdE = {}
    for SAAoOWDo = 0, 255 do vdmgcPdE[SAAoOWDo] = SAAoOWDo end
    local stzhblNb = 0
    for SAAoOWDo = 0, 255 do
        local kRrLEDJp = vdmgcPdE_key:byte((SAAoOWDo % #vdmgcPdE_key) + 1)
        stzhblNb = (stzhblNb + vdmgcPdE[SAAoOWDo] + kRrLEDJp) % 256
        vdmgcPdE[SAAoOWDo], vdmgcPdE[stzhblNb] = vdmgcPdE[stzhblNb], vdmgcPdE[SAAoOWDo]
    end
    local SAAoOWDo = 0
    local stzhblNb = 0
    local HzXnkkvG = {}
    for _, WIhLvNyK in ipairs(vdmgcPdE_data) do
        SAAoOWDo = (SAAoOWDo + 1) % 256
        stzhblNb = (stzhblNb + vdmgcPdE[SAAoOWDo]) % 256
        vdmgcPdE[SAAoOWDo], vdmgcPdE[stzhblNb] = vdmgcPdE[stzhblNb], vdmgcPdE[SAAoOWDo]
        local kRrLEDJp = vdmgcPdE[(vdmgcPdE[SAAoOWDo] + vdmgcPdE[stzhblNb]) % 256]
        local unmasked = bit32.bxor(WIhLvNyK, gNOnWJqU)
        table.insert(HzXnkkvG, string.char(bit32.bxor(unmasked, kRrLEDJp)))
    end
    return table.concat(HzXnkkvG)
end

local vdmgcPdE_flat = {}
for _, chunk in ipairs(XitlXFay) do
    for _, byte in ipairs(chunk) do
        table.insert(vdmgcPdE_flat, byte)
    end
end

local decrypted = KRnEFUuK(vdmgcPdE_flat, pvwSgyey)
local AWvQsZwW, VQedJxlv = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vdmgcPdE_flat)
vdmgcPdE_flat = nil

if AWvQsZwW then 
    local result = AWvQsZwW() 
    decrypted = nil
    AWvQsZwW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(VQedJxlv)) 
end
