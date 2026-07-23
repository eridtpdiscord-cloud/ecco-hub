-- Protected Segment (tween_library)
local RgGycSTj = 44
local aWWBeyCm = {
{96,177,190,1,215,249,6,73,217,33,16,78,126,119,254,15,132,246,115,82,173,76,30,71,55,150,211,132,239,57,209,241,201,41,126,183,210,93,151,122,143,84,176,111,184,194,230,3,42,153,88,96,66,10,218,70,148,91,41,235},{7,193,199,211,112,233,27,20,79,88,168,238,141,125,200,109,227,88,95,66,254,38,82,245,190,99,244,10,192,226,4,51,156,239,33,228,207,167,182,55,244,73,73,146,28,224,155,142,61,205,221,53,24,175,186,20,95,168,193,157},{90,107,222,71,76,9,198,250,103,84,248,76,88,179,87,159,214,124,88,58,118,130,143,128,17}
}
local gMekgWgJ = "GGHRHNzGcuftQrnF"

local function avvsgWsV(vJOJBrPd_data, vJOJBrPd_key)
    if type(vJOJBrPd_key) ~= "string" or #vJOJBrPd_key == 0 then return "" end
    local vJOJBrPd = {}
    for ObFSHCJk = 0, 255 do vJOJBrPd[ObFSHCJk] = ObFSHCJk end
    local PggbDDwo = 0
    for ObFSHCJk = 0, 255 do
        local QUcJRYJr = vJOJBrPd_key:byte((ObFSHCJk % #vJOJBrPd_key) + 1)
        PggbDDwo = (PggbDDwo + vJOJBrPd[ObFSHCJk] + QUcJRYJr) % 256
        vJOJBrPd[ObFSHCJk], vJOJBrPd[PggbDDwo] = vJOJBrPd[PggbDDwo], vJOJBrPd[ObFSHCJk]
    end
    local ObFSHCJk = 0
    local PggbDDwo = 0
    local yJBRIGSX = {}
    for _, pZUHNvlc in ipairs(vJOJBrPd_data) do
        ObFSHCJk = (ObFSHCJk + 1) % 256
        PggbDDwo = (PggbDDwo + vJOJBrPd[ObFSHCJk]) % 256
        vJOJBrPd[ObFSHCJk], vJOJBrPd[PggbDDwo] = vJOJBrPd[PggbDDwo], vJOJBrPd[ObFSHCJk]
        local QUcJRYJr = vJOJBrPd[(vJOJBrPd[ObFSHCJk] + vJOJBrPd[PggbDDwo]) % 256]
        local unmasked = bit32.bxor(pZUHNvlc, RgGycSTj)
        table.insert(yJBRIGSX, string.char(bit32.bxor(unmasked, QUcJRYJr)))
    end
    return table.concat(yJBRIGSX)
end

local vJOJBrPd_flat = {}
for _, chunk in ipairs(aWWBeyCm) do
    for _, byte in ipairs(chunk) do
        table.insert(vJOJBrPd_flat, byte)
    end
end

local decrypted = avvsgWsV(vJOJBrPd_flat, gMekgWgJ)
local GzuGRGNf, vDXyarez = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vJOJBrPd_flat)
vJOJBrPd_flat = nil

if GzuGRGNf then 
    local result = GzuGRGNf() 
    decrypted = nil
    GzuGRGNf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(vDXyarez)) 
end
