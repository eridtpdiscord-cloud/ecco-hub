-- Protected Segment (teleport_handler)
local OwQbecIZ = 49
local DptTaVPe = {
{216,42,85,45,23,59,117,15,196,203,126,96,93,228,187,35,176,159,166,18,199,55,26,245,63,10,145,237,223,204,191,155,90,7,3,74,142,56,16,58,225,131,217,157,161,48,197,146,90,169,230,170,125,206,224,210,68,225,134,248},{185,206,154,70,245,100,102,195,14,114,28,125,254,147,62,103,90,244,184,74,118,64,119,61,239,67,163,57,211,71,207,53,157,223,201,90,80,154,187,111,215,43,121,101,189,123,240,244,10,87,132,85,130,179,61,163,122,97,74,94},{147,104,167,234,163,69,111,53,163,175,18,250,222,222,122,172,16,15,67,162,211,207,17,237,60,159,234,206}
}
local YClMmjrm = "beTgLpmatiKPCANo"

local function AKRDwNyA(EMwbtgdh_data, EMwbtgdh_key)
    if type(EMwbtgdh_key) ~= "string" or #EMwbtgdh_key == 0 then return "" end
    local EMwbtgdh = {}
    for zaVTvcqz = 0, 255 do EMwbtgdh[zaVTvcqz] = zaVTvcqz end
    local PqyLInuX = 0
    for zaVTvcqz = 0, 255 do
        local uFGlTWwi = EMwbtgdh_key:byte((zaVTvcqz % #EMwbtgdh_key) + 1)
        PqyLInuX = (PqyLInuX + EMwbtgdh[zaVTvcqz] + uFGlTWwi) % 256
        EMwbtgdh[zaVTvcqz], EMwbtgdh[PqyLInuX] = EMwbtgdh[PqyLInuX], EMwbtgdh[zaVTvcqz]
    end
    local zaVTvcqz = 0
    local PqyLInuX = 0
    local PPuMKDNh = {}
    for _, CEGmYEBT in ipairs(EMwbtgdh_data) do
        zaVTvcqz = (zaVTvcqz + 1) % 256
        PqyLInuX = (PqyLInuX + EMwbtgdh[zaVTvcqz]) % 256
        EMwbtgdh[zaVTvcqz], EMwbtgdh[PqyLInuX] = EMwbtgdh[PqyLInuX], EMwbtgdh[zaVTvcqz]
        local uFGlTWwi = EMwbtgdh[(EMwbtgdh[zaVTvcqz] + EMwbtgdh[PqyLInuX]) % 256]
        local unmasked = bit32.bxor(CEGmYEBT, OwQbecIZ)
        table.insert(PPuMKDNh, string.char(bit32.bxor(unmasked, uFGlTWwi)))
    end
    return table.concat(PPuMKDNh)
end

local EMwbtgdh_flat = {}
for _, chunk in ipairs(DptTaVPe) do
    for _, byte in ipairs(chunk) do
        table.insert(EMwbtgdh_flat, byte)
    end
end

local decrypted = AKRDwNyA(EMwbtgdh_flat, YClMmjrm)
local TBxLoqUh, xvrgDrqH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EMwbtgdh_flat)
EMwbtgdh_flat = nil

if TBxLoqUh then 
    local result = TBxLoqUh() 
    decrypted = nil
    TBxLoqUh = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(xvrgDrqH)) 
end
