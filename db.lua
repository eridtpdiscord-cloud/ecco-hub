-- Protected Segment (db)
local KmNZwwhS = 24
local RIavtSxZ = {
{251,212,166,176,221,4,96,200,207,103,150,178,35,117,189,84,252,78,94,92,184,17,127,192,125,174,75,28,203,178,117,51,235,163,230,247,215,244,31,218,213,129,0,229,107,5,16,134,156,164,98,23,29,198,241,236,150,106,22,196},{82,120,100,232,161,101,137,71,73,89,11,97,108,39,152,80,178,178,177,51,137,114,155,201,198,102,151,207,102,211,48,46,189,181,1,117,40,140,164,127,247,16,98,156,138,28,216,159,146,102,46,210,48,36,188,219,244,21,210,82},{131,71,59,86,6,0,208,251,250,249,224,213,139,84,16,169,39,65,71,63,156,174,205,25,168,107,19,51,126,162,123,126,246,230,43,97,14,187,18,188,159,84,157,42,221,13,211,211,59,164,10,250,61,137,218,248,253,152,105,173},{105,41,235,29,216,208,135,240,189,108,6,49,35,170,37,56,140,158,56,101,177,15,89,176,13,89,109,59,228,238,125,97,76,215,67,22,15,49,195,172,220,43,154,219,123,34,88,175,100,83,242,206,36,140,43,69,156,24,165,107},{93,65,115,167,207,203,7,211,206,186,223,163,31,248,175,185,114,171,129,176,103,67,96,208,206,78,164,202,126,76,6,118,225,144,29,173,131,215,153,6,209,27,229,202,7,139,242,111,165,8,24,185,93,131,255,44,223,102,85,62},{133,211,131,27,82,61,156,18,185,172,69,80,223,217,54,143,110,146,78,2,235,158,29,179,85,165,221,33,11,82,44,182,62,165,91,60,250,35,127,9,55,3,81,195,112,100,158,249,237,142,245,52,88,52,203,208,209,66,96,245},{52,216,182,238,43,123,34,160,33,98,222,94,162,118,152,110,75,117,41,111,18,170,95,126,213,242,178,241,81,198,108,48,134,128,56,165,24,166,211,215,88,227,179,66,97,200}
}
local pcGdvvZT = "YPSvPlugwAjuGbIA"

local function TzEgrOUj(ORmWUvny_data, ORmWUvny_key)
    local ORmWUvny = {}
    for mqWERYhp = 0, 255 do ORmWUvny[mqWERYhp] = mqWERYhp end
    local uJbKfSBc = 0
    for mqWERYhp = 0, 255 do
        local QaPVLKAL = ORmWUvny_key:byte((mqWERYhp % #ORmWUvny_key) + 1)
        uJbKfSBc = (uJbKfSBc + ORmWUvny[mqWERYhp] + QaPVLKAL) % 256
        ORmWUvny[mqWERYhp], ORmWUvny[uJbKfSBc] = ORmWUvny[uJbKfSBc], ORmWUvny[mqWERYhp]
    end
    local mqWERYhp = 0
    local uJbKfSBc = 0
    local AKAjeVIr = {}
    for _, AAxJSuHh in ipairs(ORmWUvny_data) do
        mqWERYhp = (mqWERYhp + 1) % 256
        uJbKfSBc = (uJbKfSBc + ORmWUvny[mqWERYhp]) % 256
        ORmWUvny[mqWERYhp], ORmWUvny[uJbKfSBc] = ORmWUvny[uJbKfSBc], ORmWUvny[mqWERYhp]
        local QaPVLKAL = ORmWUvny[(ORmWUvny[mqWERYhp] + ORmWUvny[uJbKfSBc]) % 256]
        local unmasked = bit32.bxor(AAxJSuHh, KmNZwwhS)
        table.insert(AKAjeVIr, string.char(bit32.bxor(unmasked, QaPVLKAL)))
    end
    return table.concat(AKAjeVIr)
end

local ORmWUvny_flat = {}
for _, chunk in ipairs(RIavtSxZ) do
    for _, byte in ipairs(chunk) do
        table.insert(ORmWUvny_flat, byte)
    end
end

local decrypted = TzEgrOUj(ORmWUvny_flat, pcGdvvZT)
local ZyZbQVTj, GGFakazP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ORmWUvny_flat)
ORmWUvny_flat = nil

if ZyZbQVTj then 
    local result = ZyZbQVTj() 
    decrypted = nil
    ZyZbQVTj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(GGFakazP)) 
end
