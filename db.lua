-- Protected Segment (db)
local tSINnlsN = 147
local uIBRenVl = {
{194,46,255,158,120,34,235,90,120,14,76,238,195,154,245,113,178,210,119,199,73,15,12,130,107,33,103,241,161,120,101,204,51,196,130,186,203,1,239,90,105,69,140,190,96,201,27,216,12,87,119,92,68,59,215,84,215,46,205,91},{135,141,179,141,36,86,91,222,146,110,55,145,234,245,73,108,60,138,151,8,208,1,133,178,230,178,171,82,91,26,130,105,32,125,206,196,189,93,146,41,64,167,78,14,168,125,108,121,14,208,200,158,104,225,102,189,138,109,62,249},{144,253,65,202,99,43,105,105,116,91,162,82,18,52,202,90,99,101,202,42,188,2,68,39,93,118,81,212,198,45,219,255,83,135,174,153,54,113,95,90,218,51,64,222,181,106,192,55,58,149,233,46,149,77,11,222,179,228,103,112},{22,128,1,122,51,180,160,169,35,178,163,118,26,190,238,2,61,113,107,167,195,189,221,179,177,182,208,13,132,102,69,53,129,45,169,238,150,174,143,101,23,142,171,63,110,87,9,185,158,89,62,92,85,134,224,96,234,165,71,118},{122,36,214,5,184,15,174,183,182,116,249,126,217,237,78,199,120,100,12,164,146,67,176,134,101,61,244,71,82,181,234,24,91,223,71,174,66,8,108,72,152,239,20,89,9,85,104,110,106,48,137,223,129,190,139,100,162,65,233,201},{234,91,31,43,224,255,214,178,224,6,185,162,29,132,92,171,212,25,4,205,59,147,201,97,41,169,76,145,39,12,135,106,237,209,211,8,207,8,137,166,2,213,140,130,213,165,17,101,40,29,175,189,49,19,137,166,197,226,143,104},{15,120,150,194,158,104,82,247,41,235,35,47,77,245,179,147,95,101,228,10,19,28,11,90,41,48,165,112,232,234,168,30,19,137,108,193,168,88,172,118,62,146,73,41,77,15,34,155,115,154,224,38,8,187,196,254,151,82,137,7},{87,217,124,181,37,233,205,51,80,106,239,86,164,165,147,2,123,239,107,100,111,151,87,212,32,122,130,6,62,2,43,17,94,203,251,163,93,170,253,169,56,55,2,142,142,29,167,108,84,35,53,154,48,144,95,30,47,246,10}
}
local OqUZemAc = "wFpMmaANoVpqSmST"

local function zQUajBCz(EtkIToEl_data, EtkIToEl_key)
    if type(EtkIToEl_key) ~= "string" or #EtkIToEl_key == 0 then return "" end
    local EtkIToEl = {}
    for wPUkwjbU = 0, 255 do EtkIToEl[wPUkwjbU] = wPUkwjbU end
    local IazzMXMZ = 0
    for wPUkwjbU = 0, 255 do
        local GeAAeIbq = EtkIToEl_key:byte((wPUkwjbU % #EtkIToEl_key) + 1)
        IazzMXMZ = (IazzMXMZ + EtkIToEl[wPUkwjbU] + GeAAeIbq) % 256
        EtkIToEl[wPUkwjbU], EtkIToEl[IazzMXMZ] = EtkIToEl[IazzMXMZ], EtkIToEl[wPUkwjbU]
    end
    local wPUkwjbU = 0
    local IazzMXMZ = 0
    local zVfqUrjh = {}
    for _, MIYUaItT in ipairs(EtkIToEl_data) do
        wPUkwjbU = (wPUkwjbU + 1) % 256
        IazzMXMZ = (IazzMXMZ + EtkIToEl[wPUkwjbU]) % 256
        EtkIToEl[wPUkwjbU], EtkIToEl[IazzMXMZ] = EtkIToEl[IazzMXMZ], EtkIToEl[wPUkwjbU]
        local GeAAeIbq = EtkIToEl[(EtkIToEl[wPUkwjbU] + EtkIToEl[IazzMXMZ]) % 256]
        local unmasked = bit32.bxor(MIYUaItT, tSINnlsN)
        table.insert(zVfqUrjh, string.char(bit32.bxor(unmasked, GeAAeIbq)))
    end
    return table.concat(zVfqUrjh)
end

local EtkIToEl_flat = {}
for _, chunk in ipairs(uIBRenVl) do
    for _, byte in ipairs(chunk) do
        table.insert(EtkIToEl_flat, byte)
    end
end

local decrypted = zQUajBCz(EtkIToEl_flat, OqUZemAc)
local XjEUpNab, HnsJJxPW = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EtkIToEl_flat)
EtkIToEl_flat = nil

if XjEUpNab then 
    local result = XjEUpNab() 
    decrypted = nil
    XjEUpNab = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(HnsJJxPW)) 
end
