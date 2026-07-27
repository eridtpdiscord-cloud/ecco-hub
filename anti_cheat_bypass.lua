-- Protected Segment (anti_cheat_bypass)
local gNaDUCAC = 101
local THDtNYUa = {
{85,123,23,203,243,20,230,231,202,50,146,1,188,187,66,100,180,211,180,166,205,216,155,47,13,46,211,23,110,123,233,93,171,144,150,117,164,220,122,243,15,127,39,120,147,62,179,145,40,165,139,88,106,94,128,199,79,15,37,111},{157,63,195,150,135,121,184,97,199,69,246,14,113,87,190,99,96,233,191,114,241,53,51,71,100,198,167,9,169,112,169,39,85,169,17,66,103,14,156,220,120,170,181,14,152,243,247,88,145,20,41,199,41,154,198,233,65,134,6,48},{25,87,11,161,243,109,151,74,102,232,187,193,27,183,170,196,170,140,148,165,91,101,51,84,169,249,71,255,158}
}
local GoMaXaIm = "vBYwcykpyHrZlFel"

local function xQeWFAZd(FaLZBGxX_data, FaLZBGxX_key)
    if type(FaLZBGxX_key) ~= "string" or #FaLZBGxX_key == 0 then return "" end
    local FaLZBGxX = {}
    for remerHqd = 0, 255 do FaLZBGxX[remerHqd] = remerHqd end
    local FFzyEYFT = 0
    for remerHqd = 0, 255 do
        local ihkJPvoH = FaLZBGxX_key:byte((remerHqd % #FaLZBGxX_key) + 1)
        FFzyEYFT = (FFzyEYFT + FaLZBGxX[remerHqd] + ihkJPvoH) % 256
        FaLZBGxX[remerHqd], FaLZBGxX[FFzyEYFT] = FaLZBGxX[FFzyEYFT], FaLZBGxX[remerHqd]
    end
    local remerHqd = 0
    local FFzyEYFT = 0
    local ejEkhgaC = {}
    for _, rtFsJPcu in ipairs(FaLZBGxX_data) do
        remerHqd = (remerHqd + 1) % 256
        FFzyEYFT = (FFzyEYFT + FaLZBGxX[remerHqd]) % 256
        FaLZBGxX[remerHqd], FaLZBGxX[FFzyEYFT] = FaLZBGxX[FFzyEYFT], FaLZBGxX[remerHqd]
        local ihkJPvoH = FaLZBGxX[(FaLZBGxX[remerHqd] + FaLZBGxX[FFzyEYFT]) % 256]
        local unmasked = bit32.bxor(rtFsJPcu, gNaDUCAC)
        table.insert(ejEkhgaC, string.char(bit32.bxor(unmasked, ihkJPvoH)))
    end
    return table.concat(ejEkhgaC)
end

local FaLZBGxX_flat = {}
for _, chunk in ipairs(THDtNYUa) do
    for _, byte in ipairs(chunk) do
        table.insert(FaLZBGxX_flat, byte)
    end
end

local decrypted = xQeWFAZd(FaLZBGxX_flat, GoMaXaIm)
local YWOWtOlI, mXgbOjod = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FaLZBGxX_flat)
FaLZBGxX_flat = nil

if YWOWtOlI then 
    local result = YWOWtOlI() 
    decrypted = nil
    YWOWtOlI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(mXgbOjod)) 
end
