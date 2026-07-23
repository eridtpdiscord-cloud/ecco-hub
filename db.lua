-- Protected Segment (db)
local XiZRaQeM = 162
local NGwlBOtc = {
{67,179,136,181,48,153,8,165,214,144,100,141,240,43,104,59,158,3,25,226,179,54,155,188,80,183,244,126,55,247,2,204,236,241,220,122,108,99,188,42,186,215,8,191,241,88,172,105,185,249,121,154,0,160,91,16,23,191,79,84},{76,220,115,197,104,56,214,253,2,228,242,171,21,58,197,198,4,52,6,216,178,188,95,152,91,139,82,201,153,195,219,48,169,27,195,204,0,254,81,210,75,77,213,163,45,218,143,161,178,148,225,146,84,213,25,148,199,16,251,4},{81,192,55,240,233,215,26,49,63,209,150,45,148,90,0,21,176,65,52,87,43,78,160,87,171,152,64,110,80,26,182,6,172,194,175,32,54,135,92,240,220,16,13,60,46,216,130,25,94,189,67,242,29,42,60,135,181,34,199,207},{4,80,224,243,83,150,152,119,187,179,115,147,15,94,28,150,193,127,108,181,105,84,64,141,76,88,45,185,29,133,214,217,241,207,192,195,124,26,47,95,111,121,8,202,242,159,0,121,224,149,126,178,50,27,250,101,113,183,121,88},{12,30,24,157,111,32,103,199,30,221,125,226,79,162,219,209,248,95,123,198,101,81,94,247,176,6,150,192,189,234,64,180,20,90,247,92,79,70,243,21,13,22,57,92,41,229,111,83,94,209,166,114,170,14,186,67,189,5,71,225},{225,25,43,220,247,53,1,224,201,189,209,111,233,104,229,68,23,132,86,70,85,52,156,131,248,55,199,134,141,241,68,245,249,210,116,9,121,198,144,187,153,20,199,228,47,86,84,191,190,12,181,201,147,43,173,148,241,45,236,118},{150,174,62,213,44,173,241,95,51,33,157,59,208,197,7,129,41,144,36,83,246,88,251,210,88,63,111,72,254,163,172,31,20,144,107,169,17,53,187,143,58,43,173,148,197,134,175,179,204,59,222,207,236,171,31,234,236,149,44,3},{148,61,57,102,161,26,69,108,198,150,112,180,97,105,35,3,65,170,63,153,166,78,96,13,221,64,16,48,17,59,17,77,244,249,45,94,120,110,91,231,157,75,194,29,42,113,226,23,45,184,211,102,93,119,193,66,232,157,196}
}
local rGYBySFC = "WvPiDyZncwLiOnCv"

local function eQHTWSnD(VyxxhaeS_data, VyxxhaeS_key)
    if type(VyxxhaeS_key) ~= "string" or #VyxxhaeS_key == 0 then return "" end
    local VyxxhaeS = {}
    for uFxjHTRh = 0, 255 do VyxxhaeS[uFxjHTRh] = uFxjHTRh end
    local zquZjuAI = 0
    for uFxjHTRh = 0, 255 do
        local DsoIEnaw = VyxxhaeS_key:byte((uFxjHTRh % #VyxxhaeS_key) + 1)
        zquZjuAI = (zquZjuAI + VyxxhaeS[uFxjHTRh] + DsoIEnaw) % 256
        VyxxhaeS[uFxjHTRh], VyxxhaeS[zquZjuAI] = VyxxhaeS[zquZjuAI], VyxxhaeS[uFxjHTRh]
    end
    local uFxjHTRh = 0
    local zquZjuAI = 0
    local XpIOAWdJ = {}
    for _, bYyoVLMB in ipairs(VyxxhaeS_data) do
        uFxjHTRh = (uFxjHTRh + 1) % 256
        zquZjuAI = (zquZjuAI + VyxxhaeS[uFxjHTRh]) % 256
        VyxxhaeS[uFxjHTRh], VyxxhaeS[zquZjuAI] = VyxxhaeS[zquZjuAI], VyxxhaeS[uFxjHTRh]
        local DsoIEnaw = VyxxhaeS[(VyxxhaeS[uFxjHTRh] + VyxxhaeS[zquZjuAI]) % 256]
        local unmasked = bit32.bxor(bYyoVLMB, XiZRaQeM)
        table.insert(XpIOAWdJ, string.char(bit32.bxor(unmasked, DsoIEnaw)))
    end
    return table.concat(XpIOAWdJ)
end

local VyxxhaeS_flat = {}
for _, chunk in ipairs(NGwlBOtc) do
    for _, byte in ipairs(chunk) do
        table.insert(VyxxhaeS_flat, byte)
    end
end

local decrypted = eQHTWSnD(VyxxhaeS_flat, rGYBySFC)
local xXdaKyWd, USTRPDCz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(VyxxhaeS_flat)
VyxxhaeS_flat = nil

if xXdaKyWd then 
    local result = xXdaKyWd() 
    decrypted = nil
    xXdaKyWd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(USTRPDCz)) 
end
