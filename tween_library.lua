-- Protected Segment (tween_library)
local BmfvmYRg = 3
local SEfhZRnx = {
{6,35,16,54,184,246,165,164,141,210,197,199,181,127,248,179,101,230,233,76,177,197,112,27,164,25,26,123,146,194,106,37,23,192,13,230,125,8,235,228,18,81,159,218,57,161,167,220,94,69,247,154,21,171,0,93,18,151,119,241},{175,62,216,40,145,166,21,27,164,89,188,236,28,103,151,243,230,186,87,148,38,170,44,253,247,252,251,112,7,176,72,243,207,86,21,149,84,89,123,106,81,115,106,14,245,174,41,208,238,184,83,34,77,237,245,105,126,55,88,95},{77,135,220,116,70,191,21,120,38,84,145,220,39,137,110,176,120,68,130,162,51,156,182,84,48}
}
local DymTnWgC = "MrpZXveCzdEytXAs"

local function DgUrkaPE(DbefxVYj_data, DbefxVYj_key)
    local DbefxVYj = {}
    for hYmUFuuH = 0, 255 do DbefxVYj[hYmUFuuH] = hYmUFuuH end
    local QUwSvEvj = 0
    for hYmUFuuH = 0, 255 do
        local NwMGnVor = DbefxVYj_key:byte((hYmUFuuH % #DbefxVYj_key) + 1)
        QUwSvEvj = (QUwSvEvj + DbefxVYj[hYmUFuuH] + NwMGnVor) % 256
        DbefxVYj[hYmUFuuH], DbefxVYj[QUwSvEvj] = DbefxVYj[QUwSvEvj], DbefxVYj[hYmUFuuH]
    end
    local hYmUFuuH = 0
    local QUwSvEvj = 0
    local tuzOXhvX = {}
    for _, GfxqOIcd in ipairs(DbefxVYj_data) do
        hYmUFuuH = (hYmUFuuH + 1) % 256
        QUwSvEvj = (QUwSvEvj + DbefxVYj[hYmUFuuH]) % 256
        DbefxVYj[hYmUFuuH], DbefxVYj[QUwSvEvj] = DbefxVYj[QUwSvEvj], DbefxVYj[hYmUFuuH]
        local NwMGnVor = DbefxVYj[(DbefxVYj[hYmUFuuH] + DbefxVYj[QUwSvEvj]) % 256]
        local unmasked = bit32.bxor(GfxqOIcd, BmfvmYRg)
        table.insert(tuzOXhvX, string.char(bit32.bxor(unmasked, NwMGnVor)))
    end
    return table.concat(tuzOXhvX)
end

local DbefxVYj_flat = {}
for _, chunk in ipairs(SEfhZRnx) do
    for _, byte in ipairs(chunk) do
        table.insert(DbefxVYj_flat, byte)
    end
end

local decrypted = DgUrkaPE(DbefxVYj_flat, DymTnWgC)
local WFKtGgTa, MGiRQbAg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DbefxVYj_flat)
DbefxVYj_flat = nil

if WFKtGgTa then 
    local result = WFKtGgTa() 
    decrypted = nil
    WFKtGgTa = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(MGiRQbAg)) 
end
