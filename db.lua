-- Protected Segment (db)
local TeHbNaXx = 19
local zflpwyEJ = {
{15,114,111,183,208,24,98,254,5,246,190,126,162,223,77,93,97,187,208,177,178,148,135,245,48,111,247,82,214,186,49,210,180,136,252,16,237,210,236,185,113,123,71,110,139,20,124,158,114,194,118,78,50,133,146,199,81,128,118,173},{4,74,208,61,226,241,111,76,84,216,62,62,202,254,54,183,115,198,37,40,255,215,101,21,165,212,190,17,227,57,255,162,177,168,67,76,253,25,44,125,206,120,1,168,140,149,206,157,200,120,38,149,193,190,148,187,160,94,221,234},{220,246,156,240,96,48,209,106,39,14,169,192,238,222,172,143,188,166,18,241,204,208,52,232,207,213,66,6,158,216,247,107,184,200,27,137,239,179,219,41,18,189,159,74,223,128,86,143,52,97,175,95,61,67,99,137,42,172,96,225},{180,20,89,92,61,219,146,90,82,9,103,31,114,4,97,93,61,40,36,192,139,231,202,177,149,108,199,118,107,15,76,81,216,208,46,148,202,156,217,33,83,92,26,91,142,31,74,109,126,114,9,186,6,28,246,5,54,77,89,229},{155,119,82,145,31,200,84,59,31,126,148,16,173,221,190,127,137,101,77,243,180,77,243,224,86,218,105,218,219,95,4,207,226,119,116,224,112,46,225,2,90,125,217,48,76,17,36,102,74,24,163,50,44,20,67,127,188,67,6,162},{150,193,26,177,123,160,217,63,248,40,3,213,153,68,205,123,62,66,187,196,16,215,20,205,164,52,43,243,105,116,80,222,166,160,10,103,126,237,21,218,17,198,128,142,91,234,170,223,254,253,52,155,157,118,21,222,174,200,108,201},{17,251,174,62,2,117,239,252,178,78,163,229,145,48,214,120,211,113,56,173,117,146,24,111,134,20,20,95,189,139,192,83,210,248,155,106,196,31,193,92,239,131,88,242,52,59,252,155,133,119,229,154,165,202,138,151,99,159,204,179},{255,204,141,118,57,95,14,82,48,228,85,169,49,116,155,243,35,154,222,20,176,96,137,26,175,61,227,117,198,253,133,249,5,199,7,118,185,244,79,145,106,205,165,41,251,56,194,82,104,18,214,82,50,119,120,28,101,83,160}
}
local osUCUVSx = "tnziTBkTeVxUBski"

local function HpoMzBvf(uFrdfbCZ_data, uFrdfbCZ_key)
    if type(uFrdfbCZ_key) ~= "string" or #uFrdfbCZ_key == 0 then return "" end
    local uFrdfbCZ = {}
    for NsGaNJhb = 0, 255 do uFrdfbCZ[NsGaNJhb] = NsGaNJhb end
    local USQUVThO = 0
    for NsGaNJhb = 0, 255 do
        local SGeQcGib = uFrdfbCZ_key:byte((NsGaNJhb % #uFrdfbCZ_key) + 1)
        USQUVThO = (USQUVThO + uFrdfbCZ[NsGaNJhb] + SGeQcGib) % 256
        uFrdfbCZ[NsGaNJhb], uFrdfbCZ[USQUVThO] = uFrdfbCZ[USQUVThO], uFrdfbCZ[NsGaNJhb]
    end
    local NsGaNJhb = 0
    local USQUVThO = 0
    local ySdsmCad = {}
    for _, pHVRHvVW in ipairs(uFrdfbCZ_data) do
        NsGaNJhb = (NsGaNJhb + 1) % 256
        USQUVThO = (USQUVThO + uFrdfbCZ[NsGaNJhb]) % 256
        uFrdfbCZ[NsGaNJhb], uFrdfbCZ[USQUVThO] = uFrdfbCZ[USQUVThO], uFrdfbCZ[NsGaNJhb]
        local SGeQcGib = uFrdfbCZ[(uFrdfbCZ[NsGaNJhb] + uFrdfbCZ[USQUVThO]) % 256]
        local unmasked = bit32.bxor(pHVRHvVW, TeHbNaXx)
        table.insert(ySdsmCad, string.char(bit32.bxor(unmasked, SGeQcGib)))
    end
    return table.concat(ySdsmCad)
end

local uFrdfbCZ_flat = {}
for _, chunk in ipairs(zflpwyEJ) do
    for _, byte in ipairs(chunk) do
        table.insert(uFrdfbCZ_flat, byte)
    end
end

local decrypted = HpoMzBvf(uFrdfbCZ_flat, osUCUVSx)
local hdewrZgU, eWXNLdiw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(uFrdfbCZ_flat)
uFrdfbCZ_flat = nil

if hdewrZgU then 
    local result = hdewrZgU() 
    decrypted = nil
    hdewrZgU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(eWXNLdiw)) 
end
