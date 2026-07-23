-- Protected Segment (anti_cheat_bypass)
local bwRDGkQi = 229
local jWpdGSdl = {
{111,54,221,140,152,150,43,162,177,178,32,191,185,228,134,43,181,131,224,166,165,133,121,122,170,123,239,70,88,253,165,3,95,255,92,232,236,39,50,145,55,238,122,82,224,175,63,227,93,111,226,211,166,210,103,202,254,145,30,187},{171,30,248,179,203,11,162,98,182,100,15,21,178,58,4,205,52,83,182,38,134,145,18,50,247,75,108,39,199,133,150,151,42,140,8,254,219,200,143,93,0,239,152,31,12,49,119,225,239,175,73,59,68,38,174,107,53,217,222,246},{189,219,116,147,31,204,96,179,124,36,16,56,172,55,171,111,118,118,133,144,224,40,56,167,69,183,125,127,127}
}
local vUJUIbdq = "rFfcrBHKXWqwDASW"

local function RCFdLsVJ(gCAVwxwK_data, gCAVwxwK_key)
    if type(gCAVwxwK_key) ~= "string" or #gCAVwxwK_key == 0 then return "" end
    local gCAVwxwK = {}
    for FkjIaZTf = 0, 255 do gCAVwxwK[FkjIaZTf] = FkjIaZTf end
    local cEsKfVof = 0
    for FkjIaZTf = 0, 255 do
        local kJDBnYPo = gCAVwxwK_key:byte((FkjIaZTf % #gCAVwxwK_key) + 1)
        cEsKfVof = (cEsKfVof + gCAVwxwK[FkjIaZTf] + kJDBnYPo) % 256
        gCAVwxwK[FkjIaZTf], gCAVwxwK[cEsKfVof] = gCAVwxwK[cEsKfVof], gCAVwxwK[FkjIaZTf]
    end
    local FkjIaZTf = 0
    local cEsKfVof = 0
    local RSVPpvFa = {}
    for _, OXxAYKQv in ipairs(gCAVwxwK_data) do
        FkjIaZTf = (FkjIaZTf + 1) % 256
        cEsKfVof = (cEsKfVof + gCAVwxwK[FkjIaZTf]) % 256
        gCAVwxwK[FkjIaZTf], gCAVwxwK[cEsKfVof] = gCAVwxwK[cEsKfVof], gCAVwxwK[FkjIaZTf]
        local kJDBnYPo = gCAVwxwK[(gCAVwxwK[FkjIaZTf] + gCAVwxwK[cEsKfVof]) % 256]
        local unmasked = bit32.bxor(OXxAYKQv, bwRDGkQi)
        table.insert(RSVPpvFa, string.char(bit32.bxor(unmasked, kJDBnYPo)))
    end
    return table.concat(RSVPpvFa)
end

local gCAVwxwK_flat = {}
for _, chunk in ipairs(jWpdGSdl) do
    for _, byte in ipairs(chunk) do
        table.insert(gCAVwxwK_flat, byte)
    end
end

local decrypted = RCFdLsVJ(gCAVwxwK_flat, vUJUIbdq)
local jXNzefcB, AiEBPRib = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(gCAVwxwK_flat)
gCAVwxwK_flat = nil

if jXNzefcB then 
    local result = jXNzefcB() 
    decrypted = nil
    jXNzefcB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(AiEBPRib)) 
end
