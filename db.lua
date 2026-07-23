-- Protected Segment (db)
local ailpEelF = 253
local hTbctbyP = {
{73,183,73,103,23,209,211,117,236,192,114,249,225,210,11,124,20,244,51,123,126,193,72,14,43,226,64,152,204,26,250,5,102,214,50,58,91,86,145,75,232,62,130,86,114,8,94,82,253,36,138,194,161,159,96,163,18,238,188,188},{17,223,137,83,35,221,1,99,110,147,46,23,206,227,103,8,51,190,85,135,47,242,105,5,111,187,218,94,60,88,184,250,72,61,65,138,212,50,250,63,11,220,46,66,68,78,41,235,252,252,233,75,238,255,241,219,189,98,80,116},{146,36,106,159,91,3,206,208,122,45,172,134,51,134,217,12,120,0,188,79,44,103,146,177,181,53,62,88,241,193,190,239,39,32,226,179,67,85,221,1,66,205,60,227,236,2,62,94,8,164,136,11,160,124,8,214,188,87,18,111},{212,54,85,132,73,50,210,240,78,4,234,29,197,81,225,61,127,255,66,65,137,12,170,123,245,184,244,245,121,191,14,152,92,138,127,41,43,179,216,87,25,159,122,22,168,175,227,168,2,9,189,83,14,253,152,63,216,57,46,154},{38,48,68,94,98,21,62,238,47,134,145,137,139,41,246,33,163,242,78,164,172,170,199,112,166,145,123,117,232,103,86,171,190,154,16,66,160,40,87,101,11,192,53,25,218,12,89,224,238,194,177,43,27,105,40,216,72,136,175,243},{244,14,90,113,172,237,116,99,225,109,97,18,163,45,130,209,137,143,154,179,255,116,17,2,107,35,223,116,86,33,32,43,223,200,78,247,156,186,129,20,90,126,69,21,205,160,220,59,34,210,149,253,1,32,236,252,47,253,210,212},{144,111,152,108,139,226,89,199,114,209,30,155,135,88,219,226,223,83,236,63,44,121,111,202,130,132,54,247,135,30,52,11,33,140,229,18,110,155,162,187,19,152,55,193,172,164,182,6,48,105,220,237,64,91,245,86,0,95,2,101},{123,231,158,3,80,41,241,159,108,225,152,123,135,22,249,184,161,144,79,164,98,36,10,90,132,107,249,146,122,185,180,175,195,117,202,21,15,200,208,252,58,62,53,235,241,90,29,162,207,29,37,99,219,114,212,101,111,84,24}
}
local KwfgBogM = "ZwWqBNjjCWqZmsZP"

local function pOwTTQMv(CfqZJwnB_data, CfqZJwnB_key)
    if type(CfqZJwnB_key) ~= "string" or #CfqZJwnB_key == 0 then return "" end
    local CfqZJwnB = {}
    for jUkEXFFH = 0, 255 do CfqZJwnB[jUkEXFFH] = jUkEXFFH end
    local nGHdMcqx = 0
    for jUkEXFFH = 0, 255 do
        local YzcYvsUP = CfqZJwnB_key:byte((jUkEXFFH % #CfqZJwnB_key) + 1)
        nGHdMcqx = (nGHdMcqx + CfqZJwnB[jUkEXFFH] + YzcYvsUP) % 256
        CfqZJwnB[jUkEXFFH], CfqZJwnB[nGHdMcqx] = CfqZJwnB[nGHdMcqx], CfqZJwnB[jUkEXFFH]
    end
    local jUkEXFFH = 0
    local nGHdMcqx = 0
    local LdgKNsvE = {}
    for _, huwwPYzL in ipairs(CfqZJwnB_data) do
        jUkEXFFH = (jUkEXFFH + 1) % 256
        nGHdMcqx = (nGHdMcqx + CfqZJwnB[jUkEXFFH]) % 256
        CfqZJwnB[jUkEXFFH], CfqZJwnB[nGHdMcqx] = CfqZJwnB[nGHdMcqx], CfqZJwnB[jUkEXFFH]
        local YzcYvsUP = CfqZJwnB[(CfqZJwnB[jUkEXFFH] + CfqZJwnB[nGHdMcqx]) % 256]
        local unmasked = bit32.bxor(huwwPYzL, ailpEelF)
        table.insert(LdgKNsvE, string.char(bit32.bxor(unmasked, YzcYvsUP)))
    end
    return table.concat(LdgKNsvE)
end

local CfqZJwnB_flat = {}
for _, chunk in ipairs(hTbctbyP) do
    for _, byte in ipairs(chunk) do
        table.insert(CfqZJwnB_flat, byte)
    end
end

local decrypted = pOwTTQMv(CfqZJwnB_flat, KwfgBogM)
local GTNucUvO, PHpVsqXK = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CfqZJwnB_flat)
CfqZJwnB_flat = nil

if GTNucUvO then 
    local result = GTNucUvO() 
    decrypted = nil
    GTNucUvO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(PHpVsqXK)) 
end
