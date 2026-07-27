-- Protected Segment (tween_library)
local CnLmUkkn = 5
local FFNUfBpm = {
{154,31,186,218,93,17,109,226,59,125,243,88,53,52,230,170,78,224,205,181,170,61,186,16,10,37,248,156,237,253,238,255,120,173,124,164,181,59,83,91,170,168,136,165,73,193,226,239,131,51,215,164,145,213,153,100,190,93,231,59},{175,206,24,55,218,99,114,128,229,149,12,41,130,179,252,225,232,171,90,41,223,208,251,155,138,10,144,247,222,79,12,182,181,231,248,203,52,137,218,160,35,180,181,24,183,65,59,32,229,16,117,158,65,5,50,218,184,162,226,29},{118,215,172,105,112,110,51,172,89,145,175,129,252,242,194,223,97,206,140,27,70,186,122,86,102}
}
local edGgyENV = "FdYuBETMrQhKSxvo"

local function QMDQshDG(lvUJhMOW_data, lvUJhMOW_key)
    if type(lvUJhMOW_key) ~= "string" or #lvUJhMOW_key == 0 then return "" end
    local lvUJhMOW = {}
    for IBkfdzBC = 0, 255 do lvUJhMOW[IBkfdzBC] = IBkfdzBC end
    local pUKPTerT = 0
    for IBkfdzBC = 0, 255 do
        local gFxcYuDG = lvUJhMOW_key:byte((IBkfdzBC % #lvUJhMOW_key) + 1)
        pUKPTerT = (pUKPTerT + lvUJhMOW[IBkfdzBC] + gFxcYuDG) % 256
        lvUJhMOW[IBkfdzBC], lvUJhMOW[pUKPTerT] = lvUJhMOW[pUKPTerT], lvUJhMOW[IBkfdzBC]
    end
    local IBkfdzBC = 0
    local pUKPTerT = 0
    local gaTadNSv = {}
    for _, UYTUoCKW in ipairs(lvUJhMOW_data) do
        IBkfdzBC = (IBkfdzBC + 1) % 256
        pUKPTerT = (pUKPTerT + lvUJhMOW[IBkfdzBC]) % 256
        lvUJhMOW[IBkfdzBC], lvUJhMOW[pUKPTerT] = lvUJhMOW[pUKPTerT], lvUJhMOW[IBkfdzBC]
        local gFxcYuDG = lvUJhMOW[(lvUJhMOW[IBkfdzBC] + lvUJhMOW[pUKPTerT]) % 256]
        local unmasked = bit32.bxor(UYTUoCKW, CnLmUkkn)
        table.insert(gaTadNSv, string.char(bit32.bxor(unmasked, gFxcYuDG)))
    end
    return table.concat(gaTadNSv)
end

local lvUJhMOW_flat = {}
for _, chunk in ipairs(FFNUfBpm) do
    for _, byte in ipairs(chunk) do
        table.insert(lvUJhMOW_flat, byte)
    end
end

local decrypted = QMDQshDG(lvUJhMOW_flat, edGgyENV)
local yIOEOrNM, gdqAJKZg = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(lvUJhMOW_flat)
lvUJhMOW_flat = nil

if yIOEOrNM then 
    local result = yIOEOrNM() 
    decrypted = nil
    yIOEOrNM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(gdqAJKZg)) 
end
