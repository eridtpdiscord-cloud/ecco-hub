-- Protected Segment (anti_cheat_bypass)
local xzuXATum = 233
local RSkptFyV = {
{173,100,104,4,107,206,3,230,58,100,107,22,219,185,115,144,87,11,28,96,6,163,93,46,111,38,11,94,2,55,209,189,54,201,149,236,131,106,232,95,128,144,110,114,216,197,232,143,71,232,208,136,157,202,8,240,125,86,150,172},{193,218,89,27,99,162,168,30,188,195,53,63,25,182,248,165,237,195,203,144,126,241,250,136,171,34,250,65,67,124,248,226,200,152,62,204,246,181,17,62,237,69,128,137,218,154,138,104,241,45,9,169,7,78,96,104,210,106,209,61},{8,74,108,56,208,234,70,223,123,114,115,222,103,145,181,39,231,16,50,104,109,220,87,250,119,144,240,192,108}
}
local mUaTFjeb = "fYnCiTeYzAppDPxE"

local function cJlIABmB(pbKvrPHq_data, pbKvrPHq_key)
    local pbKvrPHq = {}
    for BfnGQHkN = 0, 255 do pbKvrPHq[BfnGQHkN] = BfnGQHkN end
    local wdJjpYUZ = 0
    for BfnGQHkN = 0, 255 do
        local qeNKtbWg = pbKvrPHq_key:byte((BfnGQHkN % #pbKvrPHq_key) + 1)
        wdJjpYUZ = (wdJjpYUZ + pbKvrPHq[BfnGQHkN] + qeNKtbWg) % 256
        pbKvrPHq[BfnGQHkN], pbKvrPHq[wdJjpYUZ] = pbKvrPHq[wdJjpYUZ], pbKvrPHq[BfnGQHkN]
    end
    local BfnGQHkN = 0
    local wdJjpYUZ = 0
    local YjDewQST = {}
    for _, BPiDFGIt in ipairs(pbKvrPHq_data) do
        BfnGQHkN = (BfnGQHkN + 1) % 256
        wdJjpYUZ = (wdJjpYUZ + pbKvrPHq[BfnGQHkN]) % 256
        pbKvrPHq[BfnGQHkN], pbKvrPHq[wdJjpYUZ] = pbKvrPHq[wdJjpYUZ], pbKvrPHq[BfnGQHkN]
        local qeNKtbWg = pbKvrPHq[(pbKvrPHq[BfnGQHkN] + pbKvrPHq[wdJjpYUZ]) % 256]
        local unmasked = bit32.bxor(BPiDFGIt, xzuXATum)
        table.insert(YjDewQST, string.char(bit32.bxor(unmasked, qeNKtbWg)))
    end
    return table.concat(YjDewQST)
end

local pbKvrPHq_flat = {}
for _, chunk in ipairs(RSkptFyV) do
    for _, byte in ipairs(chunk) do
        table.insert(pbKvrPHq_flat, byte)
    end
end

local decrypted = cJlIABmB(pbKvrPHq_flat, mUaTFjeb)
local vorDjrLF, izobvwgM = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pbKvrPHq_flat)
pbKvrPHq_flat = nil

if vorDjrLF then 
    local result = vorDjrLF() 
    decrypted = nil
    vorDjrLF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(izobvwgM)) 
end
