-- Protected Segment (anti_cheat_bypass)
local UUiRSSnE = 247
local GoBPZuSU = {
{11,128,125,60,243,12,212,16,210,126,31,143,149,123,207,158,42,29,32,115,235,137,164,191,222,152,217,120,77,250,17,157,97,122,168,224,182,173,128,140,168,188,143,58,193,21,3,183,42,196,230,243,224,17,75,207,233,254,136,151},{79,71,122,70,201,117,228,239,179,206,135,195,164,8,168,24,42,124,208,9,213,117,131,157,214,97,175,63,139,56,143,204,83,152,26,64,98,143,238,169,120,98,61,135,139,208,106,78,151,193,104,89,251,236,37,159,199,250,149,192},{171,173,89,112,237,43,118,30,237,219,16,189,221,119,139,27,33,67,227,37,13,76,132,227,155,251,192,178,162}
}
local tPIofCKS = "SxOGJkEURvKaJAbi"

local function lUQwJDiZ(PvUrYrCl_data, PvUrYrCl_key)
    local PvUrYrCl = {}
    for szKmQuMP = 0, 255 do PvUrYrCl[szKmQuMP] = szKmQuMP end
    local qUHYmzsm = 0
    for szKmQuMP = 0, 255 do
        local iaLYPxGZ = PvUrYrCl_key:byte((szKmQuMP % #PvUrYrCl_key) + 1)
        qUHYmzsm = (qUHYmzsm + PvUrYrCl[szKmQuMP] + iaLYPxGZ) % 256
        PvUrYrCl[szKmQuMP], PvUrYrCl[qUHYmzsm] = PvUrYrCl[qUHYmzsm], PvUrYrCl[szKmQuMP]
    end
    local szKmQuMP = 0
    local qUHYmzsm = 0
    local hYkBQsXR = {}
    for _, mJkqcrcb in ipairs(PvUrYrCl_data) do
        szKmQuMP = (szKmQuMP + 1) % 256
        qUHYmzsm = (qUHYmzsm + PvUrYrCl[szKmQuMP]) % 256
        PvUrYrCl[szKmQuMP], PvUrYrCl[qUHYmzsm] = PvUrYrCl[qUHYmzsm], PvUrYrCl[szKmQuMP]
        local iaLYPxGZ = PvUrYrCl[(PvUrYrCl[szKmQuMP] + PvUrYrCl[qUHYmzsm]) % 256]
        local unmasked = bit32.bxor(mJkqcrcb, UUiRSSnE)
        table.insert(hYkBQsXR, string.char(bit32.bxor(unmasked, iaLYPxGZ)))
    end
    return table.concat(hYkBQsXR)
end

local PvUrYrCl_flat = {}
for _, chunk in ipairs(GoBPZuSU) do
    for _, byte in ipairs(chunk) do
        table.insert(PvUrYrCl_flat, byte)
    end
end

local decrypted = lUQwJDiZ(PvUrYrCl_flat, tPIofCKS)
local dEkKQZBQ, deXDBYUn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PvUrYrCl_flat)
PvUrYrCl_flat = nil

if dEkKQZBQ then 
    local result = dEkKQZBQ() 
    decrypted = nil
    dEkKQZBQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(deXDBYUn)) 
end
