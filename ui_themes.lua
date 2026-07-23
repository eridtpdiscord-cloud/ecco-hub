-- Protected Segment (ui_themes)
local CaaAruYz = 119
local tREQZKYz = {
{206,239,93,203,150,62,153,74,155,223,68,107,84,102,46,241,47,215,141,106,235,63,204,246,229,3,149,128,129,214,214,6,196,136,101,28,35,188,108,169,234,227,38,137,81,41,220,27,55,133,116,102,207,133,148,207,243,118,53,11},{239,187,173,154,222,158,249,65,46,37,0,36,230,79,65,217,136,9,37,225,16,140,215,252,131,81,64,158,180,77,191,42,22,100,211,11,239,163,89,213,18,195,182,161,160,169,148,84,14,128,228,181,230,54,163,146,116,116,50,238},{146,196,147,88,21,97,89,142,81,50,78,230,14,134,7,180,145,63,85,98,81}
}
local TtZHkYYe = "MjDfjUzTYBiulqGN"

local function acDtDrlL(ItHpThRq_data, ItHpThRq_key)
    if type(ItHpThRq_key) ~= "string" or #ItHpThRq_key == 0 then return "" end
    local ItHpThRq = {}
    for VMFryXcw = 0, 255 do ItHpThRq[VMFryXcw] = VMFryXcw end
    local XWaPWxSk = 0
    for VMFryXcw = 0, 255 do
        local zKoaPigS = ItHpThRq_key:byte((VMFryXcw % #ItHpThRq_key) + 1)
        XWaPWxSk = (XWaPWxSk + ItHpThRq[VMFryXcw] + zKoaPigS) % 256
        ItHpThRq[VMFryXcw], ItHpThRq[XWaPWxSk] = ItHpThRq[XWaPWxSk], ItHpThRq[VMFryXcw]
    end
    local VMFryXcw = 0
    local XWaPWxSk = 0
    local goQdsejR = {}
    for _, tLfnhkNz in ipairs(ItHpThRq_data) do
        VMFryXcw = (VMFryXcw + 1) % 256
        XWaPWxSk = (XWaPWxSk + ItHpThRq[VMFryXcw]) % 256
        ItHpThRq[VMFryXcw], ItHpThRq[XWaPWxSk] = ItHpThRq[XWaPWxSk], ItHpThRq[VMFryXcw]
        local zKoaPigS = ItHpThRq[(ItHpThRq[VMFryXcw] + ItHpThRq[XWaPWxSk]) % 256]
        local unmasked = bit32.bxor(tLfnhkNz, CaaAruYz)
        table.insert(goQdsejR, string.char(bit32.bxor(unmasked, zKoaPigS)))
    end
    return table.concat(goQdsejR)
end

local ItHpThRq_flat = {}
for _, chunk in ipairs(tREQZKYz) do
    for _, byte in ipairs(chunk) do
        table.insert(ItHpThRq_flat, byte)
    end
end

local decrypted = acDtDrlL(ItHpThRq_flat, TtZHkYYe)
local SpBjYGHy, jHviKXFV = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ItHpThRq_flat)
ItHpThRq_flat = nil

if SpBjYGHy then 
    local result = SpBjYGHy() 
    decrypted = nil
    SpBjYGHy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(jHviKXFV)) 
end
