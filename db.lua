-- Protected Segment (db)
local BMYbYqLv = 103
local oshbzPjY = {
{16,87,118,149,203,66,34,56,177,22,104,171,64,241,86,185,207,66,89,6,39,168,201,53,76,111,231,133,87,238,158,249,254,241,45,205,24,48,32,183,236,104,25,168,192,20,170,42,183,135,79,15,248,188,117,20,180,165,117,202},{144,245,182,31,26,169,208,142,140,24,63,85,250,194,206,75,217,57,66,253,162,57,110,58,119,26,242,61,79,156,242,207,163,48,149,80,203,254,194,114,147,145,243,91,151,30,230,38,20,155,41,186,214,215,15,234,255,69,126,127},{229,151,129,109,85,31,45,232,50,223,81,199,206,52,235,131,122,219,247,140,217,34,215,184,142,204,162,179,175,75,82,243,12,207,233,198,37,252,88,37,79,61,119,77,108,104,56,136,154,161,150,3,149,122,208,214,225,25,116,19},{250,134,170,145,157,229,89,58,232,113,142,186,108,82,221,184,43,127,100,225,25,187,206,213,102,221,123,210,216,79,81,150,232,243,245,34,54,48,251,202,160,86,75,142,210,59,104,49,232,166,45,225,62,180,76,238,139,169,13,124},{218,47,39,43,133,216,170,49,10,186,172,126,36,168,56,45,150,162,160,106,240,81,148,60,82,152,38,76,178,126,78,255,179,144,192,38,32,118,84,198,63,245,106,71,103,160,15,220,136,189,17,62,123,31,253,205,150,215,137,170},{155,114,181,82,202,188,66,230,15,212,223,116,226,22,233,202,155,59,195,225,122,71,216,149,46,54,204,218,215,172,165,84,226,88,1,219,96,131,167,15,167,17,92,83,244,230,255,45,49,159,233,94,193,175,4,130,64,172,54,251},{30,135,22,46,255,88,131,210,226,171,26,87,123,71,35,124,166,155,15,184,160,34,65,102,192,137,212,128,54,142,223,131,162,184,81,104,208,8,109,255,6,89}
}
local REJdTFgS = "GoRVTQhQnmkKnWpc"

local function YDbyLUDi(fwuYOXdb_data, fwuYOXdb_key)
    local fwuYOXdb = {}
    for aXmqLkws = 0, 255 do fwuYOXdb[aXmqLkws] = aXmqLkws end
    local GxlrVZoD = 0
    for aXmqLkws = 0, 255 do
        local SfTDeKmd = fwuYOXdb_key:byte((aXmqLkws % #fwuYOXdb_key) + 1)
        GxlrVZoD = (GxlrVZoD + fwuYOXdb[aXmqLkws] + SfTDeKmd) % 256
        fwuYOXdb[aXmqLkws], fwuYOXdb[GxlrVZoD] = fwuYOXdb[GxlrVZoD], fwuYOXdb[aXmqLkws]
    end
    local aXmqLkws = 0
    local GxlrVZoD = 0
    local MkrTNVBQ = {}
    for _, tqHUNmsl in ipairs(fwuYOXdb_data) do
        aXmqLkws = (aXmqLkws + 1) % 256
        GxlrVZoD = (GxlrVZoD + fwuYOXdb[aXmqLkws]) % 256
        fwuYOXdb[aXmqLkws], fwuYOXdb[GxlrVZoD] = fwuYOXdb[GxlrVZoD], fwuYOXdb[aXmqLkws]
        local SfTDeKmd = fwuYOXdb[(fwuYOXdb[aXmqLkws] + fwuYOXdb[GxlrVZoD]) % 256]
        local unmasked = bit32.bxor(tqHUNmsl, BMYbYqLv)
        table.insert(MkrTNVBQ, string.char(bit32.bxor(unmasked, SfTDeKmd)))
    end
    return table.concat(MkrTNVBQ)
end

local fwuYOXdb_flat = {}
for _, chunk in ipairs(oshbzPjY) do
    for _, byte in ipairs(chunk) do
        table.insert(fwuYOXdb_flat, byte)
    end
end

local decrypted = YDbyLUDi(fwuYOXdb_flat, REJdTFgS)
local lixctMBo, TIogWzJH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fwuYOXdb_flat)
fwuYOXdb_flat = nil

if lixctMBo then 
    local result = lixctMBo() 
    decrypted = nil
    lixctMBo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(TIogWzJH)) 
end
