-- Protected Segment (ui_themes)
local hbfETUdn = 214
local ZUluvcAA = {
{38,44,97,103,23,177,202,94,211,253,187,48,88,21,66,153,18,165,70,65,38,21,252,222,42,44,13,179,227,112,11,187,90,27,10,206,50,223,181,35,225,114,148,48,223,220,73,139,64,102,241,252,76,139,113,168,225,96,158,80},{180,223,90,17,110,52,217,51,9,3,152,70,183,239,116,228,121,32,81,198,237,60,33,200,70,191,48,60,170,115,125,55,216,115,21,69,241,69,168,252,197,13,237,8,216,83,62,225,215,169,212,244,217,51,205,97,231,1,151,186},{229,232,214,20,96,135,11,105,104,213,2,42,238,8,133,79,165,149,36,185,208}
}
local VnNEUYqB = "vsEUwjXxtNYclgon"

local function ugwZDjdT(frrIeWsi_data, frrIeWsi_key)
    local frrIeWsi = {}
    for QApvZBbe = 0, 255 do frrIeWsi[QApvZBbe] = QApvZBbe end
    local iYFHqkuk = 0
    for QApvZBbe = 0, 255 do
        local NYHJGfxI = frrIeWsi_key:byte((QApvZBbe % #frrIeWsi_key) + 1)
        iYFHqkuk = (iYFHqkuk + frrIeWsi[QApvZBbe] + NYHJGfxI) % 256
        frrIeWsi[QApvZBbe], frrIeWsi[iYFHqkuk] = frrIeWsi[iYFHqkuk], frrIeWsi[QApvZBbe]
    end
    local QApvZBbe = 0
    local iYFHqkuk = 0
    local PkfRmThu = {}
    for _, HsnIxvDV in ipairs(frrIeWsi_data) do
        QApvZBbe = (QApvZBbe + 1) % 256
        iYFHqkuk = (iYFHqkuk + frrIeWsi[QApvZBbe]) % 256
        frrIeWsi[QApvZBbe], frrIeWsi[iYFHqkuk] = frrIeWsi[iYFHqkuk], frrIeWsi[QApvZBbe]
        local NYHJGfxI = frrIeWsi[(frrIeWsi[QApvZBbe] + frrIeWsi[iYFHqkuk]) % 256]
        local unmasked = bit32.bxor(HsnIxvDV, hbfETUdn)
        table.insert(PkfRmThu, string.char(bit32.bxor(unmasked, NYHJGfxI)))
    end
    return table.concat(PkfRmThu)
end

local frrIeWsi_flat = {}
for _, chunk in ipairs(ZUluvcAA) do
    for _, byte in ipairs(chunk) do
        table.insert(frrIeWsi_flat, byte)
    end
end

local decrypted = ugwZDjdT(frrIeWsi_flat, VnNEUYqB)
local TOTszAwy, cbhuodGn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(frrIeWsi_flat)
frrIeWsi_flat = nil

if TOTszAwy then 
    local result = TOTszAwy() 
    decrypted = nil
    TOTszAwy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(cbhuodGn)) 
end
