-- Protected Segment (db)
local UeQhhJrb = 61
local ZSOYOeoc = {
{91,187,205,30,239,226,193,100,139,38,232,196,243,41,203,83,213,72,27,187,255,178,246,16,77,246,212,19,65,15,99,50,137,232,106,240,248,185,168,152,128,13,239,64,203,2,52,130,254,76,84,248,44,47,177,24,98,71,54,100},{175,75,158,31,0,88,107,208,87,246,79,130,30,245,100,199,139,153,118,214,130,39,76,173,106,161,106,152,13,132,225,162,194,85,65,87,25,89,204,232,43,90,77,152,232,89,41,40,38,249,9,149,246,243,228,206,236,85,131,133},{213,19,175,32,130,202,213,84,33,73,230,56,7,225,114,27,202,121,136,189,40,191,136,60,48,145,82,14,204,52,244,166,61,132,204,178,23,101,224,117,114,188,247,65,17,166,253,114,239,178,135,17,112,175,234,189,46,138,2,73},{141,249,138,194,146,73,139,240,176,64,45,16,236,165,242,146,200,167,71,84,170,126,182,191,65,143,105,179,117,207,165,207,82,187,221,220,42,220,154,196,43,33,10,221,12,177,86,249,102,112,100,95,191,48,95,165,43,214,74,118},{142,91,91,26,250,242,102,25,103,39,161,68,202,102,46,75,80,154,7,170,118,105,122,251,175,141,1,186,14,194,142,147,217,97,147,152,249,3,238,216,170,123,167,253,225,34,187,46,175,139,209,246,208,68,81,46,222,195,98,195},{189,48,184,190,181,225,206,136,207,45,178,142,185,161,126,137,106,42,208,93,253,207,9,106,198,63,203,50,130,159,195,104,36,121,168,212,143,28,83,227,155,181,129,236,239,35,109,29,26,220,97,134,169,45,16,87,121,52,103,242},{149,98,233,231,173,211,133,17,77,72,244,111,165,112,64,103,171,51,87,199,1,207,88,12,248,122,28,66,143,143,23,172,241,208,60,80,102,251,76,131,112,243,164,172,61,63,29,149,129,16,173,253,42,194,250,192,0,126,234,109},{214,136,3,103,128,236,56,181,150,209,188,180,38,231,201,222,189,107,201,222,14,228,169,137,59,76,158,191,47,139,168,132,31,51,194,149,125,144,190,204,187,185,87,218,30,253,229,38,178,188,183,150,116,146,48,63,149,179,111}
}
local TXjcdrpj = "FRfTwkeCfedfVQur"

local function NwFphxRm(IzxtnRsG_data, IzxtnRsG_key)
    if type(IzxtnRsG_key) ~= "string" or #IzxtnRsG_key == 0 then return "" end
    local IzxtnRsG = {}
    for yzOqnISx = 0, 255 do IzxtnRsG[yzOqnISx] = yzOqnISx end
    local nSkvnEbR = 0
    for yzOqnISx = 0, 255 do
        local ZraxgCPf = IzxtnRsG_key:byte((yzOqnISx % #IzxtnRsG_key) + 1)
        nSkvnEbR = (nSkvnEbR + IzxtnRsG[yzOqnISx] + ZraxgCPf) % 256
        IzxtnRsG[yzOqnISx], IzxtnRsG[nSkvnEbR] = IzxtnRsG[nSkvnEbR], IzxtnRsG[yzOqnISx]
    end
    local yzOqnISx = 0
    local nSkvnEbR = 0
    local htxYNufO = {}
    for _, VsVxtRyb in ipairs(IzxtnRsG_data) do
        yzOqnISx = (yzOqnISx + 1) % 256
        nSkvnEbR = (nSkvnEbR + IzxtnRsG[yzOqnISx]) % 256
        IzxtnRsG[yzOqnISx], IzxtnRsG[nSkvnEbR] = IzxtnRsG[nSkvnEbR], IzxtnRsG[yzOqnISx]
        local ZraxgCPf = IzxtnRsG[(IzxtnRsG[yzOqnISx] + IzxtnRsG[nSkvnEbR]) % 256]
        local unmasked = bit32.bxor(VsVxtRyb, UeQhhJrb)
        table.insert(htxYNufO, string.char(bit32.bxor(unmasked, ZraxgCPf)))
    end
    return table.concat(htxYNufO)
end

local IzxtnRsG_flat = {}
for _, chunk in ipairs(ZSOYOeoc) do
    for _, byte in ipairs(chunk) do
        table.insert(IzxtnRsG_flat, byte)
    end
end

local decrypted = NwFphxRm(IzxtnRsG_flat, TXjcdrpj)
local dIKpBLrq, vvvNQUny = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(IzxtnRsG_flat)
IzxtnRsG_flat = nil

if dIKpBLrq then 
    local result = dIKpBLrq() 
    decrypted = nil
    dIKpBLrq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(vvvNQUny)) 
end
