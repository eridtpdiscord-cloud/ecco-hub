-- Protected Segment (db)
local uxwQIEIs = 154
local ULsqZntd = {
{45,237,80,96,234,48,250,137,112,90,192,124,184,244,5,137,85,163,105,189,130,77,116,39,62,197,112,127,41,58,76,18,81,224,153,34,95,158,251,195,109,168,229,22,108,124,203,77,229,119,114,190,159,151,210,167,74,143,75,41},{63,47,77,135,156,23,46,115,91,46,119,60,235,116,206,22,6,56,185,156,37,129,50,64,197,186,32,37,183,114,61,152,44,102,248,111,185,45,15,146,171,50,242,25,108,111,191,48,94,20,76,99,206,150,54,132,91,156,234,153},{125,197,250,170,156,220,239,225,92,26,168,38,183,26,240,53,94,16,195,40,242,217,76,73,213,84,154,196,209,97,175,224,160,159,118,153,12,48,123,37,86,56,117,160,218,72,168,153,216,21,77,255,118,91,222,45,13,34,249,242},{183,106,133,211,121,246,211,49,131,252,77,86,150,98,121,208,240,80,7,236,109,226,15,140,25,12,47,100,212,229,139,177,67,72,98,75,182,202,163,225,103,44,170,228,246,8,251,178,215,50,3,100,141,227,28,86,127,193,78,28},{15,195,75,73,195,95,99,109,247,168,34,8,154,208,25,116,236,220,92,195,164,250,189,245,219,74,40,166,173,220,68,253,51,35,241,67,219,147,175,100,116,88,20,201,78,34,0,87,11,187,142,149,60,145,108,180,74,215,177,91},{226,66,195,90,109,252,4,227,67,189,83,53,17,97,28,240,140,122,61,232,233,84,178,32,120,4,207,130,71,106,125,102,45,85,107,3,148,64,96,103,12,252,58,130,97,9,96,68,118,159,149,168,154,184,140,89,153,58,205,139},{59,33,92,102,167,248,125,193,20,171,88,224,118,117,13,216,33,50,35,248,90,220,26,54,192,92,71,20,57,34,220,6,136,65,74,122,66,110,247,80,40,226,181,7,32,60,190,145,203,72,52,102,95,226,32,161,123,32,93,239},{98,228,32,208,47,18,91,208,1,129,64,92,45,158,141,28,182,117,1,69,208,167,253,53,51,1,106,139,150,195,171,42,39,165,63,142,51,191,78,145,144,180,212,16,119,236,76,14,53,30,225,171,133,36,167,204,209,121,211,239},{131,45,252,28,238}
}
local qOTjVaEr = "wlaQoUIdBLQDZMPv"

local function SYUnVUMb(utjheCOT_data, utjheCOT_key)
    if type(utjheCOT_key) ~= "string" or #utjheCOT_key == 0 then return "" end
    local utjheCOT = {}
    for WPzzRqxE = 0, 255 do utjheCOT[WPzzRqxE] = WPzzRqxE end
    local cZKIwOTu = 0
    for WPzzRqxE = 0, 255 do
        local gaSmjMxa = utjheCOT_key:byte((WPzzRqxE % #utjheCOT_key) + 1)
        cZKIwOTu = (cZKIwOTu + utjheCOT[WPzzRqxE] + gaSmjMxa) % 256
        utjheCOT[WPzzRqxE], utjheCOT[cZKIwOTu] = utjheCOT[cZKIwOTu], utjheCOT[WPzzRqxE]
    end
    local WPzzRqxE = 0
    local cZKIwOTu = 0
    local fSJyFRlE = {}
    for _, lduImOCf in ipairs(utjheCOT_data) do
        WPzzRqxE = (WPzzRqxE + 1) % 256
        cZKIwOTu = (cZKIwOTu + utjheCOT[WPzzRqxE]) % 256
        utjheCOT[WPzzRqxE], utjheCOT[cZKIwOTu] = utjheCOT[cZKIwOTu], utjheCOT[WPzzRqxE]
        local gaSmjMxa = utjheCOT[(utjheCOT[WPzzRqxE] + utjheCOT[cZKIwOTu]) % 256]
        local unmasked = bit32.bxor(lduImOCf, uxwQIEIs)
        table.insert(fSJyFRlE, string.char(bit32.bxor(unmasked, gaSmjMxa)))
    end
    return table.concat(fSJyFRlE)
end

local utjheCOT_flat = {}
for _, chunk in ipairs(ULsqZntd) do
    for _, byte in ipairs(chunk) do
        table.insert(utjheCOT_flat, byte)
    end
end

local decrypted = SYUnVUMb(utjheCOT_flat, qOTjVaEr)
local hsOXOiNH, fVnxHDkz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(utjheCOT_flat)
utjheCOT_flat = nil

if hsOXOiNH then 
    local result = hsOXOiNH() 
    decrypted = nil
    hsOXOiNH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(fVnxHDkz)) 
end
