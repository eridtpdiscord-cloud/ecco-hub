-- Compiled secure segment
local EKTqRYsY = {
{3,179,61,191,225,173,149,223,61,207,40,55,83,251,133,180,36,14,58,215,247,42,108,249,21,93,9,131,96,220,247,26,212,254,205,219,38,26,45,101,76,176,15,26,11,70,69,1,64,163,160,48,226,57,41,235,17,29,28,248},{5,224,157,48,97,59,34,221,152,251,185,244,157,19,245,198,193,132,90,105,73,8,66,8,161,174,151,69,25,159,157,206,143,165,33,44,92,151,247,94,199,222,92,31,102,40,44,246,171,138,67,16,47,188,74,40,77,254,239,249},{60,26,241,117,206,146,144,4,147,94,231,168,193,217,8,200,216,230,242,90,22,11,207,195,92,100,156,159,151,6}
}
local DSYPhaYP = "oFMGyZJaFQdeCWTF"

local function hBOQHICx(hqnXtCHR_data, hqnXtCHR_key)
    local hqnXtCHR = {}
    for aaCSwvHk = 0, 255 do hqnXtCHR[aaCSwvHk] = aaCSwvHk end
    local AeeDBdNf = 0
    for aaCSwvHk = 0, 255 do
        local PtViypBI = hqnXtCHR_key:byte((aaCSwvHk % #hqnXtCHR_key) + 1)
        AeeDBdNf = (AeeDBdNf + hqnXtCHR[aaCSwvHk] + PtViypBI) % 256
        hqnXtCHR[aaCSwvHk], hqnXtCHR[AeeDBdNf] = hqnXtCHR[AeeDBdNf], hqnXtCHR[aaCSwvHk]
    end
    local aaCSwvHk = 0
    local AeeDBdNf = 0
    local RHtTiBhL = {}
    for _, YSlMoqTL in ipairs(hqnXtCHR_data) do
        aaCSwvHk = (aaCSwvHk + 1) % 256
        AeeDBdNf = (AeeDBdNf + hqnXtCHR[aaCSwvHk]) % 256
        hqnXtCHR[aaCSwvHk], hqnXtCHR[AeeDBdNf] = hqnXtCHR[AeeDBdNf], hqnXtCHR[aaCSwvHk]
        local PtViypBI = hqnXtCHR[(hqnXtCHR[aaCSwvHk] + hqnXtCHR[AeeDBdNf]) % 256]
        table.insert(RHtTiBhL, string.char(bit32.bxor(YSlMoqTL, PtViypBI)))
    end
    return table.concat(RHtTiBhL)
end

local hqnXtCHR_flat = {}
for _, chunk in ipairs(EKTqRYsY) do
    for _, byte in ipairs(chunk) do
        table.insert(hqnXtCHR_flat, byte)
    end
end

local decrypted = hBOQHICx(hqnXtCHR_flat, DSYPhaYP)
local ntWYzkUd, caFooDrp = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(hqnXtCHR_flat)
hqnXtCHR_flat = nil

if ntWYzkUd then 
    local result = ntWYzkUd() 
    decrypted = nil
    ntWYzkUd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(caFooDrp)) 
end
