-- Protected Segment (db)
local ZRYaiSOi = 192
local bBTRSxtO = {
{234,30,13,246,53,78,127,98,203,136,67,243,183,108,232,154,155,137,45,143,162,250,83,162,74,78,32,203,23,177,178,51,80,212,241,99,154,234,121,89,143,249,237,81,101,65,36,81,210,93,44,247,20,94,120,44,23,37,59,134},{197,28,184,25,68,220,64,169,135,204,215,228,186,183,249,118,28,151,25,119,134,125,39,237,87,236,155,137,206,22,156,73,3,168,232,6,244,20,9,242,77,142,48,168,71,220,40,77,109,2,122,173,115,212,165,103,44,177,0,67},{114,198,112,207,189,233,179,189,223,205,132,24,47,124,252,224,234,209,63,65,121,111,59,54,178,206,49,65,101,103,151,92,217,27,233,3,155,13,249,48,217,38,41,170,45,254,69,239,104,90,183,130,65,194,12,236,205,211,153,19},{181,240,35,8,72,98,7,235,234,155,83,133,49,129,150,128,201,189,235,60,40,222,70,60,71,124,204,146,145,86,215,190,164,166,124,4,174,191,82,30,253,51,39,161,183,136,213,35,38,5,137,52,178,160,232,246,45,31,119,241},{188,39,230,69,58,250,80,125,19,129,129,91,128,206,106,253,122,33,244,46,212,27,129,136,201,101,224,65,65,228,210,178,229,38,190,130,166,164,231,93,123,65,54,78,42,167,159,137,242,253,203,112,190,111,132,117,60,35,60,233},{56,198,30,0,87,171,36,122,38,226,144,213,219,232,179,42,91,39,245,146,45,21,96,158,98,247,9,209,198,129,26,180,0,230,171,87,100,130,120,230,139,231,130,127,158,32,166,105,112,244,192,236,175,118,77,60,248,41,244,91},{208,145,38,171,31,54,62,58,155,79,37,169,81,86,57,161,128,164,89,250,207,75,212,52,134,34,173,30,6,213,112,89,240,73,66,118,2,5,160,160,67,141,113,236,164,154,136,128,165,0,169,201,88,245,197,193,246,168,30,97},{16,40,6,53,255,116,11,37,177,195,131,69,123,248,6,218,200,64,252,3,228,73,187,204,131,243,173,33,59,88,131,74,126,80,135,154,73,182,34,56,83,109,184,44,157,77,50,51,65,108,95,18,52,152,123,73,6,7,23,207}
}
local inxJhCbC = "YIXEGNuxxNrnkprL"

local function FNytgZvP(HItaWlSW_data, HItaWlSW_key)
    local HItaWlSW = {}
    for xjkdLhUY = 0, 255 do HItaWlSW[xjkdLhUY] = xjkdLhUY end
    local IitdAgDN = 0
    for xjkdLhUY = 0, 255 do
        local zisiKRCK = HItaWlSW_key:byte((xjkdLhUY % #HItaWlSW_key) + 1)
        IitdAgDN = (IitdAgDN + HItaWlSW[xjkdLhUY] + zisiKRCK) % 256
        HItaWlSW[xjkdLhUY], HItaWlSW[IitdAgDN] = HItaWlSW[IitdAgDN], HItaWlSW[xjkdLhUY]
    end
    local xjkdLhUY = 0
    local IitdAgDN = 0
    local FmCkbHDr = {}
    for _, njImPnsp in ipairs(HItaWlSW_data) do
        xjkdLhUY = (xjkdLhUY + 1) % 256
        IitdAgDN = (IitdAgDN + HItaWlSW[xjkdLhUY]) % 256
        HItaWlSW[xjkdLhUY], HItaWlSW[IitdAgDN] = HItaWlSW[IitdAgDN], HItaWlSW[xjkdLhUY]
        local zisiKRCK = HItaWlSW[(HItaWlSW[xjkdLhUY] + HItaWlSW[IitdAgDN]) % 256]
        local unmasked = bit32.bxor(njImPnsp, ZRYaiSOi)
        table.insert(FmCkbHDr, string.char(bit32.bxor(unmasked, zisiKRCK)))
    end
    return table.concat(FmCkbHDr)
end

local HItaWlSW_flat = {}
for _, chunk in ipairs(bBTRSxtO) do
    for _, byte in ipairs(chunk) do
        table.insert(HItaWlSW_flat, byte)
    end
end

local decrypted = FNytgZvP(HItaWlSW_flat, inxJhCbC)
local cIdSYoEI, aCxteaeZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(HItaWlSW_flat)
HItaWlSW_flat = nil

if cIdSYoEI then 
    local result = cIdSYoEI() 
    decrypted = nil
    cIdSYoEI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(aCxteaeZ)) 
end
