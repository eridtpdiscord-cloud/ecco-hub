-- Protected Segment (anti_cheat_bypass)
local GZlEVomI = 217
local rVLfZgqG = {
{177,58,108,151,16,190,135,236,101,201,5,112,179,234,53,214,135,97,252,190,119,94,129,228,27,234,198,233,239,39,208,62,163,187,136,186,21,151,13,235,150,228,16,6,199,224,107,139,187,123,123,194,170,149,249,32,185,237,42,96},{77,110,108,57,64,244,137,103,181,160,239,213,184,49,150,136,63,28,228,52,243,229,74,129,232,145,28,73,106,100,199,228,32,2,195,40,143,123,194,250,123,40,62,96,135,16,177,24,182,32,118,230,111,25,199,224,88,48,90,14},{4,61,40,16,197,133,122,125,230,187,233,180,214,233,164,245,152,61,25,122,239,221,215,245,182,128,105,106,131}
}
local tTzNNZhm = "vjJVLITmGKzfaSzH"

local function hnPcEMya(TfzwTgoT_data, TfzwTgoT_key)
    local TfzwTgoT = {}
    for FAjXNFFO = 0, 255 do TfzwTgoT[FAjXNFFO] = FAjXNFFO end
    local MTmzdPjc = 0
    for FAjXNFFO = 0, 255 do
        local FfbZAeUq = TfzwTgoT_key:byte((FAjXNFFO % #TfzwTgoT_key) + 1)
        MTmzdPjc = (MTmzdPjc + TfzwTgoT[FAjXNFFO] + FfbZAeUq) % 256
        TfzwTgoT[FAjXNFFO], TfzwTgoT[MTmzdPjc] = TfzwTgoT[MTmzdPjc], TfzwTgoT[FAjXNFFO]
    end
    local FAjXNFFO = 0
    local MTmzdPjc = 0
    local IZivARoI = {}
    for _, CjptLUej in ipairs(TfzwTgoT_data) do
        FAjXNFFO = (FAjXNFFO + 1) % 256
        MTmzdPjc = (MTmzdPjc + TfzwTgoT[FAjXNFFO]) % 256
        TfzwTgoT[FAjXNFFO], TfzwTgoT[MTmzdPjc] = TfzwTgoT[MTmzdPjc], TfzwTgoT[FAjXNFFO]
        local FfbZAeUq = TfzwTgoT[(TfzwTgoT[FAjXNFFO] + TfzwTgoT[MTmzdPjc]) % 256]
        local unmasked = bit32.bxor(CjptLUej, GZlEVomI)
        table.insert(IZivARoI, string.char(bit32.bxor(unmasked, FfbZAeUq)))
    end
    return table.concat(IZivARoI)
end

local TfzwTgoT_flat = {}
for _, chunk in ipairs(rVLfZgqG) do
    for _, byte in ipairs(chunk) do
        table.insert(TfzwTgoT_flat, byte)
    end
end

local decrypted = hnPcEMya(TfzwTgoT_flat, tTzNNZhm)
local gvKKmaIi, GtlDTIiv = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(TfzwTgoT_flat)
TfzwTgoT_flat = nil

if gvKKmaIi then 
    local result = gvKKmaIi() 
    decrypted = nil
    gvKKmaIi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(GtlDTIiv)) 
end
