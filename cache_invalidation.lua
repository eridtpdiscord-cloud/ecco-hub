-- Protected Segment (cache_invalidation)
local emmHKsbT = 5
local ECXxzyRj = {
{4,115,175,52,186,8,83,123,71,175,160,30,153,91,81,74,198,0,1,191,211,105,69,3,82,210,245,183,101,150,248,199,187,95,174,123,140,80,36,31,129,121,16,189,225,208,13,36,243,6,143,68,229,38,233,230,161,123,32,9},{114,141,193,8,143,53,183,126,171,164,67,153,196,113,244,26,47,235,180,80,190,161,75,137,53,229,5,45,84,230,64,65,5,91,173,253,74,187,161,64,4,152,116,172,214,87,5,131,188,44,86,180,135,135,136,204,253,178,34,107},{153,17,159,217,85,26,186,137,161,75,237,115,96,89,27,143,74,45,63,80,122,101,170,194,102,232,8,88,138,162}
}
local VtDZLAWl = "LfkPHuiBkSTnXZIZ"

local function TqgdCfZe(CuMyPWwX_data, CuMyPWwX_key)
    if type(CuMyPWwX_key) ~= "string" or #CuMyPWwX_key == 0 then return "" end
    local CuMyPWwX = {}
    for MTKKITrI = 0, 255 do CuMyPWwX[MTKKITrI] = MTKKITrI end
    local dKwNTAPj = 0
    for MTKKITrI = 0, 255 do
        local wHFfROAn = CuMyPWwX_key:byte((MTKKITrI % #CuMyPWwX_key) + 1)
        dKwNTAPj = (dKwNTAPj + CuMyPWwX[MTKKITrI] + wHFfROAn) % 256
        CuMyPWwX[MTKKITrI], CuMyPWwX[dKwNTAPj] = CuMyPWwX[dKwNTAPj], CuMyPWwX[MTKKITrI]
    end
    local MTKKITrI = 0
    local dKwNTAPj = 0
    local gJdSVXzE = {}
    for _, KoeDreiS in ipairs(CuMyPWwX_data) do
        MTKKITrI = (MTKKITrI + 1) % 256
        dKwNTAPj = (dKwNTAPj + CuMyPWwX[MTKKITrI]) % 256
        CuMyPWwX[MTKKITrI], CuMyPWwX[dKwNTAPj] = CuMyPWwX[dKwNTAPj], CuMyPWwX[MTKKITrI]
        local wHFfROAn = CuMyPWwX[(CuMyPWwX[MTKKITrI] + CuMyPWwX[dKwNTAPj]) % 256]
        local unmasked = bit32.bxor(KoeDreiS, emmHKsbT)
        table.insert(gJdSVXzE, string.char(bit32.bxor(unmasked, wHFfROAn)))
    end
    return table.concat(gJdSVXzE)
end

local CuMyPWwX_flat = {}
for _, chunk in ipairs(ECXxzyRj) do
    for _, byte in ipairs(chunk) do
        table.insert(CuMyPWwX_flat, byte)
    end
end

local decrypted = TqgdCfZe(CuMyPWwX_flat, VtDZLAWl)
local WrRYRRrQ, oEeyXupX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CuMyPWwX_flat)
CuMyPWwX_flat = nil

if WrRYRRrQ then 
    local result = WrRYRRrQ() 
    decrypted = nil
    WrRYRRrQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(oEeyXupX)) 
end
