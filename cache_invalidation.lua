-- Protected Segment (cache_invalidation)
local VqXwxKns = 140
local KJMVkEUn = {
{197,210,248,122,151,18,217,66,228,222,254,167,169,178,130,249,200,4,129,109,133,25,22,224,193,177,153,132,36,22,107,12,175,239,187,45,113,191,82,143,123,72,27,123,241,43,52,213,62,232,237,165,226,62,236,70,146,239,3,17},{204,201,44,19,232,225,9,231,207,67,52,153,64,160,213,230,91,73,149,153,57,41,27,100,110,225,177,208,82,22,85,225,6,98,123,164,132,185,151,1,230,169,17,129,73,111,25,220,172,99,135,204,248,37,221,90,144,125,121,218},{94,221,31,186,18,180,88,79,202,14,166,43,8,66,167,206,155,114,35,112,157,89,224,105,46,144,31,233,192,9}
}
local eaJbPPoh = "veqrfsJNJIBFDEWG"

local function rKLmXOGC(PPfhxJht_data, PPfhxJht_key)
    if type(PPfhxJht_key) ~= "string" or #PPfhxJht_key == 0 then return "" end
    local PPfhxJht = {}
    for iBFcJGua = 0, 255 do PPfhxJht[iBFcJGua] = iBFcJGua end
    local ljQPRYaA = 0
    for iBFcJGua = 0, 255 do
        local igJQjBJn = PPfhxJht_key:byte((iBFcJGua % #PPfhxJht_key) + 1)
        ljQPRYaA = (ljQPRYaA + PPfhxJht[iBFcJGua] + igJQjBJn) % 256
        PPfhxJht[iBFcJGua], PPfhxJht[ljQPRYaA] = PPfhxJht[ljQPRYaA], PPfhxJht[iBFcJGua]
    end
    local iBFcJGua = 0
    local ljQPRYaA = 0
    local OSNzvYbX = {}
    for _, hXzNbLkp in ipairs(PPfhxJht_data) do
        iBFcJGua = (iBFcJGua + 1) % 256
        ljQPRYaA = (ljQPRYaA + PPfhxJht[iBFcJGua]) % 256
        PPfhxJht[iBFcJGua], PPfhxJht[ljQPRYaA] = PPfhxJht[ljQPRYaA], PPfhxJht[iBFcJGua]
        local igJQjBJn = PPfhxJht[(PPfhxJht[iBFcJGua] + PPfhxJht[ljQPRYaA]) % 256]
        local unmasked = bit32.bxor(hXzNbLkp, VqXwxKns)
        table.insert(OSNzvYbX, string.char(bit32.bxor(unmasked, igJQjBJn)))
    end
    return table.concat(OSNzvYbX)
end

local PPfhxJht_flat = {}
for _, chunk in ipairs(KJMVkEUn) do
    for _, byte in ipairs(chunk) do
        table.insert(PPfhxJht_flat, byte)
    end
end

local decrypted = rKLmXOGC(PPfhxJht_flat, eaJbPPoh)
local lQaVxPfp, zLXpsdmz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PPfhxJht_flat)
PPfhxJht_flat = nil

if lQaVxPfp then 
    local result = lQaVxPfp() 
    decrypted = nil
    lQaVxPfp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(zLXpsdmz)) 
end
