-- Compiled secure segment
local yCClSfPv = {
{148,250,138,134,210,168,31,161,60,23,128,192,142,214,179,5,4,74,219,109,65,62,0,81,50,96,210,118,185,129,1,3,190,144,196,5,128,213,238,195,6,39,164,181,90,208,157,34,144,239,181,169,73,184,26,148,161,8,160,102},{139,97,191,115,91,113,190,249,239,13,169,241,99,31,215,26,102,59,155,36,46,208,239,185,7,243,210,184,95,18,80,195,76,83,50,154,101,69,46,60,202,231,91,248,107,34,102,172,150,164,175,27,137,111,213,129,245,110,251,119},{70,109,93,5,55,28,255,218,224,76,26,108,218,88,178,109,177,8,182,48,14,150,187,146,253,223,96,47,229,32,135,235,233,16,43,156,102,252,248,163,40,25,212,10,231,214,66,59,88,28,96,131,232,48,143,179,71,16,86,168},{185,124,205,144,210,22,45,148,43,235,205,117,32,60,233,54,99,17,72,178,222,35,160,1,70,100,112,87,87,235,47,76,231,171,173,165,85,51,103,213,141,9,59,202,209,141,79,166,137,251,130,103,241,249,137,71}
}
local bsGtHPqL = "WYzKtKWMaaxhgLob"

local function AikRDgpy(mctZtosg_data, mctZtosg_key)
    local mctZtosg = {}
    for RzbtzVVo = 0, 255 do mctZtosg[RzbtzVVo] = RzbtzVVo end
    local zKebacph = 0
    for RzbtzVVo = 0, 255 do
        local eLGaqfuz = mctZtosg_key:byte((RzbtzVVo % #mctZtosg_key) + 1)
        zKebacph = (zKebacph + mctZtosg[RzbtzVVo] + eLGaqfuz) % 256
        mctZtosg[RzbtzVVo], mctZtosg[zKebacph] = mctZtosg[zKebacph], mctZtosg[RzbtzVVo]
    end
    local RzbtzVVo = 0
    local zKebacph = 0
    local yfINphvU = {}
    for _, gGlXZeOA in ipairs(mctZtosg_data) do
        RzbtzVVo = (RzbtzVVo + 1) % 256
        zKebacph = (zKebacph + mctZtosg[RzbtzVVo]) % 256
        mctZtosg[RzbtzVVo], mctZtosg[zKebacph] = mctZtosg[zKebacph], mctZtosg[RzbtzVVo]
        local eLGaqfuz = mctZtosg[(mctZtosg[RzbtzVVo] + mctZtosg[zKebacph]) % 256]
        table.insert(yfINphvU, string.char(bit32.bxor(gGlXZeOA, eLGaqfuz)))
    end
    return table.concat(yfINphvU)
end

local mctZtosg_flat = {}
for _, chunk in ipairs(yCClSfPv) do
    for _, byte in ipairs(chunk) do
        table.insert(mctZtosg_flat, byte)
    end
end

local decrypted = AikRDgpy(mctZtosg_flat, bsGtHPqL)
local JQXybimG, VqlEHmia = loadstring(decrypted)
if JQXybimG then 
    return JQXybimG() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(VqlEHmia)) 
end
