-- Protected Segment (db)
local WWMuuSRn = 254
local bbOExgAF = {
{10,148,11,113,120,139,24,118,238,115,152,109,59,27,71,133,128,65,200,100,163,167,117,184,254,23,61,137,109,248,102,3,107,142,15,166,32,247,223,137,161,196,91,113,218,48,80,96,19,132,157,171,131,185,71,140,61,244,162,223},{64,207,10,20,115,29,80,125,1,153,20,106,172,223,12,167,195,215,167,170,223,36,185,31,184,236,198,98,1,237,241,91,81,116,246,44,35,243,8,83,129,247,63,143,253,58,51,240,230,150,180,252,199,26,222,102,145,36,251,205},{40,242,227,176,49,3,48,252,100,154,200,204,48,167,218,166,210,110,201,179,4,254,147,219,92,186,90,22,100,27,68,32,150,164,240,59,155,188,174,1,88,168,127,154,25,198,46,176,93,32,185,158,199,223,33,197,182,102,163,86},{176,183,108,119,103,15,231,228,35,87,111,177,82,228,194,83,200,52,19,72,142,17,244,194,57,38,17,231,63,164,1,14,221,14,171,169,252,42,90,48,5,148,82,118,159,255,30,91,135,194,105,164,164,18,212,111,61,194,165,23},{217,161,97,235,165,182,101,22,142,216,177,93,224,159,158,204,246,185,158,147,215,136,100,44,74,182,246,115,34,187,67,20,173,23,254,182,125,181,6,97,149,172,35,34,72,154,228,20,28,170,192,151,150,136,10,206,112,209,80,33},{231,43,239,219,197,214,18,98,179,50,189,195,73,180,3,194,150,21,166,72,128,110,174,245,202,54,236,234,145,224,183,143,24,152,195,96,54,72,140,232,59,93,4,74,242,137,55,196,177,181,18,177,69,185,252,22,103,215,27,16},{176,21,226,21,100,177,5,104,33,10,88,137,113,193,39,63,214,184,1,126,64,98,69,241,179,213,1,94,24,139,208,162,13,175,11,146,196,16,237,61,126,190,8,98,217,67,149,166,232,199,246,172,11,94,69,42,29,51,125,71},{158,106,122,252,70,86,174,155,169,149,18,243,89,166,54,199,77,155,15,59,255,152,77,74,133,34,62,119,46,35,157,32,106,31,193,143,10,163,251,207,115,70,153,92,206,69,233,207,162,89,194,155,189,225,252,201,230,74,145,103}
}
local fuLFeetn = "SlUdiVlqmoTtUKvV"

local function eXetJRam(nTeMkyOo_data, nTeMkyOo_key)
    local nTeMkyOo = {}
    for AljzDMUJ = 0, 255 do nTeMkyOo[AljzDMUJ] = AljzDMUJ end
    local uHVKyfwV = 0
    for AljzDMUJ = 0, 255 do
        local eRQmHnYc = nTeMkyOo_key:byte((AljzDMUJ % #nTeMkyOo_key) + 1)
        uHVKyfwV = (uHVKyfwV + nTeMkyOo[AljzDMUJ] + eRQmHnYc) % 256
        nTeMkyOo[AljzDMUJ], nTeMkyOo[uHVKyfwV] = nTeMkyOo[uHVKyfwV], nTeMkyOo[AljzDMUJ]
    end
    local AljzDMUJ = 0
    local uHVKyfwV = 0
    local QVtCpkpF = {}
    for _, XvyHkJaV in ipairs(nTeMkyOo_data) do
        AljzDMUJ = (AljzDMUJ + 1) % 256
        uHVKyfwV = (uHVKyfwV + nTeMkyOo[AljzDMUJ]) % 256
        nTeMkyOo[AljzDMUJ], nTeMkyOo[uHVKyfwV] = nTeMkyOo[uHVKyfwV], nTeMkyOo[AljzDMUJ]
        local eRQmHnYc = nTeMkyOo[(nTeMkyOo[AljzDMUJ] + nTeMkyOo[uHVKyfwV]) % 256]
        local unmasked = bit32.bxor(XvyHkJaV, WWMuuSRn)
        table.insert(QVtCpkpF, string.char(bit32.bxor(unmasked, eRQmHnYc)))
    end
    return table.concat(QVtCpkpF)
end

local nTeMkyOo_flat = {}
for _, chunk in ipairs(bbOExgAF) do
    for _, byte in ipairs(chunk) do
        table.insert(nTeMkyOo_flat, byte)
    end
end

local decrypted = eXetJRam(nTeMkyOo_flat, fuLFeetn)
local IlnNPIFW, jdXoHSGk = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(nTeMkyOo_flat)
nTeMkyOo_flat = nil

if IlnNPIFW then 
    local result = IlnNPIFW() 
    decrypted = nil
    IlnNPIFW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(jdXoHSGk)) 
end
