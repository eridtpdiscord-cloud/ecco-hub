-- Compiled secure segment
local aWEaAeoq = {
{84,101,148,7,42,36,167,226,202,82,123,42,53,70,242,81,190,146,211,123,129,92,235,82,109,90,9,107,34,146,178,149,230,201,224,144,90,122,34,19,69,180,24,231,96,163,152,64,170,102,151,196,38,92,114,3,177,131,31,220},{148,90,250,76,60,86,68,161,219,162,231,5,219,174,45,135,167,23,77,208,224,44,126,210,242,219,104,41,182,118,252,26,30,223,191,71,227,230,233,19,219,172,231,192,17,65,55,109,59,241,23,138,115,173,189,120,184,42,124,83},{224,119,254,40,220,78,243,218,213,86,117,16,174,127,245,121,169,173,221,82,161,3,83,181,176,48,220,226,115,178,177,121,22,150,85,117,41,63,160,54,132,93,210,22,141,83,20,139,242,39,131,209,110,57,192,136,253,121,32,222},{1,50,112,155,56,38,30,26,76,120,177,10,235,122,47,53,240,232,191,146,130,173,180,77,141,223,240,245,75,202,156,54,123,165,141,253,72,149,126,213,241,128,143,55,41,63,140,190,170,157,188,50,228,128,31,224,56,176,0,141},{158,219,175,49,95,28,177,137,204,49,93,28,253,17,112,222,91,188,44,95,19,75,98,36,200,199,143,183,18,98,34,243,135,155,63,245,254,138,210,77,249,106,66,236,67,22,112,221,252,16,108,85,79,238,187,141,108,241,192,188},{32,198,224,57,157,230,78,136,237,29,208,80,141,170,148,196,214,68,25,38,124,94,164,222,124,161,239,248,40,171,168,56,63,151,157,148,6,205,96,122,37,196,236,4,6,167,105,203,231,71,99,138,53,100,200,42,207,153,38,102},{125,129,181,228,66,30,196,13,181,62,190,236,122,32,4,254,94,242,42,66,197,164,0,65,155,217,231,129,208,199,58,188,182,214,40,104,226,242,46,143,38,65,60,221,151,68,143}
}
local kCTMZBYh = "SOxmoyuVGozMSGJH"

local function jeTjIeWZ(ORvjMUHk_data, ORvjMUHk_key)
    local ORvjMUHk = {}
    for qPBdcMNN = 0, 255 do ORvjMUHk[qPBdcMNN] = qPBdcMNN end
    local LxqSAbuB = 0
    for qPBdcMNN = 0, 255 do
        local pRmeUCNR = ORvjMUHk_key:byte((qPBdcMNN % #ORvjMUHk_key) + 1)
        LxqSAbuB = (LxqSAbuB + ORvjMUHk[qPBdcMNN] + pRmeUCNR) % 256
        ORvjMUHk[qPBdcMNN], ORvjMUHk[LxqSAbuB] = ORvjMUHk[LxqSAbuB], ORvjMUHk[qPBdcMNN]
    end
    local qPBdcMNN = 0
    local LxqSAbuB = 0
    local JjOEIzEb = {}
    for _, qVmaVYfy in ipairs(ORvjMUHk_data) do
        qPBdcMNN = (qPBdcMNN + 1) % 256
        LxqSAbuB = (LxqSAbuB + ORvjMUHk[qPBdcMNN]) % 256
        ORvjMUHk[qPBdcMNN], ORvjMUHk[LxqSAbuB] = ORvjMUHk[LxqSAbuB], ORvjMUHk[qPBdcMNN]
        local pRmeUCNR = ORvjMUHk[(ORvjMUHk[qPBdcMNN] + ORvjMUHk[LxqSAbuB]) % 256]
        table.insert(JjOEIzEb, string.char(bit32.bxor(qVmaVYfy, pRmeUCNR)))
    end
    return table.concat(JjOEIzEb)
end

local ORvjMUHk_flat = {}
for _, chunk in ipairs(aWEaAeoq) do
    for _, byte in ipairs(chunk) do
        table.insert(ORvjMUHk_flat, byte)
    end
end

local decrypted = jeTjIeWZ(ORvjMUHk_flat, kCTMZBYh)
local HyGHvFIW, VtUVjTNB = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(ORvjMUHk_flat)
ORvjMUHk_flat = nil

if HyGHvFIW then 
    local result = HyGHvFIW() 
    decrypted = nil
    HyGHvFIW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(VtUVjTNB)) 
end
