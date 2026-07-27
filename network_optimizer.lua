-- Protected Segment (network_optimizer)
local uznSjFip = 130
local RSYrazjN = {
{103,92,205,93,37,244,143,247,137,132,215,80,142,45,145,181,143,45,62,8,196,66,57,95,18,158,70,73,89,250,216,94,150,20,72,227,227,1,16,180,152,33,252,40,250,85,68,95,192,93,42,113,203,42,169,198,15,49,172,49},{139,99,208,189,1,32,114,235,25,186,42,233,150,175,164,91,50,179,249,126,174,175,130,38,15,175,155,130,213,164,53,235,235,100,1,42,27,114,78,183,76,139,18,240,238,3,217,29,215,36,239,62,34,236,233,162,130,38,15,205},{38,104,1,121,80,50,127,242,121,22,84,187,18,36,0,11,93,49,219,64,131,137,252,202,10,22,58,171,115}
}
local yhhcGZSn = "cLyJtUggGIQQfhJZ"

local function uoLLxNtn(RfTlXexS_data, RfTlXexS_key)
    if type(RfTlXexS_key) ~= "string" or #RfTlXexS_key == 0 then return "" end
    local RfTlXexS = {}
    for XXzlAllU = 0, 255 do RfTlXexS[XXzlAllU] = XXzlAllU end
    local HohnlYWu = 0
    for XXzlAllU = 0, 255 do
        local fDZjRUMm = RfTlXexS_key:byte((XXzlAllU % #RfTlXexS_key) + 1)
        HohnlYWu = (HohnlYWu + RfTlXexS[XXzlAllU] + fDZjRUMm) % 256
        RfTlXexS[XXzlAllU], RfTlXexS[HohnlYWu] = RfTlXexS[HohnlYWu], RfTlXexS[XXzlAllU]
    end
    local XXzlAllU = 0
    local HohnlYWu = 0
    local BkIUBcZP = {}
    for _, vJfLjFWr in ipairs(RfTlXexS_data) do
        XXzlAllU = (XXzlAllU + 1) % 256
        HohnlYWu = (HohnlYWu + RfTlXexS[XXzlAllU]) % 256
        RfTlXexS[XXzlAllU], RfTlXexS[HohnlYWu] = RfTlXexS[HohnlYWu], RfTlXexS[XXzlAllU]
        local fDZjRUMm = RfTlXexS[(RfTlXexS[XXzlAllU] + RfTlXexS[HohnlYWu]) % 256]
        local unmasked = bit32.bxor(vJfLjFWr, uznSjFip)
        table.insert(BkIUBcZP, string.char(bit32.bxor(unmasked, fDZjRUMm)))
    end
    return table.concat(BkIUBcZP)
end

local RfTlXexS_flat = {}
for _, chunk in ipairs(RSYrazjN) do
    for _, byte in ipairs(chunk) do
        table.insert(RfTlXexS_flat, byte)
    end
end

local decrypted = uoLLxNtn(RfTlXexS_flat, yhhcGZSn)
local dZDZxAtk, MTKFElnV = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RfTlXexS_flat)
RfTlXexS_flat = nil

if dZDZxAtk then 
    local result = dZDZxAtk() 
    decrypted = nil
    dZDZxAtk = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(MTKFElnV)) 
end
