-- Protected Segment (teleport_handler)
local AczJwmHM = 88
local yVWSEiaj = {
{247,1,134,236,64,160,155,29,12,67,8,181,201,194,69,141,16,206,165,226,3,2,245,189,132,36,44,137,42,150,152,101,96,79,174,225,7,156,20,101,62,237,92,226,204,172,116,73,53,186,126,196,189,34,118,54,153,154,73,84},{112,165,25,136,16,104,231,236,122,35,89,99,144,125,168,153,146,250,11,192,149,113,94,164,190,54,106,102,185,214,227,182,51,167,198,142,165,210,84,123,142,65,71,25,183,126,47,102,203,22,136,209,245,178,115,64,246,227,54,55},{133,173,141,191,237,18,216,94,65,189,158,35,146,79,137,128,249,50,155,4,77,93,41,132,77,171,254,150}
}
local EtJWUDPJ = "HEorPzNNzHhFEzrL"

local function nSHTafln(yvriwcwn_data, yvriwcwn_key)
    if type(yvriwcwn_key) ~= "string" or #yvriwcwn_key == 0 then return "" end
    local yvriwcwn = {}
    for TWQQhIGu = 0, 255 do yvriwcwn[TWQQhIGu] = TWQQhIGu end
    local IAMBadbU = 0
    for TWQQhIGu = 0, 255 do
        local kptiNnuh = yvriwcwn_key:byte((TWQQhIGu % #yvriwcwn_key) + 1)
        IAMBadbU = (IAMBadbU + yvriwcwn[TWQQhIGu] + kptiNnuh) % 256
        yvriwcwn[TWQQhIGu], yvriwcwn[IAMBadbU] = yvriwcwn[IAMBadbU], yvriwcwn[TWQQhIGu]
    end
    local TWQQhIGu = 0
    local IAMBadbU = 0
    local fLUOwuPa = {}
    for _, uRKKCXJj in ipairs(yvriwcwn_data) do
        TWQQhIGu = (TWQQhIGu + 1) % 256
        IAMBadbU = (IAMBadbU + yvriwcwn[TWQQhIGu]) % 256
        yvriwcwn[TWQQhIGu], yvriwcwn[IAMBadbU] = yvriwcwn[IAMBadbU], yvriwcwn[TWQQhIGu]
        local kptiNnuh = yvriwcwn[(yvriwcwn[TWQQhIGu] + yvriwcwn[IAMBadbU]) % 256]
        local unmasked = bit32.bxor(uRKKCXJj, AczJwmHM)
        table.insert(fLUOwuPa, string.char(bit32.bxor(unmasked, kptiNnuh)))
    end
    return table.concat(fLUOwuPa)
end

local yvriwcwn_flat = {}
for _, chunk in ipairs(yVWSEiaj) do
    for _, byte in ipairs(chunk) do
        table.insert(yvriwcwn_flat, byte)
    end
end

local decrypted = nSHTafln(yvriwcwn_flat, EtJWUDPJ)
local dOEoXRsi, HcTTyRxP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yvriwcwn_flat)
yvriwcwn_flat = nil

if dOEoXRsi then 
    local result = dOEoXRsi() 
    decrypted = nil
    dOEoXRsi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(HcTTyRxP)) 
end
