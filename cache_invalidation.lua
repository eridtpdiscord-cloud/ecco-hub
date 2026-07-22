-- Protected Segment (cache_invalidation)
local IzcznBSj = 210
local JGocUMln = {
{199,29,243,161,189,201,11,23,201,180,36,140,235,139,33,37,169,2,0,230,134,214,195,20,41,1,122,1,91,92,195,38,61,91,82,108,239,136,171,31,194,44,134,74,71,24,145,131,73,130,207,66,94,113,77,159,84,58,93,117},{186,78,96,218,244,64,193,50,63,177,144,197,14,34,141,104,250,22,57,184,87,103,67,231,15,43,97,57,69,235,144,230,190,53,220,196,248,12,141,223,245,69,189,82,87,74,153,57,75,8,197,43,45,32,115,31,138,222,189,112},{42,130,118,194,116,22,114,58,128,212,241,7,221,137,190,92,137,20,132,151,213,19,136,254,59,221,12,224,166,177}
}
local eIZxuElN = "xwxZpEMgadNdUCrB"

local function xenomnpD(wXSoGlda_data, wXSoGlda_key)
    local wXSoGlda = {}
    for VkzNyDaU = 0, 255 do wXSoGlda[VkzNyDaU] = VkzNyDaU end
    local RcVavNxP = 0
    for VkzNyDaU = 0, 255 do
        local UfblttMa = wXSoGlda_key:byte((VkzNyDaU % #wXSoGlda_key) + 1)
        RcVavNxP = (RcVavNxP + wXSoGlda[VkzNyDaU] + UfblttMa) % 256
        wXSoGlda[VkzNyDaU], wXSoGlda[RcVavNxP] = wXSoGlda[RcVavNxP], wXSoGlda[VkzNyDaU]
    end
    local VkzNyDaU = 0
    local RcVavNxP = 0
    local naiLXAli = {}
    for _, VCpozFoT in ipairs(wXSoGlda_data) do
        VkzNyDaU = (VkzNyDaU + 1) % 256
        RcVavNxP = (RcVavNxP + wXSoGlda[VkzNyDaU]) % 256
        wXSoGlda[VkzNyDaU], wXSoGlda[RcVavNxP] = wXSoGlda[RcVavNxP], wXSoGlda[VkzNyDaU]
        local UfblttMa = wXSoGlda[(wXSoGlda[VkzNyDaU] + wXSoGlda[RcVavNxP]) % 256]
        local unmasked = bit32.bxor(VCpozFoT, IzcznBSj)
        table.insert(naiLXAli, string.char(bit32.bxor(unmasked, UfblttMa)))
    end
    return table.concat(naiLXAli)
end

local wXSoGlda_flat = {}
for _, chunk in ipairs(JGocUMln) do
    for _, byte in ipairs(chunk) do
        table.insert(wXSoGlda_flat, byte)
    end
end

local decrypted = xenomnpD(wXSoGlda_flat, eIZxuElN)
local JqwvTodL, dzpBDrPB = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(wXSoGlda_flat)
wXSoGlda_flat = nil

if JqwvTodL then 
    local result = JqwvTodL() 
    decrypted = nil
    JqwvTodL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(dzpBDrPB)) 
end
