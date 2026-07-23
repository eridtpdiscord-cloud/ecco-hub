-- Protected Segment (db)
local FpynVGfv = 164
local TMwOpNXY = {
{153,234,85,41,112,35,11,235,237,6,149,241,170,82,101,159,214,18,32,168,105,62,115,211,238,19,40,78,244,17,99,181,199,61,38,255,233,160,238,192,177,47,168,156,99,144,212,60,52,201,41,227,80,24,38,234,113,221,117,50},{28,138,12,139,4,131,217,221,209,98,65,128,81,171,89,65,26,164,174,66,63,111,9,234,167,194,179,182,160,94,230,162,210,254,235,104,159,121,107,9,137,81,7,91,251,95,143,202,91,178,102,167,44,113,117,180,157,71,89,202},{207,146,238,51,148,52,154,132,10,233,165,146,7,148,157,15,179,163,248,179,86,103,205,160,230,226,147,116,185,242,63,158,49,31,55,202,55,181,99,25,172,227,153,47,243,7,11,57,189,167,252,100,238,76,96,251,69,107,233,175},{21,216,10,123,255,164,70,135,23,244,49,78,225,173,147,47,79,189,194,92,37,21,9,216,113,180,144,250,232,4,6,105,31,28,137,100,223,192,228,192,12,234,57,236,90,35,72,182,20,56,215,197,142,100,225,250,16,8,105,34},{236,27,122,11,193,135,224,16,217,88,102,240,149,85,189,215,235,82,247,228,138,80,239,233,48,177,196,75,40,61,200,161,124,191,162,80,252,170,27,110,77,113,31,179,236,202,164,194,234,113,173,195,73,69,171,45,189,64,33,184},{166,15,198,145,32,71,226,90,78,9,17,214,233,27,255,170,218,73,224,83,141,60,162,234,62,249,251,250,248,229,52,236,75,203,195,128,62,221,223,164,100,20,241,108,176,88,51,230,146,148,0,74,219,122,246,28,201,118,240,19},{233,233,75,73,115,204,214,179,135,30,174,2,170,159,76,230,58,136,254,217,105,53,88,85,97,142,176,166,30,20,14,242,165,197,223,52,234,140,231,41,125,70,187,205,21,210,23,175,26,113,176,188,133,22,98,62,241,19,56,149},{63,129,253,35,93,254,185,9,15,94,34,9,219,215,249,58,97,73,208,224,133,210,239,82,64,197,15,212,37,51,180,79,185,16,187,53,123,206,234,150,224,116,243,20,18,103,181,114,2,234,255,188,5,198,195,221,223,144,11}
}
local msbRRrfA = "SsuaqipYfvVSgloL"

local function IyGGCyvS(FlWfYuFG_data, FlWfYuFG_key)
    if type(FlWfYuFG_key) ~= "string" or #FlWfYuFG_key == 0 then return "" end
    local FlWfYuFG = {}
    for JccFnIaw = 0, 255 do FlWfYuFG[JccFnIaw] = JccFnIaw end
    local HrBDRQHX = 0
    for JccFnIaw = 0, 255 do
        local AIwZNtAb = FlWfYuFG_key:byte((JccFnIaw % #FlWfYuFG_key) + 1)
        HrBDRQHX = (HrBDRQHX + FlWfYuFG[JccFnIaw] + AIwZNtAb) % 256
        FlWfYuFG[JccFnIaw], FlWfYuFG[HrBDRQHX] = FlWfYuFG[HrBDRQHX], FlWfYuFG[JccFnIaw]
    end
    local JccFnIaw = 0
    local HrBDRQHX = 0
    local OndKOpcu = {}
    for _, plppSVoO in ipairs(FlWfYuFG_data) do
        JccFnIaw = (JccFnIaw + 1) % 256
        HrBDRQHX = (HrBDRQHX + FlWfYuFG[JccFnIaw]) % 256
        FlWfYuFG[JccFnIaw], FlWfYuFG[HrBDRQHX] = FlWfYuFG[HrBDRQHX], FlWfYuFG[JccFnIaw]
        local AIwZNtAb = FlWfYuFG[(FlWfYuFG[JccFnIaw] + FlWfYuFG[HrBDRQHX]) % 256]
        local unmasked = bit32.bxor(plppSVoO, FpynVGfv)
        table.insert(OndKOpcu, string.char(bit32.bxor(unmasked, AIwZNtAb)))
    end
    return table.concat(OndKOpcu)
end

local FlWfYuFG_flat = {}
for _, chunk in ipairs(TMwOpNXY) do
    for _, byte in ipairs(chunk) do
        table.insert(FlWfYuFG_flat, byte)
    end
end

local decrypted = IyGGCyvS(FlWfYuFG_flat, msbRRrfA)
local XNgfBemI, ZSIgKHvQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FlWfYuFG_flat)
FlWfYuFG_flat = nil

if XNgfBemI then 
    local result = XNgfBemI() 
    decrypted = nil
    XNgfBemI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ZSIgKHvQ)) 
end
