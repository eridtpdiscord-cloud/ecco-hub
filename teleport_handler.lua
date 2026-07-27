-- Protected Segment (teleport_handler)
local LBbrkIOt = 112
local IDFttDEp = {
{15,25,233,160,157,89,198,160,79,136,88,108,19,162,89,133,45,83,192,184,4,151,8,247,117,84,102,255,170,56,3,221,249,134,191,115,136,43,91,130,138,9,128,56,206,243,233,117,108,155,198,109,242,217,139,30,82,93,221,1},{250,86,154,221,13,175,174,136,65,156,243,89,194,200,219,58,56,212,213,29,205,32,16,98,45,36,56,206,64,15,101,254,39,179,40,166,16,191,3,115,203,215,108,234,216,167,112,101,79,157,189,142,121,217,61,152,3,165,2,241},{106,29,204,41,181,193,68,212,186,91,89,239,181,201,111,110,78,229,18,54,88,219,246,47,76,169,145,190}
}
local RjbUhxMG = "hnqFUpSVyHDqLeHF"

local function ugBYbTUj(zgwwzXea_data, zgwwzXea_key)
    if type(zgwwzXea_key) ~= "string" or #zgwwzXea_key == 0 then return "" end
    local zgwwzXea = {}
    for YMAXcKcz = 0, 255 do zgwwzXea[YMAXcKcz] = YMAXcKcz end
    local fOlXQOCV = 0
    for YMAXcKcz = 0, 255 do
        local HYHfqSOv = zgwwzXea_key:byte((YMAXcKcz % #zgwwzXea_key) + 1)
        fOlXQOCV = (fOlXQOCV + zgwwzXea[YMAXcKcz] + HYHfqSOv) % 256
        zgwwzXea[YMAXcKcz], zgwwzXea[fOlXQOCV] = zgwwzXea[fOlXQOCV], zgwwzXea[YMAXcKcz]
    end
    local YMAXcKcz = 0
    local fOlXQOCV = 0
    local fQgABAkJ = {}
    for _, JlRhmvJh in ipairs(zgwwzXea_data) do
        YMAXcKcz = (YMAXcKcz + 1) % 256
        fOlXQOCV = (fOlXQOCV + zgwwzXea[YMAXcKcz]) % 256
        zgwwzXea[YMAXcKcz], zgwwzXea[fOlXQOCV] = zgwwzXea[fOlXQOCV], zgwwzXea[YMAXcKcz]
        local HYHfqSOv = zgwwzXea[(zgwwzXea[YMAXcKcz] + zgwwzXea[fOlXQOCV]) % 256]
        local unmasked = bit32.bxor(JlRhmvJh, LBbrkIOt)
        table.insert(fQgABAkJ, string.char(bit32.bxor(unmasked, HYHfqSOv)))
    end
    return table.concat(fQgABAkJ)
end

local zgwwzXea_flat = {}
for _, chunk in ipairs(IDFttDEp) do
    for _, byte in ipairs(chunk) do
        table.insert(zgwwzXea_flat, byte)
    end
end

local decrypted = ugBYbTUj(zgwwzXea_flat, RjbUhxMG)
local IXHHqfby, kInjusQy = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(zgwwzXea_flat)
zgwwzXea_flat = nil

if IXHHqfby then 
    local result = IXHHqfby() 
    decrypted = nil
    IXHHqfby = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(kInjusQy)) 
end
