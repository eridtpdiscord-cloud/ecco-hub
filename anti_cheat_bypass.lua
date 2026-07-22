-- Protected Segment (anti_cheat_bypass)
local VqtjHDto = 69
local hIMxpgCw = {
{56,255,174,46,33,156,158,187,110,108,175,200,54,107,101,49,161,144,53,58,73,0,90,122,239,63,162,32,77,233,205,128,124,198,158,136,147,25,227,198,30,189,178,255,33,80,72,115,234,183,42,196,161,206,28,82,223,217,239,252},{66,208,44,210,183,21,230,165,157,242,15,35,182,149,125,138,115,191,43,72,92,154,132,112,172,99,175,160,105,213,146,43,179,36,11,159,93,72,93,90,14,225,156,124,189,151,244,28,159,196,220,144,157,110,1,70,10,10,206,233},{24,123,203,25,228,92,212,181,135,188,100,63,228,57,95,184,232,24,145,128,4,201,175,84,108,32,206,168,218}
}
local jhkvTOKK = "aINIemCFhDQLFefF"

local function UeYIwQbE(urCDFGIQ_data, urCDFGIQ_key)
    local urCDFGIQ = {}
    for nmepZVTJ = 0, 255 do urCDFGIQ[nmepZVTJ] = nmepZVTJ end
    local zMhPiMtH = 0
    for nmepZVTJ = 0, 255 do
        local NAyFskTA = urCDFGIQ_key:byte((nmepZVTJ % #urCDFGIQ_key) + 1)
        zMhPiMtH = (zMhPiMtH + urCDFGIQ[nmepZVTJ] + NAyFskTA) % 256
        urCDFGIQ[nmepZVTJ], urCDFGIQ[zMhPiMtH] = urCDFGIQ[zMhPiMtH], urCDFGIQ[nmepZVTJ]
    end
    local nmepZVTJ = 0
    local zMhPiMtH = 0
    local DfiSqhIg = {}
    for _, WigBIbzM in ipairs(urCDFGIQ_data) do
        nmepZVTJ = (nmepZVTJ + 1) % 256
        zMhPiMtH = (zMhPiMtH + urCDFGIQ[nmepZVTJ]) % 256
        urCDFGIQ[nmepZVTJ], urCDFGIQ[zMhPiMtH] = urCDFGIQ[zMhPiMtH], urCDFGIQ[nmepZVTJ]
        local NAyFskTA = urCDFGIQ[(urCDFGIQ[nmepZVTJ] + urCDFGIQ[zMhPiMtH]) % 256]
        local unmasked = bit32.bxor(WigBIbzM, VqtjHDto)
        table.insert(DfiSqhIg, string.char(bit32.bxor(unmasked, NAyFskTA)))
    end
    return table.concat(DfiSqhIg)
end

local urCDFGIQ_flat = {}
for _, chunk in ipairs(hIMxpgCw) do
    for _, byte in ipairs(chunk) do
        table.insert(urCDFGIQ_flat, byte)
    end
end

local decrypted = UeYIwQbE(urCDFGIQ_flat, jhkvTOKK)
local gcuTyLxj, AVeGbXUL = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(urCDFGIQ_flat)
urCDFGIQ_flat = nil

if gcuTyLxj then 
    local result = gcuTyLxj() 
    decrypted = nil
    gcuTyLxj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(AVeGbXUL)) 
end
