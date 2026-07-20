-- Compiled secure segment
local HQOwTjQm = {
{165,27,142,202,182,227,38,235,149,37,105,119,44,103,211,167,216,120,243,121,181,131,2,69,242,228,100,14,198,155,169,53,241,4,49,203,163,96,231,153,224,246,75,73,88,180,151,244,253,249,233,213,97,84,244,42,59,76,80,42},{51,209,148,8,138,128,192,254,166,228,178,31,61,52,166,45,112,11,4,42,229,40,118,87,148,181,163,119,213,208,68,238,55,175,210,190,69,117,176,157,38,94,93,22,13,196,141,170,64,41,19,194,253,218,16,175,199,254,70,205},{86,7,89,174,19,67,22,116,152,34,78,23,195,6,132,92,195,18,17,84,170,202,143,74,229,241,15,220,17,171,121,44,101,176,76,38,164,225,149,190,134,89,233,198,14,212,60,144,71,40,156,247,160,242,201,171,23,90,136,205},{183,46,5,182,66,47,119,223,232,214,2,246,184,126,78,248,163,213,140,106,3,169,231,197,138,131,84,55,110,144,201,78,12,92,57,219,90,113,128,41,160,202,102,18,163,202,23,124,212,55,223,244,178,227,217,4,75,139,101,152},{98,170,128,90,168,216,139,176,108,219,180,2,164,61,209,233,67,176,1,39,84,31,146,50,217,230,70,73,164,60,237,209,187,103,7,105,49,133,118,250,218,226,212,51,208,185,94,75,169,186,252,242,160,121,75,177,111,90,242,230},{100,77,95,185,102,201,205,112,92,108,186,198,88,233,168,186,106,236,80,38,197,140,103,182,21,168,192,221,206,214,28,107,250,214,108,55,166,185,241,106,116,95,162,219,52,140,9,193,30,93,57,155,83,3,42,20,116,3,74,205},{153,212,63,241,86,98,229,47,126,210,157,47,200,131,8,214,141,64,81,15,91,147,204,86,232,176,41,101,179,24,131,144,36,52,9,157,225,17,78,242,224,58,97,93,89,182,169}
}
local cblIsroV = "AJVQjYsPGydRKOfq"

local function LSACTuba(xrMXiObe_data, xrMXiObe_key)
    local xrMXiObe = {}
    for Lidglnyv = 0, 255 do xrMXiObe[Lidglnyv] = Lidglnyv end
    local fDUbdfss = 0
    for Lidglnyv = 0, 255 do
        local NueQuXUw = xrMXiObe_key:byte((Lidglnyv % #xrMXiObe_key) + 1)
        fDUbdfss = (fDUbdfss + xrMXiObe[Lidglnyv] + NueQuXUw) % 256
        xrMXiObe[Lidglnyv], xrMXiObe[fDUbdfss] = xrMXiObe[fDUbdfss], xrMXiObe[Lidglnyv]
    end
    local Lidglnyv = 0
    local fDUbdfss = 0
    local jOpROgiG = {}
    for _, ZQoytqIt in ipairs(xrMXiObe_data) do
        Lidglnyv = (Lidglnyv + 1) % 256
        fDUbdfss = (fDUbdfss + xrMXiObe[Lidglnyv]) % 256
        xrMXiObe[Lidglnyv], xrMXiObe[fDUbdfss] = xrMXiObe[fDUbdfss], xrMXiObe[Lidglnyv]
        local NueQuXUw = xrMXiObe[(xrMXiObe[Lidglnyv] + xrMXiObe[fDUbdfss]) % 256]
        table.insert(jOpROgiG, string.char(bit32.bxor(ZQoytqIt, NueQuXUw)))
    end
    return table.concat(jOpROgiG)
end

local xrMXiObe_flat = {}
for _, chunk in ipairs(HQOwTjQm) do
    for _, byte in ipairs(chunk) do
        table.insert(xrMXiObe_flat, byte)
    end
end

local decrypted = LSACTuba(xrMXiObe_flat, cblIsroV)
local gGhVhIXu, dgcwDRIT = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(xrMXiObe_flat)
xrMXiObe_flat = nil

if gGhVhIXu then 
    local result = gGhVhIXu() 
    decrypted = nil
    gGhVhIXu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(dgcwDRIT)) 
end
