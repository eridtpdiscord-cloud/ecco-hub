-- Compiled secure segment
local vjQQWHrt = {
{143,201,230,177,152,236,59,84,207,33,144,31,169,95,186,22,237,160,142,255,94,237,197,10,234,75,112,34,35,143,214,185,113,178,229,242,71,112,19,218,99,38,243,35,250,38,82,53,215,44,193,142,56,238,87,28,94,184,173,31},{220,103,152,6,17,77,227,166,55,186,212,206,169,220,24,211,114,154,166,107,253,118,125,82,66,175,100,112,162,19,217,149,74,48,206,126,107,154,146,243,24,43,41,243,250,238,28,57,200,226,22,1,26,217,27,135,125,16,67,136},{133,50,72,151,16,208,73,107,191,172,57,61,53,145,159,244,152,2,199,8,174,77,74,73,155,249,74,115}
}
local VNirXJrq = "MhxfSceBksTetnyV"

local function UyoZsdHR(bDhMlJxd_data, bDhMlJxd_key)
    local bDhMlJxd = {}
    for vkWIoZqX = 0, 255 do bDhMlJxd[vkWIoZqX] = vkWIoZqX end
    local OeDObnZl = 0
    for vkWIoZqX = 0, 255 do
        local qgugHXum = bDhMlJxd_key:byte((vkWIoZqX % #bDhMlJxd_key) + 1)
        OeDObnZl = (OeDObnZl + bDhMlJxd[vkWIoZqX] + qgugHXum) % 256
        bDhMlJxd[vkWIoZqX], bDhMlJxd[OeDObnZl] = bDhMlJxd[OeDObnZl], bDhMlJxd[vkWIoZqX]
    end
    local vkWIoZqX = 0
    local OeDObnZl = 0
    local AstnxksA = {}
    for _, mDqiRguU in ipairs(bDhMlJxd_data) do
        vkWIoZqX = (vkWIoZqX + 1) % 256
        OeDObnZl = (OeDObnZl + bDhMlJxd[vkWIoZqX]) % 256
        bDhMlJxd[vkWIoZqX], bDhMlJxd[OeDObnZl] = bDhMlJxd[OeDObnZl], bDhMlJxd[vkWIoZqX]
        local qgugHXum = bDhMlJxd[(bDhMlJxd[vkWIoZqX] + bDhMlJxd[OeDObnZl]) % 256]
        table.insert(AstnxksA, string.char(bit32.bxor(mDqiRguU, qgugHXum)))
    end
    return table.concat(AstnxksA)
end

local bDhMlJxd_flat = {}
for _, chunk in ipairs(vjQQWHrt) do
    for _, byte in ipairs(chunk) do
        table.insert(bDhMlJxd_flat, byte)
    end
end

local decrypted = UyoZsdHR(bDhMlJxd_flat, VNirXJrq)
local NGnXOwPZ, ulHpiNnD = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(bDhMlJxd_flat)
bDhMlJxd_flat = nil

if NGnXOwPZ then 
    local result = NGnXOwPZ() 
    decrypted = nil
    NGnXOwPZ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(ulHpiNnD)) 
end
