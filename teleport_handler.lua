-- Protected Segment (teleport_handler)
local pwKghYHR = 86
local agDjqZRC = {
{139,22,76,72,237,23,87,121,184,125,229,177,129,65,101,239,140,238,192,34,56,205,20,113,192,203,60,30,36,172,136,91,32,47,202,182,100,66,32,38,141,68,248,44,75,207,2,50,224,150,150,48,98,46,145,118,141,226,120,102},{237,15,18,105,61,211,92,250,86,23,62,59,186,126,171,19,223,115,203,15,207,206,114,75,49,143,96,90,236,252,246,209,21,123,62,195,199,79,247,57,158,1,61,103,236,206,194,191,48,88,239,252,48,152,17,163,112,136,243,141},{83,181,33,57,38,47,173,151,208,197,42,146,86,250,122,29,234,171,168,79,218,138,92,181,61,7,56,21}
}
local JHoZLzEz = "hRNMptIuhQWlypWq"

local function QyMxPjfI(MECiAPkg_data, MECiAPkg_key)
    if type(MECiAPkg_key) ~= "string" or #MECiAPkg_key == 0 then return "" end
    local MECiAPkg = {}
    for ppzoXiyo = 0, 255 do MECiAPkg[ppzoXiyo] = ppzoXiyo end
    local SPPMfIdZ = 0
    for ppzoXiyo = 0, 255 do
        local OXzbycly = MECiAPkg_key:byte((ppzoXiyo % #MECiAPkg_key) + 1)
        SPPMfIdZ = (SPPMfIdZ + MECiAPkg[ppzoXiyo] + OXzbycly) % 256
        MECiAPkg[ppzoXiyo], MECiAPkg[SPPMfIdZ] = MECiAPkg[SPPMfIdZ], MECiAPkg[ppzoXiyo]
    end
    local ppzoXiyo = 0
    local SPPMfIdZ = 0
    local xZVgdncF = {}
    for _, cunogQnN in ipairs(MECiAPkg_data) do
        ppzoXiyo = (ppzoXiyo + 1) % 256
        SPPMfIdZ = (SPPMfIdZ + MECiAPkg[ppzoXiyo]) % 256
        MECiAPkg[ppzoXiyo], MECiAPkg[SPPMfIdZ] = MECiAPkg[SPPMfIdZ], MECiAPkg[ppzoXiyo]
        local OXzbycly = MECiAPkg[(MECiAPkg[ppzoXiyo] + MECiAPkg[SPPMfIdZ]) % 256]
        local unmasked = bit32.bxor(cunogQnN, pwKghYHR)
        table.insert(xZVgdncF, string.char(bit32.bxor(unmasked, OXzbycly)))
    end
    return table.concat(xZVgdncF)
end

local MECiAPkg_flat = {}
for _, chunk in ipairs(agDjqZRC) do
    for _, byte in ipairs(chunk) do
        table.insert(MECiAPkg_flat, byte)
    end
end

local decrypted = QyMxPjfI(MECiAPkg_flat, JHoZLzEz)
local TXFHBgQu, ZigzMhpf = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MECiAPkg_flat)
MECiAPkg_flat = nil

if TXFHBgQu then 
    local result = TXFHBgQu() 
    decrypted = nil
    TXFHBgQu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(ZigzMhpf)) 
end
