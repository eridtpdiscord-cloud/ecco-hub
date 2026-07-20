-- Compiled secure segment
local MwPJeTJw = {
{103,170,32,13,13,187,89,202,90,55,81,188,92,39,8,5,177,202,203,190,60,41,171,76,201,91,0,239,204,245,138,172,206,221,219,207,10,208,251,113,217,54,66,63,21,94,29,18,20,220,183,194,127,8,252,248,195,102,74,163},{76,113,85,108,13,63,45,140,58,135,200,126,55,255,212,55,204,127,190,115,154,195,145,35,207,92,27,8,40,240,43,204,149,31,198,159,22,236,144,127,243,246,91,175,122,143,167,12,110,100,237,80,13,167,140,69,148,211,10,71},{161,234,11,66,252,212,90,139,24,172,205,50,171,91,255,249,192,230,206,196,203,126,105,97,96}
}
local jvNcqCSb = "useNbmwRpYbbeneC"

local function bXuLovjC(oKeSZIqh_data, oKeSZIqh_key)
    local oKeSZIqh = {}
    for NsiblFdA = 0, 255 do oKeSZIqh[NsiblFdA] = NsiblFdA end
    local lSyRkWBt = 0
    for NsiblFdA = 0, 255 do
        local wnfqbBjD = oKeSZIqh_key:byte((NsiblFdA % #oKeSZIqh_key) + 1)
        lSyRkWBt = (lSyRkWBt + oKeSZIqh[NsiblFdA] + wnfqbBjD) % 256
        oKeSZIqh[NsiblFdA], oKeSZIqh[lSyRkWBt] = oKeSZIqh[lSyRkWBt], oKeSZIqh[NsiblFdA]
    end
    local NsiblFdA = 0
    local lSyRkWBt = 0
    local semqBBVL = {}
    for _, AiynPQHv in ipairs(oKeSZIqh_data) do
        NsiblFdA = (NsiblFdA + 1) % 256
        lSyRkWBt = (lSyRkWBt + oKeSZIqh[NsiblFdA]) % 256
        oKeSZIqh[NsiblFdA], oKeSZIqh[lSyRkWBt] = oKeSZIqh[lSyRkWBt], oKeSZIqh[NsiblFdA]
        local wnfqbBjD = oKeSZIqh[(oKeSZIqh[NsiblFdA] + oKeSZIqh[lSyRkWBt]) % 256]
        table.insert(semqBBVL, string.char(bit32.bxor(AiynPQHv, wnfqbBjD)))
    end
    return table.concat(semqBBVL)
end

local oKeSZIqh_flat = {}
for _, chunk in ipairs(MwPJeTJw) do
    for _, byte in ipairs(chunk) do
        table.insert(oKeSZIqh_flat, byte)
    end
end

local decrypted = bXuLovjC(oKeSZIqh_flat, jvNcqCSb)
local ZKvKTgML, xJFtoBTP = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(oKeSZIqh_flat)
oKeSZIqh_flat = nil

if ZKvKTgML then 
    local result = ZKvKTgML() 
    decrypted = nil
    ZKvKTgML = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(xJFtoBTP)) 
end
