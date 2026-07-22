-- Protected Segment (db)
local ZZJHuGRY = 151
local GXdzDVEN = {
{191,237,73,0,243,74,114,230,1,135,172,20,69,167,250,99,159,131,23,36,179,154,123,125,138,136,119,48,226,211,104,205,89,100,170,146,203,46,216,216,88,91,135,130,111,177,107,170,174,36,128,53,104,163,212,236,189,166,148,188},{206,203,7,184,179,85,48,25,244,143,155,237,204,224,104,0,172,227,63,113,91,254,135,146,158,200,192,251,92,10,99,140,11,187,45,225,21,48,236,92,64,12,38,181,240,120,206,230,35,127,237,40,37,82,153,134,97,138,26,73},{43,133,245,123,146,240,75,123,73,119,56,86,79,125,28,208,234,76,18,243,218,5,108,73,176,3,121,95,35,26,125,66,167,43,179,33,153,158,177,99,108,21,173,141,82,26,173,110,214,107,171,79,173,122,160,142,223,12,153,170},{223,196,206,34,26,210,179,145,197,187,167,246,184,10,41,173,112,58,220,123,239,153,73,14,2,22,71,80,111,27,113,169,197,110,124,20,180,255,41,82,38,55,94,90,160,249,202,75,255,251,168,132,100,80,47,45,196,223,11,195},{145,124,151,244,96,26,145,133,153,61,75,158,35,241,24,162,179,117,24,62,109,20,242,212,38,17,7,5,25,233,52,126,12,142,237,6,63,24,224,254,36,189,109,165,21,102,115,4,248,133,53,194,0,15,152,7,145,137,126,240},{80,121,226,134,69,47,108,48,97,184,131,79,138,242,184,104,199,94,74,114,35,163,165,46,135,251,195,56,199,176,91,225,246,63,29,47,240,32,151,134,154,109,209,46,209,155,55,225,43,254,135,117,9,67,11,198,189,55,146,116},{193,179,241,72,0,74,101,37,23,201,162,74,223,33,94,240,16,14,193,87,58,50,212,13,246,36,90,165,37,88,144,220,251,93,61,37,92,242,135,125,75,8,48,230,91,246,139,19,0,160,143,122,5,103,1,206,249,15,9,114},{204,46,155,248,249,200,251,207,160,107,132,199,151,63,32,116,93,59,203,122,209,66,82,113,106,139,125,135,132,224,78,150,178,193,22,152,253,190,56,249,109,129,73,181,107,106,105,203,127,28,3,164,226,52,86,74,33,91,36,201}
}
local PukFhyiO = "igjiKyKpyYVEnxXL"

local function NLVXJTHM(fZDMzRnY_data, fZDMzRnY_key)
    local fZDMzRnY = {}
    for PyEvizKn = 0, 255 do fZDMzRnY[PyEvizKn] = PyEvizKn end
    local rzfdWjFx = 0
    for PyEvizKn = 0, 255 do
        local uLZhcfTP = fZDMzRnY_key:byte((PyEvizKn % #fZDMzRnY_key) + 1)
        rzfdWjFx = (rzfdWjFx + fZDMzRnY[PyEvizKn] + uLZhcfTP) % 256
        fZDMzRnY[PyEvizKn], fZDMzRnY[rzfdWjFx] = fZDMzRnY[rzfdWjFx], fZDMzRnY[PyEvizKn]
    end
    local PyEvizKn = 0
    local rzfdWjFx = 0
    local nJWvcKOU = {}
    for _, EunHWnrf in ipairs(fZDMzRnY_data) do
        PyEvizKn = (PyEvizKn + 1) % 256
        rzfdWjFx = (rzfdWjFx + fZDMzRnY[PyEvizKn]) % 256
        fZDMzRnY[PyEvizKn], fZDMzRnY[rzfdWjFx] = fZDMzRnY[rzfdWjFx], fZDMzRnY[PyEvizKn]
        local uLZhcfTP = fZDMzRnY[(fZDMzRnY[PyEvizKn] + fZDMzRnY[rzfdWjFx]) % 256]
        local unmasked = bit32.bxor(EunHWnrf, ZZJHuGRY)
        table.insert(nJWvcKOU, string.char(bit32.bxor(unmasked, uLZhcfTP)))
    end
    return table.concat(nJWvcKOU)
end

local fZDMzRnY_flat = {}
for _, chunk in ipairs(GXdzDVEN) do
    for _, byte in ipairs(chunk) do
        table.insert(fZDMzRnY_flat, byte)
    end
end

local decrypted = NLVXJTHM(fZDMzRnY_flat, PukFhyiO)
local PjxoraaO, jTCavtcu = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fZDMzRnY_flat)
fZDMzRnY_flat = nil

if PjxoraaO then 
    local result = PjxoraaO() 
    decrypted = nil
    PjxoraaO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(jTCavtcu)) 
end
