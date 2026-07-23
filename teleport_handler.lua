-- Protected Segment (teleport_handler)
local BbThJGjE = 193
local EIyNvypt = {
{115,145,235,2,65,198,190,142,67,192,243,195,190,61,218,220,110,134,71,165,60,75,174,202,165,169,1,225,77,220,198,132,165,92,65,61,13,72,215,31,118,230,168,181,222,3,127,147,88,191,246,38,17,174,10,90,238,61,21,190},{148,183,183,227,4,203,48,238,80,32,55,67,195,16,56,237,3,21,54,136,45,221,160,222,143,101,57,206,51,90,200,207,250,156,80,88,39,149,122,178,251,199,52,53,54,235,2,152,215,166,205,5,244,185,174,13,244,235,184,105},{52,68,155,28,69,177,42,73,105,92,137,255,241,207,238,179,148,84,244,186,61,54,118,103,106,83,83,131}
}
local WEHOJQjn = "outMsGSkDQKAyyao"

local function VdCVcupT(jjXYYSxy_data, jjXYYSxy_key)
    if type(jjXYYSxy_key) ~= "string" or #jjXYYSxy_key == 0 then return "" end
    local jjXYYSxy = {}
    for lULoeKrS = 0, 255 do jjXYYSxy[lULoeKrS] = lULoeKrS end
    local xtbHpjdK = 0
    for lULoeKrS = 0, 255 do
        local vooqBSjZ = jjXYYSxy_key:byte((lULoeKrS % #jjXYYSxy_key) + 1)
        xtbHpjdK = (xtbHpjdK + jjXYYSxy[lULoeKrS] + vooqBSjZ) % 256
        jjXYYSxy[lULoeKrS], jjXYYSxy[xtbHpjdK] = jjXYYSxy[xtbHpjdK], jjXYYSxy[lULoeKrS]
    end
    local lULoeKrS = 0
    local xtbHpjdK = 0
    local cslQVaPj = {}
    for _, fOQBLZOc in ipairs(jjXYYSxy_data) do
        lULoeKrS = (lULoeKrS + 1) % 256
        xtbHpjdK = (xtbHpjdK + jjXYYSxy[lULoeKrS]) % 256
        jjXYYSxy[lULoeKrS], jjXYYSxy[xtbHpjdK] = jjXYYSxy[xtbHpjdK], jjXYYSxy[lULoeKrS]
        local vooqBSjZ = jjXYYSxy[(jjXYYSxy[lULoeKrS] + jjXYYSxy[xtbHpjdK]) % 256]
        local unmasked = bit32.bxor(fOQBLZOc, BbThJGjE)
        table.insert(cslQVaPj, string.char(bit32.bxor(unmasked, vooqBSjZ)))
    end
    return table.concat(cslQVaPj)
end

local jjXYYSxy_flat = {}
for _, chunk in ipairs(EIyNvypt) do
    for _, byte in ipairs(chunk) do
        table.insert(jjXYYSxy_flat, byte)
    end
end

local decrypted = VdCVcupT(jjXYYSxy_flat, WEHOJQjn)
local euhuMeph, hFNyBHwq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jjXYYSxy_flat)
jjXYYSxy_flat = nil

if euhuMeph then 
    local result = euhuMeph() 
    decrypted = nil
    euhuMeph = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(hFNyBHwq)) 
end
