-- Compiled secure segment
local WmCJwfnB = {
{109,148,22,80,130,82,80,126,104,77,69,13,119,59,225,109,95,233,83,131,89,60,99,22,244,225,230,138,173,24,106,98,209,74,83,36,111,239,110,210,195,73,0,67,17,151,239,156,175,154,218,181,62,150,118,210,253,182,251,156},{18,116,92,218,43,130,116,136,160,42,22,73,113,42,80,0,146,128,39,181,157,149,200,37,165,62,201,52,177,239,8,16,244,110,195,83,211,52,20,34,181,154,56,194,83,255,58,16,136,116,231,145,98,249,148,197,4,218,62,39},{202,198,111,195,200,222,140,108,50,136,6,29,77,10,58,9,164,87,200,28,110}
}
local QlfCfmlq = "stnHGxbDSfIrzTfY"

local function elBHTevL(MEXzVbaO_data, MEXzVbaO_key)
    local MEXzVbaO = {}
    for WygrlLVd = 0, 255 do MEXzVbaO[WygrlLVd] = WygrlLVd end
    local ezMEXGyd = 0
    for WygrlLVd = 0, 255 do
        local RAbuigcc = MEXzVbaO_key:byte((WygrlLVd % #MEXzVbaO_key) + 1)
        ezMEXGyd = (ezMEXGyd + MEXzVbaO[WygrlLVd] + RAbuigcc) % 256
        MEXzVbaO[WygrlLVd], MEXzVbaO[ezMEXGyd] = MEXzVbaO[ezMEXGyd], MEXzVbaO[WygrlLVd]
    end
    local WygrlLVd = 0
    local ezMEXGyd = 0
    local PcnuthAp = {}
    for _, mlPgmPSL in ipairs(MEXzVbaO_data) do
        WygrlLVd = (WygrlLVd + 1) % 256
        ezMEXGyd = (ezMEXGyd + MEXzVbaO[WygrlLVd]) % 256
        MEXzVbaO[WygrlLVd], MEXzVbaO[ezMEXGyd] = MEXzVbaO[ezMEXGyd], MEXzVbaO[WygrlLVd]
        local RAbuigcc = MEXzVbaO[(MEXzVbaO[WygrlLVd] + MEXzVbaO[ezMEXGyd]) % 256]
        table.insert(PcnuthAp, string.char(bit32.bxor(mlPgmPSL, RAbuigcc)))
    end
    return table.concat(PcnuthAp)
end

local MEXzVbaO_flat = {}
for _, chunk in ipairs(WmCJwfnB) do
    for _, byte in ipairs(chunk) do
        table.insert(MEXzVbaO_flat, byte)
    end
end

local decrypted = elBHTevL(MEXzVbaO_flat, QlfCfmlq)
local jSszxiVJ, bOvTqcXb = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(MEXzVbaO_flat)
MEXzVbaO_flat = nil

if jSszxiVJ then 
    local result = jSszxiVJ() 
    decrypted = nil
    jSszxiVJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(bOvTqcXb)) 
end
