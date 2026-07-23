-- Protected Segment (cache_invalidation)
local hWAsbqEh = 10
local SFvhngvD = {
{98,114,199,4,250,62,55,66,247,35,44,13,252,165,17,101,208,231,177,176,124,130,49,17,224,153,138,19,108,14,156,38,234,2,247,201,176,92,222,57,196,103,134,14,88,6,0,60,190,88,109,118,56,60,121,106,26,163,215,40},{246,26,94,220,206,194,51,11,41,91,10,150,65,79,238,99,119,205,247,40,57,249,140,65,253,39,95,57,161,81,64,132,37,125,110,209,101,234,103,5,45,147,79,40,103,36,246,33,184,222,8,106,226,132,151,129,131,240,179,215},{210,254,226,81,78,92,81,190,91,100,135,242,224,94,80,52,164,176,164,209,34,141,81,102,23,202,233,209,210,63}
}
local zvCfwsbf = "ZXRvxrTMJDOgqwkO"

local function eLDdQeJA(yRvshHeE_data, yRvshHeE_key)
    if type(yRvshHeE_key) ~= "string" or #yRvshHeE_key == 0 then return "" end
    local yRvshHeE = {}
    for rLlLsoxq = 0, 255 do yRvshHeE[rLlLsoxq] = rLlLsoxq end
    local kQTkfVAB = 0
    for rLlLsoxq = 0, 255 do
        local acIbQsEc = yRvshHeE_key:byte((rLlLsoxq % #yRvshHeE_key) + 1)
        kQTkfVAB = (kQTkfVAB + yRvshHeE[rLlLsoxq] + acIbQsEc) % 256
        yRvshHeE[rLlLsoxq], yRvshHeE[kQTkfVAB] = yRvshHeE[kQTkfVAB], yRvshHeE[rLlLsoxq]
    end
    local rLlLsoxq = 0
    local kQTkfVAB = 0
    local OCPYuECg = {}
    for _, syCwFURi in ipairs(yRvshHeE_data) do
        rLlLsoxq = (rLlLsoxq + 1) % 256
        kQTkfVAB = (kQTkfVAB + yRvshHeE[rLlLsoxq]) % 256
        yRvshHeE[rLlLsoxq], yRvshHeE[kQTkfVAB] = yRvshHeE[kQTkfVAB], yRvshHeE[rLlLsoxq]
        local acIbQsEc = yRvshHeE[(yRvshHeE[rLlLsoxq] + yRvshHeE[kQTkfVAB]) % 256]
        local unmasked = bit32.bxor(syCwFURi, hWAsbqEh)
        table.insert(OCPYuECg, string.char(bit32.bxor(unmasked, acIbQsEc)))
    end
    return table.concat(OCPYuECg)
end

local yRvshHeE_flat = {}
for _, chunk in ipairs(SFvhngvD) do
    for _, byte in ipairs(chunk) do
        table.insert(yRvshHeE_flat, byte)
    end
end

local decrypted = eLDdQeJA(yRvshHeE_flat, zvCfwsbf)
local RsEwWwWg, BLuWBEQD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yRvshHeE_flat)
yRvshHeE_flat = nil

if RsEwWwWg then 
    local result = RsEwWwWg() 
    decrypted = nil
    RsEwWwWg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(BLuWBEQD)) 
end
