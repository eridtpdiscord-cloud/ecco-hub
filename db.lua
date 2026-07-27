-- Protected Segment (db)
local bmGrotio = 117
local wcKsbbDh = {
{147,81,3,66,25,37,31,76,113,90,80,170,232,219,188,82,193,39,183,242,66,189,249,91,52,241,68,23,111,143,23,78,51,111,127,104,74,117,95,185,47,159,74,210,217,44,254,222,128,17,114,188,214,221,46,44,150,65,249,122},{123,164,100,175,104,131,160,196,199,236,85,141,39,195,217,66,67,168,222,65,168,138,217,201,23,124,230,89,194,129,76,144,150,182,12,119,76,58,95,198,3,143,18,32,130,13,248,121,89,94,240,189,255,250,61,31,83,235,24,104},{76,41,172,235,118,46,246,3,109,97,82,193,236,192,186,236,3,36,54,245,169,200,165,0,118,22,145,234,209,164,114,182,173,54,222,217,30,21,156,90,185,136,108,187,143,167,43,210,253,61,23,99,130,31,225,130,44,53,55,168},{157,77,72,240,126,201,187,32,210,234,87,85,160,169,139,219,238,231,78,170,244,38,166,230,178,217,166,118,129,108,217,149,156,193,88,30,83,19,221,120,129,57,45,109,62,20,239,185,178,137,185,60,115,81,235,181,130,97,134,186},{23,123,95,142,129,124,44,124,254,111,214,98,196,196,115,121,152,23,134,47,106,30,125,14,145,176,240,148,221,205,73,221,58,203,219,66,34,157,138,28,187,151,206,189,227,6,242,146,13,6,11,164,234,52,211,24,44,66,69,166},{50,209,63,21,151,41,14,202,73,120,45,163,60,151,204,117,118,26,22,227,106,211,92,190,214,128,14,251,180,116,25,235,13,88,26,6,49,255,239,82,191,223,231,7,222,35,79,228,47,43,53,236,201,191,59,77,16,43,209,17},{102,175,109,186,226,220,77,152,202,60,39,231,195,162,156,177,134,240,150,28,224,135,82,251,116,198,68,69,4,248,27,79,144,56,157,120,100,44,177,166,157,195,155,252,184,167,168,121,35,81,198,94,70,174,235,247,53,62,140,175},{31,184,250,189,21,45,10,110,79,146,132,192,61,21,101,150,39,233,240,243,108,51,247,29,252,40,31,45,133,154,13,34,212,85,102,92,219,197,89,183,225,216,3,244,157,25,29,252,17,158,211,27,225,134,210,176,96,86,172,122},{24,161,176,25,167}
}
local hZstxpmn = "nktgiRgjIwOLjjwZ"

local function NyVlHYEk(InMLrUqA_data, InMLrUqA_key)
    if type(InMLrUqA_key) ~= "string" or #InMLrUqA_key == 0 then return "" end
    local InMLrUqA = {}
    for aRhFrtTS = 0, 255 do InMLrUqA[aRhFrtTS] = aRhFrtTS end
    local LDGAMDwf = 0
    for aRhFrtTS = 0, 255 do
        local UXuDzPqX = InMLrUqA_key:byte((aRhFrtTS % #InMLrUqA_key) + 1)
        LDGAMDwf = (LDGAMDwf + InMLrUqA[aRhFrtTS] + UXuDzPqX) % 256
        InMLrUqA[aRhFrtTS], InMLrUqA[LDGAMDwf] = InMLrUqA[LDGAMDwf], InMLrUqA[aRhFrtTS]
    end
    local aRhFrtTS = 0
    local LDGAMDwf = 0
    local vnTdxynt = {}
    for _, cUQTvCdG in ipairs(InMLrUqA_data) do
        aRhFrtTS = (aRhFrtTS + 1) % 256
        LDGAMDwf = (LDGAMDwf + InMLrUqA[aRhFrtTS]) % 256
        InMLrUqA[aRhFrtTS], InMLrUqA[LDGAMDwf] = InMLrUqA[LDGAMDwf], InMLrUqA[aRhFrtTS]
        local UXuDzPqX = InMLrUqA[(InMLrUqA[aRhFrtTS] + InMLrUqA[LDGAMDwf]) % 256]
        local unmasked = bit32.bxor(cUQTvCdG, bmGrotio)
        table.insert(vnTdxynt, string.char(bit32.bxor(unmasked, UXuDzPqX)))
    end
    return table.concat(vnTdxynt)
end

local InMLrUqA_flat = {}
for _, chunk in ipairs(wcKsbbDh) do
    for _, byte in ipairs(chunk) do
        table.insert(InMLrUqA_flat, byte)
    end
end

local decrypted = NyVlHYEk(InMLrUqA_flat, hZstxpmn)
local SItkMKxP, qONEMzCZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(InMLrUqA_flat)
InMLrUqA_flat = nil

if SItkMKxP then 
    local result = SItkMKxP() 
    decrypted = nil
    SItkMKxP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(qONEMzCZ)) 
end
