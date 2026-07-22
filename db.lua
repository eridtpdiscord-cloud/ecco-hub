-- Protected Segment (db)
local CPMRSjaa = 79
local HLjfqkZW = {
{132,148,48,64,255,8,94,173,65,179,7,86,3,219,187,152,113,105,247,240,174,137,23,152,223,222,114,125,172,196,158,91,199,190,105,104,116,2,147,45,126,92,61,255,96,198,119,217,174,247,140,188,82,213,138,31,128,169,43,69},{15,181,34,103,121,127,88,215,128,51,130,91,200,56,85,118,65,210,250,146,92,174,249,220,212,39,242,252,135,214,93,124,191,126,173,171,131,129,255,205,27,182,88,203,113,91,127,128,162,3,108,141,216,39,33,106,225,193,102,198},{32,221,10,137,68,176,115,160,116,150,218,52,0,158,63,124,14,45,121,31,171,94,6,171,94,226,134,101,118,83,66,184,31,194,19,225,126,219,159,4,120,217,248,184,246,129,225,123,31,234,136,128,71,67,100,22,8,158,151,34},{48,211,12,78,169,196,45,13,59,167,15,141,150,50,8,34,208,145,231,150,69,159,2,67,184,86,15,60,244,220,254,193,108,133,185,251,183,12,28,244,82,175,189,187,149,198,144,21,225,179,69,242,201,182,14,5,120,94,217,64},{213,223,89,136,169,99,68,24,25,139,197,199,196,38,44,37,162,122,249,244,158,172,153,113,45,227,95,133,188,46,188,216,123,202,253,105,159,71,238,90,138,183,107,165,192,147,45,76,105,216,14,59,34,78,159,113,237,81,232,108},{109,69,198,204,40,215,61,202,194,254,238,169,116,3,167,169,21,148,244,66,134,238,27,44,241,111,48,246,26,0,171,39,211,145,201,29,216,227,24,246,119,208,112,237,193,150,16,172,33,171,184,242,113,252,16,99,88,20,151,172},{118,241,45,29,103,251,199,182,134,74,34,115,213,238,205,252,232,33,214,155,213,173,111,49,218,228,12,169,189,229,153,78,50,170,33,0,171,139,11,141,167,92,220,63,217}
}
local gwIdLAPO = "uCcBpjwBqSizVxdS"

local function ZYAgWxgK(qqTUQlju_data, qqTUQlju_key)
    local qqTUQlju = {}
    for wERXmdcR = 0, 255 do qqTUQlju[wERXmdcR] = wERXmdcR end
    local jiGnRogl = 0
    for wERXmdcR = 0, 255 do
        local HRXLgzoQ = qqTUQlju_key:byte((wERXmdcR % #qqTUQlju_key) + 1)
        jiGnRogl = (jiGnRogl + qqTUQlju[wERXmdcR] + HRXLgzoQ) % 256
        qqTUQlju[wERXmdcR], qqTUQlju[jiGnRogl] = qqTUQlju[jiGnRogl], qqTUQlju[wERXmdcR]
    end
    local wERXmdcR = 0
    local jiGnRogl = 0
    local ujTgojsi = {}
    for _, BFPDbcJB in ipairs(qqTUQlju_data) do
        wERXmdcR = (wERXmdcR + 1) % 256
        jiGnRogl = (jiGnRogl + qqTUQlju[wERXmdcR]) % 256
        qqTUQlju[wERXmdcR], qqTUQlju[jiGnRogl] = qqTUQlju[jiGnRogl], qqTUQlju[wERXmdcR]
        local HRXLgzoQ = qqTUQlju[(qqTUQlju[wERXmdcR] + qqTUQlju[jiGnRogl]) % 256]
        local unmasked = bit32.bxor(BFPDbcJB, CPMRSjaa)
        table.insert(ujTgojsi, string.char(bit32.bxor(unmasked, HRXLgzoQ)))
    end
    return table.concat(ujTgojsi)
end

local qqTUQlju_flat = {}
for _, chunk in ipairs(HLjfqkZW) do
    for _, byte in ipairs(chunk) do
        table.insert(qqTUQlju_flat, byte)
    end
end

local decrypted = ZYAgWxgK(qqTUQlju_flat, gwIdLAPO)
local wRIvRCQh, TyWJDtwH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(qqTUQlju_flat)
qqTUQlju_flat = nil

if wRIvRCQh then 
    local result = wRIvRCQh() 
    decrypted = nil
    wRIvRCQh = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(TyWJDtwH)) 
end
