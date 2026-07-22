-- Protected Segment (teleport_handler)
local OlEhKzLU = 16
local cedCtMpI = {
{185,177,128,24,180,205,155,188,51,39,217,140,63,16,69,170,133,83,93,250,240,96,105,249,5,52,212,196,128,216,113,84,191,100,222,78,210,12,20,171,224,186,185,200,20,20,214,230,189,246,100,104,232,111,170,187,139,158,118,23},{76,172,28,20,170,1,230,217,233,97,148,187,53,177,250,52,8,246,22,194,122,101,167,254,85,141,100,191,83,28,201,12,149,113,75,66,156,214,12,179,89,222,95,95,180,35,56,13,58,183,188,62,106,72,156,151,129,78,206,75},{63,42,19,240,178,72,215,153,169,93,226,240,177,206,218,97,38,225,250,53,199,38,20,80,48,170,2,242}
}
local TmAIZQVi = "hyuEotNlvOCXmLTB"

local function sEBIPFio(mjuxikou_data, mjuxikou_key)
    local mjuxikou = {}
    for zDeqFZoX = 0, 255 do mjuxikou[zDeqFZoX] = zDeqFZoX end
    local zPJovnKb = 0
    for zDeqFZoX = 0, 255 do
        local nCBChcms = mjuxikou_key:byte((zDeqFZoX % #mjuxikou_key) + 1)
        zPJovnKb = (zPJovnKb + mjuxikou[zDeqFZoX] + nCBChcms) % 256
        mjuxikou[zDeqFZoX], mjuxikou[zPJovnKb] = mjuxikou[zPJovnKb], mjuxikou[zDeqFZoX]
    end
    local zDeqFZoX = 0
    local zPJovnKb = 0
    local cgdzDwxu = {}
    for _, Ytsbnkpv in ipairs(mjuxikou_data) do
        zDeqFZoX = (zDeqFZoX + 1) % 256
        zPJovnKb = (zPJovnKb + mjuxikou[zDeqFZoX]) % 256
        mjuxikou[zDeqFZoX], mjuxikou[zPJovnKb] = mjuxikou[zPJovnKb], mjuxikou[zDeqFZoX]
        local nCBChcms = mjuxikou[(mjuxikou[zDeqFZoX] + mjuxikou[zPJovnKb]) % 256]
        local unmasked = bit32.bxor(Ytsbnkpv, OlEhKzLU)
        table.insert(cgdzDwxu, string.char(bit32.bxor(unmasked, nCBChcms)))
    end
    return table.concat(cgdzDwxu)
end

local mjuxikou_flat = {}
for _, chunk in ipairs(cedCtMpI) do
    for _, byte in ipairs(chunk) do
        table.insert(mjuxikou_flat, byte)
    end
end

local decrypted = sEBIPFio(mjuxikou_flat, TmAIZQVi)
local zCdjPKKy, nbyBtZqV = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mjuxikou_flat)
mjuxikou_flat = nil

if zCdjPKKy then 
    local result = zCdjPKKy() 
    decrypted = nil
    zCdjPKKy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(nbyBtZqV)) 
end
