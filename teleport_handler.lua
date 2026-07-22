-- Protected Segment (teleport_handler)
local rlBzYwuq = 236
local hZVorwVY = {
{50,213,234,204,80,123,82,21,236,97,226,214,211,241,240,221,187,48,250,182,39,119,99,252,200,81,206,95,200,211,71,76,30,126,62,179,62,102,235,66,33,181,8,40,93,9,73,105,92,55,60,87,38,171,62,85,163,255,239,23},{79,253,189,157,90,133,236,139,69,111,73,95,182,204,89,53,60,32,20,182,69,245,33,158,33,26,86,112,76,56,8,138,39,138,236,248,196,172,178,229,57,193,71,177,64,160,103,2,50,196,36,10,86,253,134,252,156,160,229,130},{71,69,193,100,99,113,173,60,233,91,93,30,202,4,193,74,252,124,136,62,87,193,17,169,166,158,2,217}
}
local MErJXzsE = "CKcazcsjnJzdwwKC"

local function ypYADPoZ(HZIDEVoz_data, HZIDEVoz_key)
    local HZIDEVoz = {}
    for jvQWifSF = 0, 255 do HZIDEVoz[jvQWifSF] = jvQWifSF end
    local xBCLVhms = 0
    for jvQWifSF = 0, 255 do
        local YmQhfJnz = HZIDEVoz_key:byte((jvQWifSF % #HZIDEVoz_key) + 1)
        xBCLVhms = (xBCLVhms + HZIDEVoz[jvQWifSF] + YmQhfJnz) % 256
        HZIDEVoz[jvQWifSF], HZIDEVoz[xBCLVhms] = HZIDEVoz[xBCLVhms], HZIDEVoz[jvQWifSF]
    end
    local jvQWifSF = 0
    local xBCLVhms = 0
    local SEQNmGJg = {}
    for _, YGpFwFbs in ipairs(HZIDEVoz_data) do
        jvQWifSF = (jvQWifSF + 1) % 256
        xBCLVhms = (xBCLVhms + HZIDEVoz[jvQWifSF]) % 256
        HZIDEVoz[jvQWifSF], HZIDEVoz[xBCLVhms] = HZIDEVoz[xBCLVhms], HZIDEVoz[jvQWifSF]
        local YmQhfJnz = HZIDEVoz[(HZIDEVoz[jvQWifSF] + HZIDEVoz[xBCLVhms]) % 256]
        local unmasked = bit32.bxor(YGpFwFbs, rlBzYwuq)
        table.insert(SEQNmGJg, string.char(bit32.bxor(unmasked, YmQhfJnz)))
    end
    return table.concat(SEQNmGJg)
end

local HZIDEVoz_flat = {}
for _, chunk in ipairs(hZVorwVY) do
    for _, byte in ipairs(chunk) do
        table.insert(HZIDEVoz_flat, byte)
    end
end

local decrypted = ypYADPoZ(HZIDEVoz_flat, MErJXzsE)
local QxmhRVnb, ftQHTYfs = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HZIDEVoz_flat)
HZIDEVoz_flat = nil

if QxmhRVnb then 
    local result = QxmhRVnb() 
    decrypted = nil
    QxmhRVnb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(ftQHTYfs)) 
end
