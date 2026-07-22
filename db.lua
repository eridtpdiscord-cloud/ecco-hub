-- Protected Segment (db)
local LjSVdENy = 143
local VdGkzIPc = {
{152,60,249,64,37,105,88,146,78,175,242,80,126,192,238,145,207,133,197,51,130,4,127,93,136,213,147,187,196,61,174,26,1,95,254,205,251,154,71,186,86,45,46,146,67,20,89,176,117,23,172,23,79,197,6,27,235,27,43,50},{167,150,71,201,0,202,154,58,20,25,239,76,49,28,15,122,101,125,64,24,158,211,187,73,110,121,37,235,245,4,187,154,8,127,36,201,40,125,70,81,14,87,157,82,88,214,9,222,207,104,13,29,156,103,34,190,66,55,9,176},{27,64,147,71,169,115,57,87,156,186,198,138,15,127,238,254,111,87,235,142,77,42,88,19,133,149,204,167,17,150,130,13,152,3,76,244,26,34,219,85,64,184,204,75,214,102,6,63,150,64,237,55,57,116,172,159,53,81,117,203},{3,25,40,55,111,110,136,75,80,124,83,212,186,217,44,4,196,13,125,173,236,91,178,124,93,180,201,191,22,205,55,228,74,34,112,253,63,235,72,112,138,175,96,46,106,90,213,92,153,140,98,74,77,84,110,180,138,162,116,228},{199,33,106,88,172,225,34,20,21,123,212,154,67,145,248,117,212,178,57,183,76,27,81,144,140,174,119,50,56,211,68,13,120,187,242,12,60,180,129,102,131,134,117,184,159,166,86,200,231,229,63,99,55,198,40,36,0,181,225,205},{229,52,127,223,217,191,92,173,64,240,165,254,156,49,188,27,218,12,73,196,103,47,98,136,61,115,125,144,58,51,70,206,1,170,63,69,134,13,45,96,10,187,207,52,237,44,34,239,238,196,225,218,237,219,4,150,116,239,194,182},{29,112,102,249,114,189,211,133,33,34,123,157,201,67,254,165,6,89,121,250,127,156,198,153,147,86,197,151,140,145,122,123,47,159,168,121,139,161,219,201,136,233,202,156,241,150,157,245,231,59,112,205,194,219,17,141,51,105,33,25},{119,133,212,162,187,58,241,150,204,151,67,9,37,253,223,249,37,143,223,63,244,50,87,132,166,239,56,75,23,143,170,115,84,21,218,163,93,194,56,241,188,162,173,157,247,225,171,90,10,120,220,96,103,179,122,77,36,53,250,68}
}
local hOYrYKRK = "HCesmvoYCzuTUrnR"

local function XAprkAat(VQmyhjju_data, VQmyhjju_key)
    local VQmyhjju = {}
    for JEhdunOV = 0, 255 do VQmyhjju[JEhdunOV] = JEhdunOV end
    local WqQqjTWx = 0
    for JEhdunOV = 0, 255 do
        local AzIhMoxC = VQmyhjju_key:byte((JEhdunOV % #VQmyhjju_key) + 1)
        WqQqjTWx = (WqQqjTWx + VQmyhjju[JEhdunOV] + AzIhMoxC) % 256
        VQmyhjju[JEhdunOV], VQmyhjju[WqQqjTWx] = VQmyhjju[WqQqjTWx], VQmyhjju[JEhdunOV]
    end
    local JEhdunOV = 0
    local WqQqjTWx = 0
    local jkIlGlBS = {}
    for _, CCcuqiQy in ipairs(VQmyhjju_data) do
        JEhdunOV = (JEhdunOV + 1) % 256
        WqQqjTWx = (WqQqjTWx + VQmyhjju[JEhdunOV]) % 256
        VQmyhjju[JEhdunOV], VQmyhjju[WqQqjTWx] = VQmyhjju[WqQqjTWx], VQmyhjju[JEhdunOV]
        local AzIhMoxC = VQmyhjju[(VQmyhjju[JEhdunOV] + VQmyhjju[WqQqjTWx]) % 256]
        local unmasked = bit32.bxor(CCcuqiQy, LjSVdENy)
        table.insert(jkIlGlBS, string.char(bit32.bxor(unmasked, AzIhMoxC)))
    end
    return table.concat(jkIlGlBS)
end

local VQmyhjju_flat = {}
for _, chunk in ipairs(VdGkzIPc) do
    for _, byte in ipairs(chunk) do
        table.insert(VQmyhjju_flat, byte)
    end
end

local decrypted = XAprkAat(VQmyhjju_flat, hOYrYKRK)
local piaAlLmF, qmFUVUzj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(VQmyhjju_flat)
VQmyhjju_flat = nil

if piaAlLmF then 
    local result = piaAlLmF() 
    decrypted = nil
    piaAlLmF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(qmFUVUzj)) 
end
