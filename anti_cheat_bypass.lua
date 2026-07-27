-- Protected Segment (anti_cheat_bypass)
local achDtPdp = 235
local DhswsTWU = {
{119,147,230,52,184,132,23,47,222,17,190,32,241,87,245,246,165,148,240,219,184,53,130,229,63,136,48,49,6,123,7,32,1,120,101,150,182,247,224,155,137,178,178,134,145,154,38,244,80,253,35,1,103,170,248,28,70,62,218,48},{20,169,247,11,102,171,14,69,161,55,13,240,11,211,93,161,82,168,8,56,21,171,125,167,236,18,164,13,31,125,244,242,57,168,224,131,183,156,132,181,106,186,165,81,58,1,234,35,87,218,76,2,22,240,78,97,152,24,6,216},{3,6,103,206,24,72,140,6,238,113,253,32,162,153,56,100,25,179,82,249,44,144,244,158,136,102,13,124,98}
}
local jLdxNxHp = "LyvoNkzpvQSuSGjQ"

local function ZIwVqkQv(ivETXJST_data, ivETXJST_key)
    if type(ivETXJST_key) ~= "string" or #ivETXJST_key == 0 then return "" end
    local ivETXJST = {}
    for XCLrYxTf = 0, 255 do ivETXJST[XCLrYxTf] = XCLrYxTf end
    local cwqUAUjx = 0
    for XCLrYxTf = 0, 255 do
        local hhYJKYVW = ivETXJST_key:byte((XCLrYxTf % #ivETXJST_key) + 1)
        cwqUAUjx = (cwqUAUjx + ivETXJST[XCLrYxTf] + hhYJKYVW) % 256
        ivETXJST[XCLrYxTf], ivETXJST[cwqUAUjx] = ivETXJST[cwqUAUjx], ivETXJST[XCLrYxTf]
    end
    local XCLrYxTf = 0
    local cwqUAUjx = 0
    local JuRRIsnM = {}
    for _, CjHiZphQ in ipairs(ivETXJST_data) do
        XCLrYxTf = (XCLrYxTf + 1) % 256
        cwqUAUjx = (cwqUAUjx + ivETXJST[XCLrYxTf]) % 256
        ivETXJST[XCLrYxTf], ivETXJST[cwqUAUjx] = ivETXJST[cwqUAUjx], ivETXJST[XCLrYxTf]
        local hhYJKYVW = ivETXJST[(ivETXJST[XCLrYxTf] + ivETXJST[cwqUAUjx]) % 256]
        local unmasked = bit32.bxor(CjHiZphQ, achDtPdp)
        table.insert(JuRRIsnM, string.char(bit32.bxor(unmasked, hhYJKYVW)))
    end
    return table.concat(JuRRIsnM)
end

local ivETXJST_flat = {}
for _, chunk in ipairs(DhswsTWU) do
    for _, byte in ipairs(chunk) do
        table.insert(ivETXJST_flat, byte)
    end
end

local decrypted = ZIwVqkQv(ivETXJST_flat, jLdxNxHp)
local gstKUOep, LbQPULlt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ivETXJST_flat)
ivETXJST_flat = nil

if gstKUOep then 
    local result = gstKUOep() 
    decrypted = nil
    gstKUOep = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(LbQPULlt)) 
end
