-- Protected Segment (db)
local dIHdEwlM = 54
local sfwHQkCG = {
{226,51,85,156,168,101,18,1,100,195,244,56,47,223,216,219,80,107,101,142,21,94,112,231,50,70,163,211,35,151,12,176,233,153,12,228,58,31,203,181,172,68,93,120,139,188,63,84,170,185,212,165,54,207,96,230,48,239,104,247},{62,154,109,8,123,152,218,128,152,91,163,152,57,212,65,234,68,180,124,2,251,209,206,169,161,26,199,131,139,58,155,251,81,35,31,69,123,193,24,77,30,129,105,68,52,199,198,100,74,100,80,208,100,197,244,125,202,246,201,79},{165,113,182,16,73,186,254,7,88,90,61,46,29,37,100,244,77,90,201,5,230,13,120,186,221,118,4,183,50,238,60,0,6,177,117,128,56,201,2,185,28,214,99,90,142,93,142,173,76,86,253,147,198,66,62,251,83,180,94,29},{96,226,73,254,194,236,218,214,87,133,41,175,47,50,232,76,237,17,155,159,188,31,102,78,74,14,60,8,107,221,193,171,166,35,129,5,6,195,135,67,158,135,80,70,93,126,149,154,213,65,33,64,186,22,155,129,47,39,253,93},{153,2,3,95,47,113,85,204,120,185,27,55,9,248,237,113,87,128,224,1,83,21,249,78,220,35,122,110,232,64,146,118,129,137,202,243,71,49,21,60,22,31,68,237,5,78,221,212,100,141,41,255,198,140,181,133,20,48,215,241},{243,169,188,78,102,198,138,212,177,112,81,241,28,241,12,223,204,16,117,97,186,82,19,198,111,12,109,245,163,207,178,3,152,136,196,72,160,168,57,211,240,59,221,45,194,178,59,191,230,87,248,19,21,43,73,110,146,195,238,102},{61,232,46,207,97,251,34,241,192,106,11,35,74,42,16,31,57,139,23,168,122,136,148,254,203,163,210,234,150,12,106,61,254,205,85,242,1,106,164,112,170,228,128,171,93,210,103,69,164,250,71,48,203,37,229,175,132,171,146,62},{249,21,76,167,174,192,220,171,54,173,237,191,67,62,209,155,158,65,161,188,181,27,133,172,251,167,131,106,247,245,189,241,52,149,112,238,89,8,127,229,238,114,75,217,254,124,163,127,45,77,250,244,158,56,254,150,32,219,133,144}
}
local FePTdTIV = "jWoNNPNFIGtOhFmQ"

local function eZFKqahH(MjGkmAKu_data, MjGkmAKu_key)
    local MjGkmAKu = {}
    for HxJogmlk = 0, 255 do MjGkmAKu[HxJogmlk] = HxJogmlk end
    local gdxQJahp = 0
    for HxJogmlk = 0, 255 do
        local WRuRolso = MjGkmAKu_key:byte((HxJogmlk % #MjGkmAKu_key) + 1)
        gdxQJahp = (gdxQJahp + MjGkmAKu[HxJogmlk] + WRuRolso) % 256
        MjGkmAKu[HxJogmlk], MjGkmAKu[gdxQJahp] = MjGkmAKu[gdxQJahp], MjGkmAKu[HxJogmlk]
    end
    local HxJogmlk = 0
    local gdxQJahp = 0
    local zzphLpuX = {}
    for _, IlaeGibX in ipairs(MjGkmAKu_data) do
        HxJogmlk = (HxJogmlk + 1) % 256
        gdxQJahp = (gdxQJahp + MjGkmAKu[HxJogmlk]) % 256
        MjGkmAKu[HxJogmlk], MjGkmAKu[gdxQJahp] = MjGkmAKu[gdxQJahp], MjGkmAKu[HxJogmlk]
        local WRuRolso = MjGkmAKu[(MjGkmAKu[HxJogmlk] + MjGkmAKu[gdxQJahp]) % 256]
        local unmasked = bit32.bxor(IlaeGibX, dIHdEwlM)
        table.insert(zzphLpuX, string.char(bit32.bxor(unmasked, WRuRolso)))
    end
    return table.concat(zzphLpuX)
end

local MjGkmAKu_flat = {}
for _, chunk in ipairs(sfwHQkCG) do
    for _, byte in ipairs(chunk) do
        table.insert(MjGkmAKu_flat, byte)
    end
end

local decrypted = eZFKqahH(MjGkmAKu_flat, FePTdTIV)
local bfmFVNav, sXgpFfNN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(MjGkmAKu_flat)
MjGkmAKu_flat = nil

if bfmFVNav then 
    local result = bfmFVNav() 
    decrypted = nil
    bfmFVNav = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(sXgpFfNN)) 
end
