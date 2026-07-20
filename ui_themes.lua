-- Compiled secure segment
local rpSspzYX = {
{141,224,119,247,26,61,242,188,249,137,179,94,59,0,62,162,41,5,31,16,85,141,32,47,79,3,216,150,232,13,209,90,67,171,46,25,127,220,188,150,205,48,232,159,229,45,217,219,119,198,211,212,250,42,80,61,176,242,178,133},{60,27,244,40,60,254,232,231,144,157,59,66,241,70,13,21,247,147,195,109,117,245,140,181,220,239,25,165,239,160,239,61,233,164,32,87,242,37,70,96,22,234,148,26,86,239,35,215,85,250,207,8,153,3,212,129,65,21,255,86},{151,100,112,188,248,159,125,47,37,216,66,112,99,17,124,154,155,237,218,110,164}
}
local SoSgQFMB = "SHCkPgDExAnGEFAt"

local function dPltrmpU(wnGBasrL_data, wnGBasrL_key)
    local wnGBasrL = {}
    for oUHmnjKi = 0, 255 do wnGBasrL[oUHmnjKi] = oUHmnjKi end
    local wyHiVbqS = 0
    for oUHmnjKi = 0, 255 do
        local RRpuceqM = wnGBasrL_key:byte((oUHmnjKi % #wnGBasrL_key) + 1)
        wyHiVbqS = (wyHiVbqS + wnGBasrL[oUHmnjKi] + RRpuceqM) % 256
        wnGBasrL[oUHmnjKi], wnGBasrL[wyHiVbqS] = wnGBasrL[wyHiVbqS], wnGBasrL[oUHmnjKi]
    end
    local oUHmnjKi = 0
    local wyHiVbqS = 0
    local NcPZEUBz = {}
    for _, xhGbABuE in ipairs(wnGBasrL_data) do
        oUHmnjKi = (oUHmnjKi + 1) % 256
        wyHiVbqS = (wyHiVbqS + wnGBasrL[oUHmnjKi]) % 256
        wnGBasrL[oUHmnjKi], wnGBasrL[wyHiVbqS] = wnGBasrL[wyHiVbqS], wnGBasrL[oUHmnjKi]
        local RRpuceqM = wnGBasrL[(wnGBasrL[oUHmnjKi] + wnGBasrL[wyHiVbqS]) % 256]
        table.insert(NcPZEUBz, string.char(bit32.bxor(xhGbABuE, RRpuceqM)))
    end
    return table.concat(NcPZEUBz)
end

local wnGBasrL_flat = {}
for _, chunk in ipairs(rpSspzYX) do
    for _, byte in ipairs(chunk) do
        table.insert(wnGBasrL_flat, byte)
    end
end

local decrypted = dPltrmpU(wnGBasrL_flat, SoSgQFMB)
local PPjqyBql, XjslYYHZ = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(wnGBasrL_flat)
wnGBasrL_flat = nil

if PPjqyBql then 
    local result = PPjqyBql() 
    decrypted = nil
    PPjqyBql = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(XjslYYHZ)) 
end
