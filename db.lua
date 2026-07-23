-- Protected Segment (db)
local wtPcoKYX = 110
local rCmYDITU = {
{119,105,16,84,33,146,18,128,103,146,8,131,137,249,111,210,113,242,255,208,8,6,167,129,187,27,7,15,251,21,90,239,188,68,156,186,64,126,58,58,146,227,91,22,4,46,41,194,230,32,107,69,197,35,37,120,8,86,139,173},{42,42,244,109,155,180,130,113,130,3,247,243,63,23,195,131,241,37,25,179,204,45,51,187,205,111,238,118,28,169,42,186,221,134,49,19,227,118,96,18,169,248,111,247,234,239,146,214,5,29,119,68,60,234,87,108,122,15,162,132},{233,156,86,134,77,219,41,219,78,86,173,150,11,151,48,57,156,25,132,115,155,198,222,5,40,179,132,50,253,253,44,223,252,74,203,236,145,244,4,157,73,17,250,186,6,229,39,247,172,193,224,42,95,0,72,88,88,67,16,8},{144,254,237,71,209,230,216,150,13,155,194,8,80,24,91,213,29,252,12,229,176,63,222,161,249,69,77,33,183,103,115,89,196,58,0,99,140,138,212,143,252,40,225,105,225,201,28,207,186,182,91,114,7,219,6,230,128,144,233,163},{3,213,26,40,11,45,42,135,32,44,158,196,111,39,33,191,65,10,44,3,228,245,42,203,29,212,2,215,205,104,38,250,78,241,141,211,27,187,163,113,131,9,62,173,108,227,200,39,253,75,190,178,20,12,129,71,116,152,81,98},{229,223,225,24,116,72,182,193,124,195,132,74,86,114,79,157,115,224,133,111,194,53,151,249,67,67,182,66,199,129,206,133,54,167,225,228,26,115,189,101,105,216,64,93,191,59,180,186,7,0,177,94,138,186,160,187,28,238,93,186},{169,121,90,146,211,72,187,192,49,149,61,142,242,185,222,90,157,68,185,23,199,86,30,210,171,163,126,127,197,237,64,247,120,69,243,63,219,119,104,136,221,188,175,39,199,247,164,52,182,12,95,169,128,61,234,206,66,172,3,13},{105,31,182,241,42,71,203,195,35,189,69,149,72,17,71,192,249,124,65,252,220,186,135,12,27,0,7,72,107,18,224,113,7,195,229,18,244,73,126,173,140,110,173,87,240,214,57,93,191,34,124,75,210,188,56,253,207,74,60}
}
local qNrrXSHD = "jEORHeISQSxiufLu"

local function XkGJAfiO(pkdBUoqN_data, pkdBUoqN_key)
    if type(pkdBUoqN_key) ~= "string" or #pkdBUoqN_key == 0 then return "" end
    local pkdBUoqN = {}
    for NzaESTWF = 0, 255 do pkdBUoqN[NzaESTWF] = NzaESTWF end
    local HjwqcAcO = 0
    for NzaESTWF = 0, 255 do
        local MMHuQuAg = pkdBUoqN_key:byte((NzaESTWF % #pkdBUoqN_key) + 1)
        HjwqcAcO = (HjwqcAcO + pkdBUoqN[NzaESTWF] + MMHuQuAg) % 256
        pkdBUoqN[NzaESTWF], pkdBUoqN[HjwqcAcO] = pkdBUoqN[HjwqcAcO], pkdBUoqN[NzaESTWF]
    end
    local NzaESTWF = 0
    local HjwqcAcO = 0
    local hmHFlWDk = {}
    for _, eXQgRmUL in ipairs(pkdBUoqN_data) do
        NzaESTWF = (NzaESTWF + 1) % 256
        HjwqcAcO = (HjwqcAcO + pkdBUoqN[NzaESTWF]) % 256
        pkdBUoqN[NzaESTWF], pkdBUoqN[HjwqcAcO] = pkdBUoqN[HjwqcAcO], pkdBUoqN[NzaESTWF]
        local MMHuQuAg = pkdBUoqN[(pkdBUoqN[NzaESTWF] + pkdBUoqN[HjwqcAcO]) % 256]
        local unmasked = bit32.bxor(eXQgRmUL, wtPcoKYX)
        table.insert(hmHFlWDk, string.char(bit32.bxor(unmasked, MMHuQuAg)))
    end
    return table.concat(hmHFlWDk)
end

local pkdBUoqN_flat = {}
for _, chunk in ipairs(rCmYDITU) do
    for _, byte in ipairs(chunk) do
        table.insert(pkdBUoqN_flat, byte)
    end
end

local decrypted = XkGJAfiO(pkdBUoqN_flat, qNrrXSHD)
local omkctDoR, cXqwieIE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pkdBUoqN_flat)
pkdBUoqN_flat = nil

if omkctDoR then 
    local result = omkctDoR() 
    decrypted = nil
    omkctDoR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(cXqwieIE)) 
end
