-- Protected Segment (db)
local SRqWzthW = 66
local UZVsDsEU = {
{34,176,6,229,106,6,227,88,98,205,119,184,236,175,199,3,120,53,2,194,239,48,88,103,11,55,229,211,225,171,214,139,233,93,255,55,13,153,58,238,138,166,103,188,65,232,144,108,218,158,204,157,130,46,220,75,12,82,39,87},{198,240,249,205,138,93,183,244,118,35,181,83,206,203,60,74,162,71,152,59,202,35,206,212,179,251,240,149,238,191,88,142,211,254,190,134,142,32,202,57,217,120,107,139,252,143,107,55,244,73,89,38,47,254,194,32,137,100,84,181},{238,86,100,238,221,168,69,24,56,49,101,157,185,148,28,181,223,107,163,62,48,23,101,57,164,119,92,145,174,227,228,165,11,149,248,127,174,3,148,0,179,14,146,71,193,30,32,35,160,210,92,39,254,73,193,9,8,62,248,48},{115,232,237,172,135,43,187,170,8,161,33,89,178,217,55,212,33,39,115,106,85,48,233,207,231,99,193,59,153,185,78,133,245,179,3,248,132,125,115,36,34,52,108,81,68,203,253,0,50,60,60,78,142,173,230,10,62,63,172,95},{57,8,30,198,98,80,119,121,238,79,238,55,154,225,199,131,45,28,237,189,247,93,43,28,220,232,235,189,57,145,28,202,103,157,236,248,37,154,139,205,223,134,112,41,13,178,192,67,169,209,205,36,168,249,135,181,250,192,243,10},{240,124,198,233,172,8,66,243,107,17,13,72,129,90,88,130,94,209,204,174,154,17,156,98,91,82,115,36,213,249,22,164,136,243,34,82,0,187,174,84,147,138,203,86,165,44,151,40,205,73,157,90,13,218,116,81,233,200,230,65},{164,191,233,71,54,246,251,199,112,114,7,79,109,131,159,17,69,152,81,186,156,39,226,54,66,49,1,115,79,154,107,90,246,146,76,57,135,188,211,149,197,0,78,220,117,4,51,132,194,155,72,153,21,123,152,90,36,117,234,174},{14,1,127,155,116,145,55,245,26,226,158,101,147,50,76,4,110,12,250,238,26,72,249,142,40,242,151,168,67,99,175,73,155,129,88,56,161,35,225,179,175,44,193,30,190,246,4,216,103,124,254,4,92,207,106,123,47,68,138,206},{92,121,191,128,172}
}
local fOXbgGyq = "JIqdhFRgqQXMtExu"

local function WuCtRAuD(bKrYyTdb_data, bKrYyTdb_key)
    if type(bKrYyTdb_key) ~= "string" or #bKrYyTdb_key == 0 then return "" end
    local bKrYyTdb = {}
    for MSvHMqfx = 0, 255 do bKrYyTdb[MSvHMqfx] = MSvHMqfx end
    local yxItfxMF = 0
    for MSvHMqfx = 0, 255 do
        local dMBaABVo = bKrYyTdb_key:byte((MSvHMqfx % #bKrYyTdb_key) + 1)
        yxItfxMF = (yxItfxMF + bKrYyTdb[MSvHMqfx] + dMBaABVo) % 256
        bKrYyTdb[MSvHMqfx], bKrYyTdb[yxItfxMF] = bKrYyTdb[yxItfxMF], bKrYyTdb[MSvHMqfx]
    end
    local MSvHMqfx = 0
    local yxItfxMF = 0
    local mfxClFog = {}
    for _, LivJeYDI in ipairs(bKrYyTdb_data) do
        MSvHMqfx = (MSvHMqfx + 1) % 256
        yxItfxMF = (yxItfxMF + bKrYyTdb[MSvHMqfx]) % 256
        bKrYyTdb[MSvHMqfx], bKrYyTdb[yxItfxMF] = bKrYyTdb[yxItfxMF], bKrYyTdb[MSvHMqfx]
        local dMBaABVo = bKrYyTdb[(bKrYyTdb[MSvHMqfx] + bKrYyTdb[yxItfxMF]) % 256]
        local unmasked = bit32.bxor(LivJeYDI, SRqWzthW)
        table.insert(mfxClFog, string.char(bit32.bxor(unmasked, dMBaABVo)))
    end
    return table.concat(mfxClFog)
end

local bKrYyTdb_flat = {}
for _, chunk in ipairs(UZVsDsEU) do
    for _, byte in ipairs(chunk) do
        table.insert(bKrYyTdb_flat, byte)
    end
end

local decrypted = WuCtRAuD(bKrYyTdb_flat, fOXbgGyq)
local LTQqRiRb, zecjSsrQ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bKrYyTdb_flat)
bKrYyTdb_flat = nil

if LTQqRiRb then 
    local result = LTQqRiRb() 
    decrypted = nil
    LTQqRiRb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(zecjSsrQ)) 
end
