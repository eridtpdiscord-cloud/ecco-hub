-- Protected Segment (anti_cheat_bypass)
local xDSQmpHv = 37
local JAzNQnTD = {
{191,116,125,218,162,53,5,237,34,91,152,215,208,63,158,32,149,143,209,8,81,21,2,61,167,72,147,183,43,151,255,97,174,176,10,146,169,96,141,190,174,253,39,58,236,234,7,64,72,124,158,35,159,229,120,7,9,165,82,24},{62,38,116,111,5,175,196,107,204,214,24,190,83,145,155,36,141,201,171,162,181,161,157,71,129,65,126,43,136,31,197,122,85,17,159,109,93,131,165,91,185,102,95,4,199,27,34,134,29,19,221,167,241,57,105,12,19,231,71,249},{185,8,236,119,80,55,129,236,208,136,59,210,18,214,130,172,27,174,42,64,102,44,230,158,118,215,138,174,180}
}
local kxQPmsHy = "cMboSIWVXJLuMMAI"

local function VqVZRtaa(LidCwTji_data, LidCwTji_key)
    if type(LidCwTji_key) ~= "string" or #LidCwTji_key == 0 then return "" end
    local LidCwTji = {}
    for QiiwRJpG = 0, 255 do LidCwTji[QiiwRJpG] = QiiwRJpG end
    local HeybXMjh = 0
    for QiiwRJpG = 0, 255 do
        local HsAPuIDT = LidCwTji_key:byte((QiiwRJpG % #LidCwTji_key) + 1)
        HeybXMjh = (HeybXMjh + LidCwTji[QiiwRJpG] + HsAPuIDT) % 256
        LidCwTji[QiiwRJpG], LidCwTji[HeybXMjh] = LidCwTji[HeybXMjh], LidCwTji[QiiwRJpG]
    end
    local QiiwRJpG = 0
    local HeybXMjh = 0
    local gGTdEiCN = {}
    for _, AWOpaQfo in ipairs(LidCwTji_data) do
        QiiwRJpG = (QiiwRJpG + 1) % 256
        HeybXMjh = (HeybXMjh + LidCwTji[QiiwRJpG]) % 256
        LidCwTji[QiiwRJpG], LidCwTji[HeybXMjh] = LidCwTji[HeybXMjh], LidCwTji[QiiwRJpG]
        local HsAPuIDT = LidCwTji[(LidCwTji[QiiwRJpG] + LidCwTji[HeybXMjh]) % 256]
        local unmasked = bit32.bxor(AWOpaQfo, xDSQmpHv)
        table.insert(gGTdEiCN, string.char(bit32.bxor(unmasked, HsAPuIDT)))
    end
    return table.concat(gGTdEiCN)
end

local LidCwTji_flat = {}
for _, chunk in ipairs(JAzNQnTD) do
    for _, byte in ipairs(chunk) do
        table.insert(LidCwTji_flat, byte)
    end
end

local decrypted = VqVZRtaa(LidCwTji_flat, kxQPmsHy)
local bZRLwHMN, ppARWvBh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(LidCwTji_flat)
LidCwTji_flat = nil

if bZRLwHMN then 
    local result = bZRLwHMN() 
    decrypted = nil
    bZRLwHMN = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(ppARWvBh)) 
end
