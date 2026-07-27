-- Protected Segment (ui_themes)
local gOlAYCmc = 107
local kTNEnhVw = {
{146,139,150,175,239,164,74,34,38,186,8,154,98,65,63,52,219,131,125,148,155,54,175,190,172,46,246,26,143,36,180,43,86,44,3,164,35,97,56,221,46,64,236,207,232,219,248,138,192,207,184,7,207,175,240,249,188,204,229,146},{51,33,86,148,243,138,48,23,85,66,111,121,15,132,59,155,110,14,210,33,191,5,91,110,31,14,38,236,203,35,90,111,188,35,13,210,36,222,165,139,99,207,7,194,154,72,223,154,150,172,229,153,239,78,20,14,89,4,62,146},{103,128,177,144,120,110,52,110,206,69,232,115,151,68,235,163,96,169,11,183,145}
}
local ZvLYRJmj = "nyvjPgfjRqZYQFcR"

local function xyCcOJYX(bfOuNDZY_data, bfOuNDZY_key)
    if type(bfOuNDZY_key) ~= "string" or #bfOuNDZY_key == 0 then return "" end
    local bfOuNDZY = {}
    for rJliQiZG = 0, 255 do bfOuNDZY[rJliQiZG] = rJliQiZG end
    local MuXwLtHz = 0
    for rJliQiZG = 0, 255 do
        local mrtPLkIF = bfOuNDZY_key:byte((rJliQiZG % #bfOuNDZY_key) + 1)
        MuXwLtHz = (MuXwLtHz + bfOuNDZY[rJliQiZG] + mrtPLkIF) % 256
        bfOuNDZY[rJliQiZG], bfOuNDZY[MuXwLtHz] = bfOuNDZY[MuXwLtHz], bfOuNDZY[rJliQiZG]
    end
    local rJliQiZG = 0
    local MuXwLtHz = 0
    local SiApORPo = {}
    for _, MawnwYfZ in ipairs(bfOuNDZY_data) do
        rJliQiZG = (rJliQiZG + 1) % 256
        MuXwLtHz = (MuXwLtHz + bfOuNDZY[rJliQiZG]) % 256
        bfOuNDZY[rJliQiZG], bfOuNDZY[MuXwLtHz] = bfOuNDZY[MuXwLtHz], bfOuNDZY[rJliQiZG]
        local mrtPLkIF = bfOuNDZY[(bfOuNDZY[rJliQiZG] + bfOuNDZY[MuXwLtHz]) % 256]
        local unmasked = bit32.bxor(MawnwYfZ, gOlAYCmc)
        table.insert(SiApORPo, string.char(bit32.bxor(unmasked, mrtPLkIF)))
    end
    return table.concat(SiApORPo)
end

local bfOuNDZY_flat = {}
for _, chunk in ipairs(kTNEnhVw) do
    for _, byte in ipairs(chunk) do
        table.insert(bfOuNDZY_flat, byte)
    end
end

local decrypted = xyCcOJYX(bfOuNDZY_flat, ZvLYRJmj)
local rVnwfKCJ, YiWYWKNE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bfOuNDZY_flat)
bfOuNDZY_flat = nil

if rVnwfKCJ then 
    local result = rVnwfKCJ() 
    decrypted = nil
    rVnwfKCJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(YiWYWKNE)) 
end
