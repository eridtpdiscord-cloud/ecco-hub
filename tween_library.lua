-- Protected Segment (tween_library)
local DZSLNpyq = 218
local QZTpMSSF = {
{139,212,4,247,228,99,187,2,214,216,215,231,155,201,132,88,215,225,52,231,74,201,230,70,65,119,250,46,63,155,191,88,12,49,86,254,192,35,202,93,245,134,98,58,7,6,192,201,91,10,26,223,64,42,204,128,129,107,124,181},{195,233,81,243,9,37,162,197,239,221,53,251,200,191,166,68,57,218,130,155,161,139,194,82,58,99,176,9,13,112,190,207,152,84,142,251,114,233,73,113,224,49,50,120,140,108,9,114,192,68,249,122,51,212,79,75,218,239,151,138},{114,3,244,54,51,69,247,187,146,135,193,109,46,156,194,173,71,186,191,212,146,97,128,77,28}
}
local ESRNYKqi = "xBNTlYxsfFSqRLxB"

local function jCZHnsxd(bSRozOSe_data, bSRozOSe_key)
    if type(bSRozOSe_key) ~= "string" or #bSRozOSe_key == 0 then return "" end
    local bSRozOSe = {}
    for VflGImpC = 0, 255 do bSRozOSe[VflGImpC] = VflGImpC end
    local ykEYwjlY = 0
    for VflGImpC = 0, 255 do
        local GLHYKlsh = bSRozOSe_key:byte((VflGImpC % #bSRozOSe_key) + 1)
        ykEYwjlY = (ykEYwjlY + bSRozOSe[VflGImpC] + GLHYKlsh) % 256
        bSRozOSe[VflGImpC], bSRozOSe[ykEYwjlY] = bSRozOSe[ykEYwjlY], bSRozOSe[VflGImpC]
    end
    local VflGImpC = 0
    local ykEYwjlY = 0
    local ZqlktBTb = {}
    for _, xoXoUZTK in ipairs(bSRozOSe_data) do
        VflGImpC = (VflGImpC + 1) % 256
        ykEYwjlY = (ykEYwjlY + bSRozOSe[VflGImpC]) % 256
        bSRozOSe[VflGImpC], bSRozOSe[ykEYwjlY] = bSRozOSe[ykEYwjlY], bSRozOSe[VflGImpC]
        local GLHYKlsh = bSRozOSe[(bSRozOSe[VflGImpC] + bSRozOSe[ykEYwjlY]) % 256]
        local unmasked = bit32.bxor(xoXoUZTK, DZSLNpyq)
        table.insert(ZqlktBTb, string.char(bit32.bxor(unmasked, GLHYKlsh)))
    end
    return table.concat(ZqlktBTb)
end

local bSRozOSe_flat = {}
for _, chunk in ipairs(QZTpMSSF) do
    for _, byte in ipairs(chunk) do
        table.insert(bSRozOSe_flat, byte)
    end
end

local decrypted = jCZHnsxd(bSRozOSe_flat, ESRNYKqi)
local gtglkkvq, jvZictFY = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bSRozOSe_flat)
bSRozOSe_flat = nil

if gtglkkvq then 
    local result = gtglkkvq() 
    decrypted = nil
    gtglkkvq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(jvZictFY)) 
end
