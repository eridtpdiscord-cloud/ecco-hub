-- Compiled secure segment
local jDADuxnW = {
{0,3,8,33,70,207,238,118,252,246,82,146,12,78,190,151,132,57,172,197,213,187,150,100,13,12,25,199,24,2,178,169,0,165,83,48,118,37,0,65,50,141,11,103,117,130,238,82,238,141,211,71,47,209,98,100,67,205,40,191},{215,199,161,178,141,8,201,218,106,142,113,214,101,2,160,109,131,122,92,57,178,66,227,141,32,114,38,92,52,173,190,70,121,94,183,228,230,78,144,146,22,255,244,250,221,132,134,161,144,191,223,46,162,6,244,53,225,97,9,151},{33,67,13,62,124,242,135,168,241,137,222,102,67,27,224,184,228,89,26,229,142,254,13,85,207,251,217,84,43,28}
}
local JtkMhiQp = "WRzfLVFwBkWkjFyT"

local function HfvWkGTP(tKKXRzKD_data, tKKXRzKD_key)
    local tKKXRzKD = {}
    for GObxxzdI = 0, 255 do tKKXRzKD[GObxxzdI] = GObxxzdI end
    local nNgKBZOW = 0
    for GObxxzdI = 0, 255 do
        local nWgkaAtj = tKKXRzKD_key:byte((GObxxzdI % #tKKXRzKD_key) + 1)
        nNgKBZOW = (nNgKBZOW + tKKXRzKD[GObxxzdI] + nWgkaAtj) % 256
        tKKXRzKD[GObxxzdI], tKKXRzKD[nNgKBZOW] = tKKXRzKD[nNgKBZOW], tKKXRzKD[GObxxzdI]
    end
    local GObxxzdI = 0
    local nNgKBZOW = 0
    local oRRJmzaS = {}
    for _, LYFrhqJf in ipairs(tKKXRzKD_data) do
        GObxxzdI = (GObxxzdI + 1) % 256
        nNgKBZOW = (nNgKBZOW + tKKXRzKD[GObxxzdI]) % 256
        tKKXRzKD[GObxxzdI], tKKXRzKD[nNgKBZOW] = tKKXRzKD[nNgKBZOW], tKKXRzKD[GObxxzdI]
        local nWgkaAtj = tKKXRzKD[(tKKXRzKD[GObxxzdI] + tKKXRzKD[nNgKBZOW]) % 256]
        table.insert(oRRJmzaS, string.char(bit32.bxor(LYFrhqJf, nWgkaAtj)))
    end
    return table.concat(oRRJmzaS)
end

local tKKXRzKD_flat = {}
for _, chunk in ipairs(jDADuxnW) do
    for _, byte in ipairs(chunk) do
        table.insert(tKKXRzKD_flat, byte)
    end
end

local decrypted = HfvWkGTP(tKKXRzKD_flat, JtkMhiQp)
local GRCzbjUJ, WyznLXpJ = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(tKKXRzKD_flat)
tKKXRzKD_flat = nil

if GRCzbjUJ then 
    local result = GRCzbjUJ() 
    decrypted = nil
    GRCzbjUJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(WyznLXpJ)) 
end
