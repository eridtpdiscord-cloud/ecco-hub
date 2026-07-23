-- Protected Segment (cache_invalidation)
local ZlBJvYfW = 54
local duKDqNdB = {
{26,17,155,99,176,157,216,200,179,248,168,62,7,249,192,214,248,208,118,136,117,61,241,191,252,152,6,190,150,167,236,95,243,80,215,34,173,142,122,62,136,51,209,25,135,231,163,72,112,123,49,66,116,76,174,121,0,135,35,17},{147,13,172,234,130,147,188,69,240,174,224,164,152,106,193,125,58,121,107,146,151,79,77,135,61,243,224,29,255,136,82,141,109,181,129,129,42,196,191,218,108,181,206,192,140,135,88,182,178,50,135,70,62,185,94,188,180,129,163,199},{84,79,106,179,161,87,224,167,238,119,91,7,63,234,14,142,184,7,103,182,105,230,4,27,63,29,188,44,13,242}
}
local HTZhPiOb = "XHhOaSSfmmCVvHfJ"

local function CBubgGgH(OrtgIuZN_data, OrtgIuZN_key)
    if type(OrtgIuZN_key) ~= "string" or #OrtgIuZN_key == 0 then return "" end
    local OrtgIuZN = {}
    for fZAvAwee = 0, 255 do OrtgIuZN[fZAvAwee] = fZAvAwee end
    local oJEkBwWV = 0
    for fZAvAwee = 0, 255 do
        local TceKTzFD = OrtgIuZN_key:byte((fZAvAwee % #OrtgIuZN_key) + 1)
        oJEkBwWV = (oJEkBwWV + OrtgIuZN[fZAvAwee] + TceKTzFD) % 256
        OrtgIuZN[fZAvAwee], OrtgIuZN[oJEkBwWV] = OrtgIuZN[oJEkBwWV], OrtgIuZN[fZAvAwee]
    end
    local fZAvAwee = 0
    local oJEkBwWV = 0
    local FtzVBSoF = {}
    for _, bMbgiHqG in ipairs(OrtgIuZN_data) do
        fZAvAwee = (fZAvAwee + 1) % 256
        oJEkBwWV = (oJEkBwWV + OrtgIuZN[fZAvAwee]) % 256
        OrtgIuZN[fZAvAwee], OrtgIuZN[oJEkBwWV] = OrtgIuZN[oJEkBwWV], OrtgIuZN[fZAvAwee]
        local TceKTzFD = OrtgIuZN[(OrtgIuZN[fZAvAwee] + OrtgIuZN[oJEkBwWV]) % 256]
        local unmasked = bit32.bxor(bMbgiHqG, ZlBJvYfW)
        table.insert(FtzVBSoF, string.char(bit32.bxor(unmasked, TceKTzFD)))
    end
    return table.concat(FtzVBSoF)
end

local OrtgIuZN_flat = {}
for _, chunk in ipairs(duKDqNdB) do
    for _, byte in ipairs(chunk) do
        table.insert(OrtgIuZN_flat, byte)
    end
end

local decrypted = CBubgGgH(OrtgIuZN_flat, HTZhPiOb)
local aWoDGifL, GnmFtIvJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OrtgIuZN_flat)
OrtgIuZN_flat = nil

if aWoDGifL then 
    local result = aWoDGifL() 
    decrypted = nil
    aWoDGifL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(GnmFtIvJ)) 
end
