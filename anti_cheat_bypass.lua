-- Protected Segment (anti_cheat_bypass)
local DgipTYFF = 190
local plrlgWsd = {
{249,203,122,83,180,44,4,99,206,206,156,182,138,123,67,67,187,169,109,82,83,103,201,117,23,12,142,148,227,134,176,53,135,55,30,179,129,127,233,93,35,228,176,142,86,6,137,134,181,243,18,82,250,56,9,160,92,207,84,180},{153,133,204,82,225,236,215,87,128,171,81,28,234,158,197,62,240,83,72,46,43,148,51,103,106,136,188,196,188,151,94,18,49,168,133,124,8,115,192,251,180,49,155,178,68,254,113,153,252,239,75,83,201,207,93,73,1,109,0,243},{110,211,68,126,171,74,211,15,106,228,140,124,21,18,195,186,204,219,251,59,235,214,35,184,105,5,185,44,239}
}
local HuRHIghb = "ANNUtFwWPtwirasB"

local function GCxcEtoo(AGYsVOlo_data, AGYsVOlo_key)
    local AGYsVOlo = {}
    for ktGELHXG = 0, 255 do AGYsVOlo[ktGELHXG] = ktGELHXG end
    local RvXxWxPD = 0
    for ktGELHXG = 0, 255 do
        local jDGxUPve = AGYsVOlo_key:byte((ktGELHXG % #AGYsVOlo_key) + 1)
        RvXxWxPD = (RvXxWxPD + AGYsVOlo[ktGELHXG] + jDGxUPve) % 256
        AGYsVOlo[ktGELHXG], AGYsVOlo[RvXxWxPD] = AGYsVOlo[RvXxWxPD], AGYsVOlo[ktGELHXG]
    end
    local ktGELHXG = 0
    local RvXxWxPD = 0
    local jAeOQTcw = {}
    for _, AaOUVeDV in ipairs(AGYsVOlo_data) do
        ktGELHXG = (ktGELHXG + 1) % 256
        RvXxWxPD = (RvXxWxPD + AGYsVOlo[ktGELHXG]) % 256
        AGYsVOlo[ktGELHXG], AGYsVOlo[RvXxWxPD] = AGYsVOlo[RvXxWxPD], AGYsVOlo[ktGELHXG]
        local jDGxUPve = AGYsVOlo[(AGYsVOlo[ktGELHXG] + AGYsVOlo[RvXxWxPD]) % 256]
        local unmasked = bit32.bxor(AaOUVeDV, DgipTYFF)
        table.insert(jAeOQTcw, string.char(bit32.bxor(unmasked, jDGxUPve)))
    end
    return table.concat(jAeOQTcw)
end

local AGYsVOlo_flat = {}
for _, chunk in ipairs(plrlgWsd) do
    for _, byte in ipairs(chunk) do
        table.insert(AGYsVOlo_flat, byte)
    end
end

local decrypted = GCxcEtoo(AGYsVOlo_flat, HuRHIghb)
local mxiZwdcO, jlynBjwp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(AGYsVOlo_flat)
AGYsVOlo_flat = nil

if mxiZwdcO then 
    local result = mxiZwdcO() 
    decrypted = nil
    mxiZwdcO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(jlynBjwp)) 
end
