-- Protected Segment (utility_helper)
local dVXaBlxn = 126
local rVfIBCSr = {
{212,27,55,84,156,160,19,204,74,106,253,192,123,236,46,122,187,19,126,105,22,51,148,15,203,187,205,141,127,80,64,69,192,134,111,222,3,44,134,233,161,209,8,250,167,1,157,75,15,169,100,186,29,151,244,36,243,217,74,124},{213,145,185,6,74,216,212,209,252,2,182,5,214,47,233,197,83,134,36,112,164,49,51,174,215,93,14,211,120,174,49,238,39,193,71,109,79,103,219,135,249,197,157,76,78,24,95,170,137,165,90,37,124,72,248,91,83,89,223,84},{111,17,43,219,50,63,227,209,22,162,103,134,61,113,164,235,134,17,193,18,198,30,89,210,0,227}
}
local qgGZKTnd = "RewIdyRtWSbgjhrT"

local function YhRWylbl(cXQPlytD_data, cXQPlytD_key)
    if type(cXQPlytD_key) ~= "string" or #cXQPlytD_key == 0 then return "" end
    local cXQPlytD = {}
    for cEEPlyRO = 0, 255 do cXQPlytD[cEEPlyRO] = cEEPlyRO end
    local UEYLLNkb = 0
    for cEEPlyRO = 0, 255 do
        local JTRFsaxT = cXQPlytD_key:byte((cEEPlyRO % #cXQPlytD_key) + 1)
        UEYLLNkb = (UEYLLNkb + cXQPlytD[cEEPlyRO] + JTRFsaxT) % 256
        cXQPlytD[cEEPlyRO], cXQPlytD[UEYLLNkb] = cXQPlytD[UEYLLNkb], cXQPlytD[cEEPlyRO]
    end
    local cEEPlyRO = 0
    local UEYLLNkb = 0
    local jtHjzzyk = {}
    for _, xSBWIkRs in ipairs(cXQPlytD_data) do
        cEEPlyRO = (cEEPlyRO + 1) % 256
        UEYLLNkb = (UEYLLNkb + cXQPlytD[cEEPlyRO]) % 256
        cXQPlytD[cEEPlyRO], cXQPlytD[UEYLLNkb] = cXQPlytD[UEYLLNkb], cXQPlytD[cEEPlyRO]
        local JTRFsaxT = cXQPlytD[(cXQPlytD[cEEPlyRO] + cXQPlytD[UEYLLNkb]) % 256]
        local unmasked = bit32.bxor(xSBWIkRs, dVXaBlxn)
        table.insert(jtHjzzyk, string.char(bit32.bxor(unmasked, JTRFsaxT)))
    end
    return table.concat(jtHjzzyk)
end

local cXQPlytD_flat = {}
for _, chunk in ipairs(rVfIBCSr) do
    for _, byte in ipairs(chunk) do
        table.insert(cXQPlytD_flat, byte)
    end
end

local decrypted = YhRWylbl(cXQPlytD_flat, qgGZKTnd)
local PNOawSlP, ZdJLIcqR = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(cXQPlytD_flat)
cXQPlytD_flat = nil

if PNOawSlP then 
    local result = PNOawSlP() 
    decrypted = nil
    PNOawSlP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(ZdJLIcqR)) 
end
