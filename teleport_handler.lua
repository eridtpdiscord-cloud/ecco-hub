-- Protected Segment (teleport_handler)
local CuKWDPQo = 219
local aTYeYnHQ = {
{149,78,93,15,102,167,161,245,7,70,130,199,168,251,67,28,241,120,153,236,61,173,22,86,48,124,178,187,90,6,130,142,96,245,218,214,207,173,46,127,206,79,133,73,198,122,76,2,154,90,51,78,26,65,228,236,220,253,152,171},{43,140,167,0,114,23,31,153,106,138,122,52,201,74,164,6,221,45,150,154,141,134,43,140,104,120,102,45,41,13,234,181,63,219,39,12,145,173,121,222,166,165,44,47,162,58,238,117,13,219,204,132,248,164,8,102,162,81,4,53},{53,100,76,55,159,118,19,58,189,50,108,147,96,33,21,25,56,214,189,116,137,18,121,43,215,44,232,178}
}
local KEFgnvDh = "LRapDArxdfklWsHT"

local function wqpqzEDq(AVbePTZG_data, AVbePTZG_key)
    if type(AVbePTZG_key) ~= "string" or #AVbePTZG_key == 0 then return "" end
    local AVbePTZG = {}
    for bElqLZbY = 0, 255 do AVbePTZG[bElqLZbY] = bElqLZbY end
    local wmHVSqjT = 0
    for bElqLZbY = 0, 255 do
        local VdoWsrKh = AVbePTZG_key:byte((bElqLZbY % #AVbePTZG_key) + 1)
        wmHVSqjT = (wmHVSqjT + AVbePTZG[bElqLZbY] + VdoWsrKh) % 256
        AVbePTZG[bElqLZbY], AVbePTZG[wmHVSqjT] = AVbePTZG[wmHVSqjT], AVbePTZG[bElqLZbY]
    end
    local bElqLZbY = 0
    local wmHVSqjT = 0
    local QxRaRNwk = {}
    for _, dcrXQCzd in ipairs(AVbePTZG_data) do
        bElqLZbY = (bElqLZbY + 1) % 256
        wmHVSqjT = (wmHVSqjT + AVbePTZG[bElqLZbY]) % 256
        AVbePTZG[bElqLZbY], AVbePTZG[wmHVSqjT] = AVbePTZG[wmHVSqjT], AVbePTZG[bElqLZbY]
        local VdoWsrKh = AVbePTZG[(AVbePTZG[bElqLZbY] + AVbePTZG[wmHVSqjT]) % 256]
        local unmasked = bit32.bxor(dcrXQCzd, CuKWDPQo)
        table.insert(QxRaRNwk, string.char(bit32.bxor(unmasked, VdoWsrKh)))
    end
    return table.concat(QxRaRNwk)
end

local AVbePTZG_flat = {}
for _, chunk in ipairs(aTYeYnHQ) do
    for _, byte in ipairs(chunk) do
        table.insert(AVbePTZG_flat, byte)
    end
end

local decrypted = wqpqzEDq(AVbePTZG_flat, KEFgnvDh)
local kvKwaJAX, lCkxCqnK = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(AVbePTZG_flat)
AVbePTZG_flat = nil

if kvKwaJAX then 
    local result = kvKwaJAX() 
    decrypted = nil
    kvKwaJAX = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(lCkxCqnK)) 
end
