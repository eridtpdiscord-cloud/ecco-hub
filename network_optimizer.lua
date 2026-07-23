-- Protected Segment (network_optimizer)
local NCEpaCgm = 4
local gchAOozz = {
{233,161,216,241,136,72,63,135,61,12,111,105,239,192,63,143,224,240,216,217,120,96,224,77,242,222,66,110,144,137,226,222,20,195,145,17,187,21,52,255,56,95,100,90,150,114,26,145,135,249,19,88,100,168,198,5,152,159,158,20},{82,193,109,46,16,43,182,140,206,242,45,75,241,55,168,133,80,126,247,182,212,66,115,193,144,36,214,148,25,222,226,165,100,191,164,191,104,44,28,218,193,53,6,201,225,236,43,12,1,159,62,186,211,97,149,114,21,125,78,131},{90,12,139,33,140,2,165,148,47,82,121,247,186,206,3,1,137,99,35,88,85,217,93,153,82,219,135,74,250}
}
local UGfaRIBp = "uYGmxNXUYtrBcdpb"

local function WrPdRSqu(jIWCItAu_data, jIWCItAu_key)
    if type(jIWCItAu_key) ~= "string" or #jIWCItAu_key == 0 then return "" end
    local jIWCItAu = {}
    for LKctrzaz = 0, 255 do jIWCItAu[LKctrzaz] = LKctrzaz end
    local HXiJUALK = 0
    for LKctrzaz = 0, 255 do
        local irPMiHPR = jIWCItAu_key:byte((LKctrzaz % #jIWCItAu_key) + 1)
        HXiJUALK = (HXiJUALK + jIWCItAu[LKctrzaz] + irPMiHPR) % 256
        jIWCItAu[LKctrzaz], jIWCItAu[HXiJUALK] = jIWCItAu[HXiJUALK], jIWCItAu[LKctrzaz]
    end
    local LKctrzaz = 0
    local HXiJUALK = 0
    local jqhvJAXP = {}
    for _, sVEfyreP in ipairs(jIWCItAu_data) do
        LKctrzaz = (LKctrzaz + 1) % 256
        HXiJUALK = (HXiJUALK + jIWCItAu[LKctrzaz]) % 256
        jIWCItAu[LKctrzaz], jIWCItAu[HXiJUALK] = jIWCItAu[HXiJUALK], jIWCItAu[LKctrzaz]
        local irPMiHPR = jIWCItAu[(jIWCItAu[LKctrzaz] + jIWCItAu[HXiJUALK]) % 256]
        local unmasked = bit32.bxor(sVEfyreP, NCEpaCgm)
        table.insert(jqhvJAXP, string.char(bit32.bxor(unmasked, irPMiHPR)))
    end
    return table.concat(jqhvJAXP)
end

local jIWCItAu_flat = {}
for _, chunk in ipairs(gchAOozz) do
    for _, byte in ipairs(chunk) do
        table.insert(jIWCItAu_flat, byte)
    end
end

local decrypted = WrPdRSqu(jIWCItAu_flat, UGfaRIBp)
local LwrERGzD, ujqgCZDG = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jIWCItAu_flat)
jIWCItAu_flat = nil

if LwrERGzD then 
    local result = LwrERGzD() 
    decrypted = nil
    LwrERGzD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(ujqgCZDG)) 
end
