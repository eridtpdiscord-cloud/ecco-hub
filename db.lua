-- Protected Segment (db)
local MrKoNHeM = 22
local TqripbvC = {
{77,36,59,166,89,122,157,17,217,87,69,225,202,248,48,58,206,166,161,36,99,83,95,190,167,189,12,135,6,122,104,109,197,50,53,232,203,74,100,11,154,161,78,209,196,231,206,91,250,123,93,17,81,168,188,182,55,189,137,30},{65,197,232,100,214,115,197,166,135,21,128,105,35,20,111,207,253,95,114,31,22,141,59,153,213,4,242,31,215,109,94,231,117,83,165,2,219,77,140,227,235,207,50,204,117,243,116,173,2,145,166,116,76,243,90,100,18,57,139,93},{101,31,5,186,58,14,45,9,207,95,140,73,210,81,244,2,93,33,26,80,109,246,40,143,60,4,237,43,80,241,37,239,130,147,201,213,120,48,68,19,152,87,196,73,226,73,75,169,157,102,62,5,219,124,57,6,50,190,195,148},{245,72,11,239,65,34,97,88,227,128,151,55,97,107,76,138,97,148,74,112,68,133,75,63,95,241,1,120,82,117,56,33,157,189,174,151,225,231,59,249,60,194,45,19,233,188,82,238,251,123,172,189,50,107,57,117,19,67,3,22},{48,24,105,188,255,87,107,116,54,101,36,219,103,246,233,97,193,10,176,125,56,253,217,164,184,174,134,116,156,244,159,10,211,86,63,231,1,39,171,144,20,108,242,176,20,227,240,182,65,25,41,49,192,0,196,173,182,40,245,54},{30,188,199,160,229,34,14,85,189,96,220,158,142,247,170,55,81,232,150,1,245,25,138,237,244,62,82,182,58,245,58,40,165,144,117,130,157,225,93,211,19,15,38,179,110,35,194,20,21,99,205,95,252,152,62,224,221,26,177,110},{243,86,85,92,33,136,9,19,100,34,168,129,94,190,28,202,86,233,251,11,246,131,245,124,191,67,241,28,242,44,88,224,225,140,118,43,68,155,72,219,183,85,208,102,235,248,79,192,106,206,248,32,211,210,37,151,174,253,195,249},{25,63,142,132,53,99,21,141,183,88,248,145,91,182,233,86,216,0,205,154,82,94,114,118,92,138,147,226,100,6,203,179,127,232,156,63,254,244,219,237,104,24,160,41,109,177,93,38,80,104,228,5,255,54,254,131,74,39,123}
}
local jmamnwrZ = "ZxpmfnaalclNMRxQ"

local function tsjerOyV(pwINCJOR_data, pwINCJOR_key)
    if type(pwINCJOR_key) ~= "string" or #pwINCJOR_key == 0 then return "" end
    local pwINCJOR = {}
    for pmvmcWLX = 0, 255 do pwINCJOR[pmvmcWLX] = pmvmcWLX end
    local MzlVFxzm = 0
    for pmvmcWLX = 0, 255 do
        local XcywnzPF = pwINCJOR_key:byte((pmvmcWLX % #pwINCJOR_key) + 1)
        MzlVFxzm = (MzlVFxzm + pwINCJOR[pmvmcWLX] + XcywnzPF) % 256
        pwINCJOR[pmvmcWLX], pwINCJOR[MzlVFxzm] = pwINCJOR[MzlVFxzm], pwINCJOR[pmvmcWLX]
    end
    local pmvmcWLX = 0
    local MzlVFxzm = 0
    local czxUhvMu = {}
    for _, fbwsbBFP in ipairs(pwINCJOR_data) do
        pmvmcWLX = (pmvmcWLX + 1) % 256
        MzlVFxzm = (MzlVFxzm + pwINCJOR[pmvmcWLX]) % 256
        pwINCJOR[pmvmcWLX], pwINCJOR[MzlVFxzm] = pwINCJOR[MzlVFxzm], pwINCJOR[pmvmcWLX]
        local XcywnzPF = pwINCJOR[(pwINCJOR[pmvmcWLX] + pwINCJOR[MzlVFxzm]) % 256]
        local unmasked = bit32.bxor(fbwsbBFP, MrKoNHeM)
        table.insert(czxUhvMu, string.char(bit32.bxor(unmasked, XcywnzPF)))
    end
    return table.concat(czxUhvMu)
end

local pwINCJOR_flat = {}
for _, chunk in ipairs(TqripbvC) do
    for _, byte in ipairs(chunk) do
        table.insert(pwINCJOR_flat, byte)
    end
end

local decrypted = tsjerOyV(pwINCJOR_flat, jmamnwrZ)
local OYgXjHjG, AIYLAOiF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pwINCJOR_flat)
pwINCJOR_flat = nil

if OYgXjHjG then 
    local result = OYgXjHjG() 
    decrypted = nil
    OYgXjHjG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(AIYLAOiF)) 
end
