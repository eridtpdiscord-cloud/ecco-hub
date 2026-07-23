-- Protected Segment (db)
local kKpZKQsl = 89
local AdskZzqu = {
{27,56,96,0,195,212,160,221,189,196,25,249,100,247,83,152,61,145,92,133,42,127,47,6,188,232,41,204,85,193,208,21,27,191,176,157,236,86,171,32,166,238,62,30,74,112,80,235,224,146,230,53,97,131,218,251,147,156,196,86},{233,192,203,89,185,118,28,11,45,120,99,34,142,248,153,106,80,148,115,59,88,134,153,98,115,129,94,18,59,220,149,83,255,80,223,38,227,63,27,188,132,67,143,165,191,154,28,55,0,2,141,194,141,101,91,252,97,94,103,198},{249,44,117,111,111,27,181,216,163,52,199,129,96,175,156,194,75,45,100,62,80,179,86,219,176,198,78,107,143,135,165,250,7,171,252,134,174,170,101,172,67,220,30,1,43,127,111,180,28,152,22,170,198,205,189,8,118,48,16,49},{151,191,91,64,173,118,21,21,158,117,200,203,126,24,197,60,68,58,150,3,144,253,26,44,176,2,39,110,55,30,4,90,60,99,198,254,159,171,57,45,166,123,234,172,195,127,68,148,243,40,95,99,151,253,84,109,166,152,184,243},{153,76,26,149,44,154,44,187,106,20,196,56,251,109,7,43,144,38,153,184,174,249,252,241,126,229,219,100,193,49,24,127,134,71,237,156,107,151,53,178,137,149,142,209,202,189,32,112,97,39,162,37,213,214,18,251,43,79,174,126},{68,96,231,148,29,128,95,39,81,196,89,95,235,129,229,183,86,10,106,101,24,134,16,239,191,4,133,197,178,72,131,196,174,151,151,124,18,22,172,251,204,55,125,96,170,199,214,59,28,225,24,9,115,232,186,229,52,144,226,226},{78,10,12,201,54,102,95,179,167,202,14,92,166,108,230,163,120,191,101,212,239,5,200,230,251,22,9,54,66,203,223,57,158,95,227,157,158,121,161,65,167,52,189,61,91,96,66,225,12,228,98,33,60,35,15,79,23,178,224,42},{154,94,19,211,59,195,199,192,163,46,235,192,152,158,214,239,49,61,215,148,185,75,51,216,175,234,101,205,140,233,237,7,86,245,43,111,12,103,32,168,163,146,86,38,85,249,91,14,57,176,45,146,134,200,63,70,245,68,235}
}
local CibCNxMQ = "DwnObvqclzPJmlZN"

local function iIYbWYEz(pmmfVEpF_data, pmmfVEpF_key)
    if type(pmmfVEpF_key) ~= "string" or #pmmfVEpF_key == 0 then return "" end
    local pmmfVEpF = {}
    for BgfycoUR = 0, 255 do pmmfVEpF[BgfycoUR] = BgfycoUR end
    local sUYaslwz = 0
    for BgfycoUR = 0, 255 do
        local JEeSOzvM = pmmfVEpF_key:byte((BgfycoUR % #pmmfVEpF_key) + 1)
        sUYaslwz = (sUYaslwz + pmmfVEpF[BgfycoUR] + JEeSOzvM) % 256
        pmmfVEpF[BgfycoUR], pmmfVEpF[sUYaslwz] = pmmfVEpF[sUYaslwz], pmmfVEpF[BgfycoUR]
    end
    local BgfycoUR = 0
    local sUYaslwz = 0
    local dPRpZvcB = {}
    for _, sAQLvwxb in ipairs(pmmfVEpF_data) do
        BgfycoUR = (BgfycoUR + 1) % 256
        sUYaslwz = (sUYaslwz + pmmfVEpF[BgfycoUR]) % 256
        pmmfVEpF[BgfycoUR], pmmfVEpF[sUYaslwz] = pmmfVEpF[sUYaslwz], pmmfVEpF[BgfycoUR]
        local JEeSOzvM = pmmfVEpF[(pmmfVEpF[BgfycoUR] + pmmfVEpF[sUYaslwz]) % 256]
        local unmasked = bit32.bxor(sAQLvwxb, kKpZKQsl)
        table.insert(dPRpZvcB, string.char(bit32.bxor(unmasked, JEeSOzvM)))
    end
    return table.concat(dPRpZvcB)
end

local pmmfVEpF_flat = {}
for _, chunk in ipairs(AdskZzqu) do
    for _, byte in ipairs(chunk) do
        table.insert(pmmfVEpF_flat, byte)
    end
end

local decrypted = iIYbWYEz(pmmfVEpF_flat, CibCNxMQ)
local YmSyLJNu, bGegNerP = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pmmfVEpF_flat)
pmmfVEpF_flat = nil

if YmSyLJNu then 
    local result = YmSyLJNu() 
    decrypted = nil
    YmSyLJNu = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(bGegNerP)) 
end
