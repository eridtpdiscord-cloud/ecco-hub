-- Protected Segment (ui_themes)
local eutNsWav = 122
local tRQkEtUu = {
{0,191,192,221,179,52,140,98,139,35,57,148,1,127,159,131,10,42,168,56,170,181,44,118,213,211,30,52,235,249,223,251,163,189,39,48,148,107,187,231,128,106,9,65,170,135,83,3,142,241,136,141,80,49,86,113,242,165,16,135},{172,254,167,57,110,107,31,75,179,235,240,2,241,151,189,108,3,122,195,25,209,233,234,24,118,86,105,84,219,15,129,111,45,224,153,105,85,42,98,186,21,93,99,64,119,249,81,172,142,22,228,19,237,77,164,135,137,93,187,222},{222,129,175,204,68,129,189,11,191,144,180,29,187,83,76,223,101,125,164,44,21}
}
local NCcWMazD = "FSbiMokKiscNXnhx"

local function PXbRWIlf(DjLrpyWd_data, DjLrpyWd_key)
    if type(DjLrpyWd_key) ~= "string" or #DjLrpyWd_key == 0 then return "" end
    local DjLrpyWd = {}
    for JvhpQfuT = 0, 255 do DjLrpyWd[JvhpQfuT] = JvhpQfuT end
    local ZYtJzFZJ = 0
    for JvhpQfuT = 0, 255 do
        local kYjTGcpc = DjLrpyWd_key:byte((JvhpQfuT % #DjLrpyWd_key) + 1)
        ZYtJzFZJ = (ZYtJzFZJ + DjLrpyWd[JvhpQfuT] + kYjTGcpc) % 256
        DjLrpyWd[JvhpQfuT], DjLrpyWd[ZYtJzFZJ] = DjLrpyWd[ZYtJzFZJ], DjLrpyWd[JvhpQfuT]
    end
    local JvhpQfuT = 0
    local ZYtJzFZJ = 0
    local GNTulirw = {}
    for _, DIkQBntJ in ipairs(DjLrpyWd_data) do
        JvhpQfuT = (JvhpQfuT + 1) % 256
        ZYtJzFZJ = (ZYtJzFZJ + DjLrpyWd[JvhpQfuT]) % 256
        DjLrpyWd[JvhpQfuT], DjLrpyWd[ZYtJzFZJ] = DjLrpyWd[ZYtJzFZJ], DjLrpyWd[JvhpQfuT]
        local kYjTGcpc = DjLrpyWd[(DjLrpyWd[JvhpQfuT] + DjLrpyWd[ZYtJzFZJ]) % 256]
        local unmasked = bit32.bxor(DIkQBntJ, eutNsWav)
        table.insert(GNTulirw, string.char(bit32.bxor(unmasked, kYjTGcpc)))
    end
    return table.concat(GNTulirw)
end

local DjLrpyWd_flat = {}
for _, chunk in ipairs(tRQkEtUu) do
    for _, byte in ipairs(chunk) do
        table.insert(DjLrpyWd_flat, byte)
    end
end

local decrypted = PXbRWIlf(DjLrpyWd_flat, NCcWMazD)
local cfEcWhQj, dHGHLoFz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DjLrpyWd_flat)
DjLrpyWd_flat = nil

if cfEcWhQj then 
    local result = cfEcWhQj() 
    decrypted = nil
    cfEcWhQj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(dHGHLoFz)) 
end
