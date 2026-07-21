-- Protected Segment (anti_cheat_bypass)
local BwmLYYkc = 84
local kduvTIbb = {
{172,202,8,111,92,189,4,52,191,248,91,72,146,31,249,253,51,157,52,224,190,184,1,154,175,182,102,234,121,254,90,44,119,58,131,114,133,78,53,129,133,65,225,96,22,45,87,237,164,134,189,250,162,86,251,177,137,141,136,23},{179,240,82,207,177,13,53,61,132,234,22,106,56,220,212,188,166,67,105,191,8,244,17,203,58,59,255,87,248,104,193,157,3,240,225,243,250,49,255,55,17,70,213,82,104,129,132,243,143,98,246,5,83,239,223,243,69,201,223,72},{144,223,226,125,138,129,73,209,215,231,150,211,201,116,152,53,248,154,163,72,108,107,42,5,193,68,7,167,185}
}
local EOgniYiW = "duZvcwStvpzfJQJn"

local function JxAlABtn(GXrtvXin_data, GXrtvXin_key)
    local GXrtvXin = {}
    for GtVjYzEi = 0, 255 do GXrtvXin[GtVjYzEi] = GtVjYzEi end
    local KfbehcRq = 0
    for GtVjYzEi = 0, 255 do
        local htcCFjcU = GXrtvXin_key:byte((GtVjYzEi % #GXrtvXin_key) + 1)
        KfbehcRq = (KfbehcRq + GXrtvXin[GtVjYzEi] + htcCFjcU) % 256
        GXrtvXin[GtVjYzEi], GXrtvXin[KfbehcRq] = GXrtvXin[KfbehcRq], GXrtvXin[GtVjYzEi]
    end
    local GtVjYzEi = 0
    local KfbehcRq = 0
    local yMTienol = {}
    for _, BWIZZZHd in ipairs(GXrtvXin_data) do
        GtVjYzEi = (GtVjYzEi + 1) % 256
        KfbehcRq = (KfbehcRq + GXrtvXin[GtVjYzEi]) % 256
        GXrtvXin[GtVjYzEi], GXrtvXin[KfbehcRq] = GXrtvXin[KfbehcRq], GXrtvXin[GtVjYzEi]
        local htcCFjcU = GXrtvXin[(GXrtvXin[GtVjYzEi] + GXrtvXin[KfbehcRq]) % 256]
        local unmasked = bit32.bxor(BWIZZZHd, BwmLYYkc)
        table.insert(yMTienol, string.char(bit32.bxor(unmasked, htcCFjcU)))
    end
    return table.concat(yMTienol)
end

local GXrtvXin_flat = {}
for _, chunk in ipairs(kduvTIbb) do
    for _, byte in ipairs(chunk) do
        table.insert(GXrtvXin_flat, byte)
    end
end

local decrypted = JxAlABtn(GXrtvXin_flat, EOgniYiW)
local bcsmbBVL, ZsDRTTiy = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GXrtvXin_flat)
GXrtvXin_flat = nil

if bcsmbBVL then 
    local result = bcsmbBVL() 
    decrypted = nil
    bcsmbBVL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(ZsDRTTiy)) 
end
