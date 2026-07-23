-- Protected Segment (anti_cheat_bypass)
local EnmMfAWu = 37
local UFwXQUiM = {
{181,97,169,13,39,238,78,179,39,127,254,104,241,52,8,93,224,213,120,167,228,215,37,84,226,163,15,255,213,19,189,148,129,140,105,50,66,122,97,237,72,233,76,106,197,4,183,81,29,153,239,40,231,187,44,115,237,16,6,189},{101,147,231,235,156,167,24,98,228,70,3,13,204,139,27,154,136,16,160,16,76,249,236,89,44,123,178,165,153,253,43,11,22,162,29,21,219,114,214,118,146,24,110,109,80,174,53,157,52,141,21,145,113,87,77,45,169,52,37,64},{197,207,4,51,42,91,199,0,33,177,195,78,32,107,22,111,42,193,242,16,119,160,182,153,155,109,70,186,39}
}
local efDfCTKV = "cvccgJiCSaDKIeFy"

local function TvljGhuC(GQPnVOKH_data, GQPnVOKH_key)
    if type(GQPnVOKH_key) ~= "string" or #GQPnVOKH_key == 0 then return "" end
    local GQPnVOKH = {}
    for QjEAptzm = 0, 255 do GQPnVOKH[QjEAptzm] = QjEAptzm end
    local qtlFoJHi = 0
    for QjEAptzm = 0, 255 do
        local ZWOACGDd = GQPnVOKH_key:byte((QjEAptzm % #GQPnVOKH_key) + 1)
        qtlFoJHi = (qtlFoJHi + GQPnVOKH[QjEAptzm] + ZWOACGDd) % 256
        GQPnVOKH[QjEAptzm], GQPnVOKH[qtlFoJHi] = GQPnVOKH[qtlFoJHi], GQPnVOKH[QjEAptzm]
    end
    local QjEAptzm = 0
    local qtlFoJHi = 0
    local eOZetOtz = {}
    for _, CCHAqQLz in ipairs(GQPnVOKH_data) do
        QjEAptzm = (QjEAptzm + 1) % 256
        qtlFoJHi = (qtlFoJHi + GQPnVOKH[QjEAptzm]) % 256
        GQPnVOKH[QjEAptzm], GQPnVOKH[qtlFoJHi] = GQPnVOKH[qtlFoJHi], GQPnVOKH[QjEAptzm]
        local ZWOACGDd = GQPnVOKH[(GQPnVOKH[QjEAptzm] + GQPnVOKH[qtlFoJHi]) % 256]
        local unmasked = bit32.bxor(CCHAqQLz, EnmMfAWu)
        table.insert(eOZetOtz, string.char(bit32.bxor(unmasked, ZWOACGDd)))
    end
    return table.concat(eOZetOtz)
end

local GQPnVOKH_flat = {}
for _, chunk in ipairs(UFwXQUiM) do
    for _, byte in ipairs(chunk) do
        table.insert(GQPnVOKH_flat, byte)
    end
end

local decrypted = TvljGhuC(GQPnVOKH_flat, efDfCTKV)
local xeLZrPvK, hAayNxTw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GQPnVOKH_flat)
GQPnVOKH_flat = nil

if xeLZrPvK then 
    local result = xeLZrPvK() 
    decrypted = nil
    xeLZrPvK = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(hAayNxTw)) 
end
