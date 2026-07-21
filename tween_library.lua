-- Compiled secure segment
local fnWUATgO = {
{48,255,211,242,189,169,117,7,111,161,172,145,51,29,5,219,209,238,192,37,183,6,231,163,235,162,223,103,29,36,126,154,35,169,11,37,242,99,43,34,165,31,141,228,103,178,213,165,71,105,172,60,174,21,230,22,193,217,247,247},{114,72,36,106,159,224,249,218,5,30,68,126,65,40,87,22,156,94,229,43,71,153,114,97,57,238,81,222,134,19,226,23,183,119,139,87,53,44,97,130,245,62,45,72,124,114,253,228,140,18,72,250,246,111,230,67,191,126,90,30},{232,57,2,251,37,221,186,11,65,111,189,192,64,17,4,59,213,122,182,142,106,187,235,10,125}
}
local ogQcoouY = "qopUwVTJqWMoJLOZ"

local function jEpveMCl(aPOHpDPY_data, aPOHpDPY_key)
    local aPOHpDPY = {}
    for keCtmgdY = 0, 255 do aPOHpDPY[keCtmgdY] = keCtmgdY end
    local vemeoNrT = 0
    for keCtmgdY = 0, 255 do
        local ghVQNCLs = aPOHpDPY_key:byte((keCtmgdY % #aPOHpDPY_key) + 1)
        vemeoNrT = (vemeoNrT + aPOHpDPY[keCtmgdY] + ghVQNCLs) % 256
        aPOHpDPY[keCtmgdY], aPOHpDPY[vemeoNrT] = aPOHpDPY[vemeoNrT], aPOHpDPY[keCtmgdY]
    end
    local keCtmgdY = 0
    local vemeoNrT = 0
    local kmKqiudM = {}
    for _, EvCKVvEQ in ipairs(aPOHpDPY_data) do
        keCtmgdY = (keCtmgdY + 1) % 256
        vemeoNrT = (vemeoNrT + aPOHpDPY[keCtmgdY]) % 256
        aPOHpDPY[keCtmgdY], aPOHpDPY[vemeoNrT] = aPOHpDPY[vemeoNrT], aPOHpDPY[keCtmgdY]
        local ghVQNCLs = aPOHpDPY[(aPOHpDPY[keCtmgdY] + aPOHpDPY[vemeoNrT]) % 256]
        table.insert(kmKqiudM, string.char(bit32.bxor(EvCKVvEQ, ghVQNCLs)))
    end
    return table.concat(kmKqiudM)
end

local aPOHpDPY_flat = {}
for _, chunk in ipairs(fnWUATgO) do
    for _, byte in ipairs(chunk) do
        table.insert(aPOHpDPY_flat, byte)
    end
end

local decrypted = jEpveMCl(aPOHpDPY_flat, ogQcoouY)
local TnkGSYxE, FnoTuTex = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(aPOHpDPY_flat)
aPOHpDPY_flat = nil

if TnkGSYxE then 
    local result = TnkGSYxE() 
    decrypted = nil
    TnkGSYxE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(FnoTuTex)) 
end
