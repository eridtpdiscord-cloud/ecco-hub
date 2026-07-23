-- Protected Segment (anti_cheat_bypass)
local zjEUgucT = 207
local CmhePfnF = {
{1,39,54,234,104,185,251,118,101,0,43,159,151,254,141,240,85,214,168,71,111,159,117,117,146,168,209,165,180,235,77,190,170,37,251,215,155,187,125,153,59,141,28,242,48,197,212,207,103,188,0,92,153,179,193,216,188,44,86,189},{114,184,71,69,203,124,15,232,242,194,92,66,9,27,123,71,221,7,179,142,237,245,164,155,214,81,40,230,102,124,64,87,255,128,62,143,96,194,240,35,48,50,220,18,28,43,61,68,198,68,177,85,238,129,23,19,161,181,149,207},{26,238,55,228,254,216,13,145,135,104,251,82,116,129,201,158,35,27,67,75,28,19,159,232,153,101,64,235,219}
}
local UKxbqBGk = "yMQLQgmDvjnQwSTM"

local function sKjSeiOH(rKuKBtmo_data, rKuKBtmo_key)
    if type(rKuKBtmo_key) ~= "string" or #rKuKBtmo_key == 0 then return "" end
    local rKuKBtmo = {}
    for afrXhDrr = 0, 255 do rKuKBtmo[afrXhDrr] = afrXhDrr end
    local hrLaQzkd = 0
    for afrXhDrr = 0, 255 do
        local ERzGzqaK = rKuKBtmo_key:byte((afrXhDrr % #rKuKBtmo_key) + 1)
        hrLaQzkd = (hrLaQzkd + rKuKBtmo[afrXhDrr] + ERzGzqaK) % 256
        rKuKBtmo[afrXhDrr], rKuKBtmo[hrLaQzkd] = rKuKBtmo[hrLaQzkd], rKuKBtmo[afrXhDrr]
    end
    local afrXhDrr = 0
    local hrLaQzkd = 0
    local PICxSZeI = {}
    for _, dtypRvZL in ipairs(rKuKBtmo_data) do
        afrXhDrr = (afrXhDrr + 1) % 256
        hrLaQzkd = (hrLaQzkd + rKuKBtmo[afrXhDrr]) % 256
        rKuKBtmo[afrXhDrr], rKuKBtmo[hrLaQzkd] = rKuKBtmo[hrLaQzkd], rKuKBtmo[afrXhDrr]
        local ERzGzqaK = rKuKBtmo[(rKuKBtmo[afrXhDrr] + rKuKBtmo[hrLaQzkd]) % 256]
        local unmasked = bit32.bxor(dtypRvZL, zjEUgucT)
        table.insert(PICxSZeI, string.char(bit32.bxor(unmasked, ERzGzqaK)))
    end
    return table.concat(PICxSZeI)
end

local rKuKBtmo_flat = {}
for _, chunk in ipairs(CmhePfnF) do
    for _, byte in ipairs(chunk) do
        table.insert(rKuKBtmo_flat, byte)
    end
end

local decrypted = sKjSeiOH(rKuKBtmo_flat, UKxbqBGk)
local eEklezUW, pcAjPpVd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(rKuKBtmo_flat)
rKuKBtmo_flat = nil

if eEklezUW then 
    local result = eEklezUW() 
    decrypted = nil
    eEklezUW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(pcAjPpVd)) 
end
