-- Protected Segment (anti_cheat_bypass)
local NdqHtTNA = 229
local iHUWSmTJ = {
{89,116,10,49,94,170,209,128,188,108,54,104,57,38,244,244,104,229,13,204,20,69,45,169,49,206,39,192,103,211,219,83,112,36,73,17,253,114,66,15,176,218,144,59,13,167,168,121,102,124,221,119,59,104,124,101,253,244,249,147},{217,84,63,245,55,81,131,115,76,19,160,18,152,89,86,9,222,169,190,148,136,69,213,110,109,0,200,107,220,197,25,99,49,160,2,142,133,242,33,65,99,236,148,204,27,49,103,107,251,57,161,169,68,23,186,92,75,225,166,228},{77,215,236,245,186,183,44,216,130,33,17,83,5,24,48,230,19,155,118,98,107,102,79,105,236,4,71,73,243}
}
local qtzgTYKT = "NAcMNdoxdVtEFSLE"

local function ZBfvxwuk(DhOFnbVk_data, DhOFnbVk_key)
    if type(DhOFnbVk_key) ~= "string" or #DhOFnbVk_key == 0 then return "" end
    local DhOFnbVk = {}
    for IRIsmffm = 0, 255 do DhOFnbVk[IRIsmffm] = IRIsmffm end
    local tdEFayfm = 0
    for IRIsmffm = 0, 255 do
        local qOiUmQGY = DhOFnbVk_key:byte((IRIsmffm % #DhOFnbVk_key) + 1)
        tdEFayfm = (tdEFayfm + DhOFnbVk[IRIsmffm] + qOiUmQGY) % 256
        DhOFnbVk[IRIsmffm], DhOFnbVk[tdEFayfm] = DhOFnbVk[tdEFayfm], DhOFnbVk[IRIsmffm]
    end
    local IRIsmffm = 0
    local tdEFayfm = 0
    local obQBwVZD = {}
    for _, nHfVwPPy in ipairs(DhOFnbVk_data) do
        IRIsmffm = (IRIsmffm + 1) % 256
        tdEFayfm = (tdEFayfm + DhOFnbVk[IRIsmffm]) % 256
        DhOFnbVk[IRIsmffm], DhOFnbVk[tdEFayfm] = DhOFnbVk[tdEFayfm], DhOFnbVk[IRIsmffm]
        local qOiUmQGY = DhOFnbVk[(DhOFnbVk[IRIsmffm] + DhOFnbVk[tdEFayfm]) % 256]
        local unmasked = bit32.bxor(nHfVwPPy, NdqHtTNA)
        table.insert(obQBwVZD, string.char(bit32.bxor(unmasked, qOiUmQGY)))
    end
    return table.concat(obQBwVZD)
end

local DhOFnbVk_flat = {}
for _, chunk in ipairs(iHUWSmTJ) do
    for _, byte in ipairs(chunk) do
        table.insert(DhOFnbVk_flat, byte)
    end
end

local decrypted = ZBfvxwuk(DhOFnbVk_flat, qtzgTYKT)
local suzqdYUu, awwYQNWJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DhOFnbVk_flat)
DhOFnbVk_flat = nil

if suzqdYUu then 
    local result = suzqdYUu() 
    decrypted = nil
    suzqdYUu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(awwYQNWJ)) 
end
