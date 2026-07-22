-- Protected Segment (anti_cheat_bypass)
local wwdrDxrd = 227
local UlgoGAnq = {
{195,173,13,222,201,210,49,220,216,232,115,177,106,231,245,70,107,15,112,2,60,63,17,94,40,251,169,46,227,95,124,249,141,60,162,62,17,20,240,218,243,212,78,19,73,194,232,79,28,93,109,118,152,89,228,120,25,18,14,170},{151,201,14,78,167,3,236,99,75,211,105,2,166,63,252,111,154,66,173,44,99,39,208,127,48,191,202,225,241,183,29,26,94,193,206,28,65,82,4,186,62,131,120,221,216,89,67,4,30,192,174,209,171,161,233,198,92,192,12,91},{16,101,106,202,240,118,102,83,223,123,141,211,228,217,242,28,116,27,143,239,221,202,68,102,130,186,148,223,232}
}
local mmdDwTia = "FSZDBOZuVFeapdoz"

local function TVcTCFlf(VgcuBcCr_data, VgcuBcCr_key)
    local VgcuBcCr = {}
    for lWuOGrbw = 0, 255 do VgcuBcCr[lWuOGrbw] = lWuOGrbw end
    local EzGotEaw = 0
    for lWuOGrbw = 0, 255 do
        local oKJMynff = VgcuBcCr_key:byte((lWuOGrbw % #VgcuBcCr_key) + 1)
        EzGotEaw = (EzGotEaw + VgcuBcCr[lWuOGrbw] + oKJMynff) % 256
        VgcuBcCr[lWuOGrbw], VgcuBcCr[EzGotEaw] = VgcuBcCr[EzGotEaw], VgcuBcCr[lWuOGrbw]
    end
    local lWuOGrbw = 0
    local EzGotEaw = 0
    local hTdBWGYn = {}
    for _, LwZkjtkw in ipairs(VgcuBcCr_data) do
        lWuOGrbw = (lWuOGrbw + 1) % 256
        EzGotEaw = (EzGotEaw + VgcuBcCr[lWuOGrbw]) % 256
        VgcuBcCr[lWuOGrbw], VgcuBcCr[EzGotEaw] = VgcuBcCr[EzGotEaw], VgcuBcCr[lWuOGrbw]
        local oKJMynff = VgcuBcCr[(VgcuBcCr[lWuOGrbw] + VgcuBcCr[EzGotEaw]) % 256]
        local unmasked = bit32.bxor(LwZkjtkw, wwdrDxrd)
        table.insert(hTdBWGYn, string.char(bit32.bxor(unmasked, oKJMynff)))
    end
    return table.concat(hTdBWGYn)
end

local VgcuBcCr_flat = {}
for _, chunk in ipairs(UlgoGAnq) do
    for _, byte in ipairs(chunk) do
        table.insert(VgcuBcCr_flat, byte)
    end
end

local decrypted = TVcTCFlf(VgcuBcCr_flat, mmdDwTia)
local ZVkuiifW, JoIHwmIx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(VgcuBcCr_flat)
VgcuBcCr_flat = nil

if ZVkuiifW then 
    local result = ZVkuiifW() 
    decrypted = nil
    ZVkuiifW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(JoIHwmIx)) 
end
