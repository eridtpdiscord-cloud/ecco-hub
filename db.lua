-- Protected Segment (db)
local xXlXcOLj = 35
local bVmCvEpu = {
{131,81,69,155,181,89,21,34,87,138,141,106,132,138,0,190,196,247,199,71,36,19,86,63,42,101,94,27,248,15,143,195,217,90,3,104,130,213,34,132,122,93,12,39,177,158,183,46,255,247,32,194,150,222,245,40,34,0,170,195},{30,7,95,68,59,208,55,17,108,200,39,203,179,141,18,224,2,24,238,43,90,180,153,153,104,119,207,150,53,133,155,30,140,119,91,154,233,202,97,91,245,241,179,154,251,105,235,9,75,202,192,117,187,0,209,208,86,228,137,140},{209,189,126,149,216,208,111,194,216,32,124,193,143,213,102,118,36,20,174,14,205,165,130,147,186,203,99,93,211,231,183,27,253,205,153,95,207,114,238,62,40,100,28,72,157,132,251,96,198,231,119,160,65,220,190,240,109,75,163,64},{24,153,5,142,90,174,93,44,99,231,221,214,57,16,38,227,74,55,192,56,110,126,188,227,163,209,119,238,240,237,169,146,98,91,252,156,226,77,107,155,166,53,1,65,69,43,176,110,65,161,233,81,25,167,16,88,167,201,202,221},{80,44,181,136,42,39,119,189,198,226,127,8,153,34,158,32,230,31,25,102,168,155,165,253,77,69,113,208,118,230,202,185,228,193,167,103,192,106,73,109,104,128,249,160,69,67,7,81,96,94,124,72,133,224,11,90,61,229,218,174},{181,184,38,12,216,158,116,28,191,40,203,110,200,217,206,174,209,114,223,199,74,164,180,239,110,229,242,142,156,9,10,45,171,114,62,140,83,215,52,67,75,86,197,246,165,26,126,148,146,134,229,147,57,173,178,41,220,1,140,108},{70,3,159,44,161,42,233,220,242,89,45,250,19,41,43,55,82,48,151,169,8,253,210,187,18,95,1,75,158,10,108,152,95,187,115,80,194,49,213,111,229,100,189,196,36,158,158,217,2,168,107,54,141,159,81,204,152,35,58,203},{3,160,190,238,72,2,60,35,199,99,113,206,40,109,65,190,194,234,2,85,41,241,198,115,70,158,197,179,247,53,248,103,142,185,178,248,248,91,11,206,61,218,195,188,236,80,195,58,87,123,35,5,185,21,202,167,246,119,205,37},{139,205,251,64,52}
}
local ftpEHAsI = "ERVgRgOJvloBswJv"

local function OaesnXnn(RfXHMrEZ_data, RfXHMrEZ_key)
    if type(RfXHMrEZ_key) ~= "string" or #RfXHMrEZ_key == 0 then return "" end
    local RfXHMrEZ = {}
    for csgFqJJa = 0, 255 do RfXHMrEZ[csgFqJJa] = csgFqJJa end
    local UyzJXXBn = 0
    for csgFqJJa = 0, 255 do
        local QuuLrpkx = RfXHMrEZ_key:byte((csgFqJJa % #RfXHMrEZ_key) + 1)
        UyzJXXBn = (UyzJXXBn + RfXHMrEZ[csgFqJJa] + QuuLrpkx) % 256
        RfXHMrEZ[csgFqJJa], RfXHMrEZ[UyzJXXBn] = RfXHMrEZ[UyzJXXBn], RfXHMrEZ[csgFqJJa]
    end
    local csgFqJJa = 0
    local UyzJXXBn = 0
    local RwmYSQdy = {}
    for _, HhjdaTrT in ipairs(RfXHMrEZ_data) do
        csgFqJJa = (csgFqJJa + 1) % 256
        UyzJXXBn = (UyzJXXBn + RfXHMrEZ[csgFqJJa]) % 256
        RfXHMrEZ[csgFqJJa], RfXHMrEZ[UyzJXXBn] = RfXHMrEZ[UyzJXXBn], RfXHMrEZ[csgFqJJa]
        local QuuLrpkx = RfXHMrEZ[(RfXHMrEZ[csgFqJJa] + RfXHMrEZ[UyzJXXBn]) % 256]
        local unmasked = bit32.bxor(HhjdaTrT, xXlXcOLj)
        table.insert(RwmYSQdy, string.char(bit32.bxor(unmasked, QuuLrpkx)))
    end
    return table.concat(RwmYSQdy)
end

local RfXHMrEZ_flat = {}
for _, chunk in ipairs(bVmCvEpu) do
    for _, byte in ipairs(chunk) do
        table.insert(RfXHMrEZ_flat, byte)
    end
end

local decrypted = OaesnXnn(RfXHMrEZ_flat, ftpEHAsI)
local jfVZtgZD, JkLWsohu = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(RfXHMrEZ_flat)
RfXHMrEZ_flat = nil

if jfVZtgZD then 
    local result = jfVZtgZD() 
    decrypted = nil
    jfVZtgZD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(JkLWsohu)) 
end
