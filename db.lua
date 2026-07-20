-- Compiled secure segment
local BjyFQnqM = {
{169,76,118,120,41,190,57,15,85,251,7,88,24,101,233,130,249,104,116,145,100,64,184,202,61,143,192,187,213,69,213,41,48,244,85,229,107,134,206,48,228,214,245,51,194,132,244,0,238,180,4,216,19,205,217,102,158,98,118,250},{0,74,109,94,46,43,102,104,129,114,186,185,12,124,184,228,90,90,182,245,182,143,82,113,20,196,17,121,214,130,11,86,19,176,174,220,89,249,62,130,194,22,95,251,22,12,153,67,5,107,224,30,162,222,96,170,46,228,197,107},{23,233,110,135,14,203,79,74,121,144,26,249,137,251,74,250,71,104,130,88,155,23,163,21,222,138,167,254,165,236,137,62,136,138,52,237,62,64,62,223,107,67,152,217,215,100,44,56,77,71,242,3,59,53,119,250,104,207,153,237},{95,194,73,50,189,101,21,67,12,42,29,219,89,54,166,233,8,228,142,39,144,230,116,16,90,75,160,46,126,223,116,149,120,238,192,250,45,62,110,76,115,7,155,40,80,51,47,40,177,135,178,7,146,142,109,86,203,235,93,121},{172,106,200,44,30,211,21,89,106,49,34,17,189,149,139,183,144,160,170,85,197,24,206,112,218,114,154,97,89,13,186,253,127,59,177,139,225,22,234,184,84,120,126,22,171,188,95,235,93,43,82,7,66,60,68,148,185,165,28,245},{85,181,116,110,186,117,171,123,168,38,63,72,167,92,141,176,210,168,231,3,231,72,220,179,2,20,162,115,178,49,20,185,97,104,146,102,224,152,170,10,90,37,194,48,100,242,210,85,12,137,185,13,201,32,207,25,92,172,239,236},{216,236,180,222,247,177,5,31,150,76,73,174,43,57,12,252,137,237,10,149,67,67,204,48,227,179,239,14,29,34,69,3,27,149,112,110,77,66,132,160,36,179}
}
local GRDhUHRL = "qrYXTlADYXYlhqMV"

local function KcBZQovB(rdGOheYc_data, rdGOheYc_key)
    local rdGOheYc = {}
    for uSQtKNab = 0, 255 do rdGOheYc[uSQtKNab] = uSQtKNab end
    local BbesoVml = 0
    for uSQtKNab = 0, 255 do
        local VfOmWrxG = rdGOheYc_key:byte((uSQtKNab % #rdGOheYc_key) + 1)
        BbesoVml = (BbesoVml + rdGOheYc[uSQtKNab] + VfOmWrxG) % 256
        rdGOheYc[uSQtKNab], rdGOheYc[BbesoVml] = rdGOheYc[BbesoVml], rdGOheYc[uSQtKNab]
    end
    local uSQtKNab = 0
    local BbesoVml = 0
    local KEeDXZsn = {}
    for _, vNnfkJMV in ipairs(rdGOheYc_data) do
        uSQtKNab = (uSQtKNab + 1) % 256
        BbesoVml = (BbesoVml + rdGOheYc[uSQtKNab]) % 256
        rdGOheYc[uSQtKNab], rdGOheYc[BbesoVml] = rdGOheYc[BbesoVml], rdGOheYc[uSQtKNab]
        local VfOmWrxG = rdGOheYc[(rdGOheYc[uSQtKNab] + rdGOheYc[BbesoVml]) % 256]
        table.insert(KEeDXZsn, string.char(bit32.bxor(vNnfkJMV, VfOmWrxG)))
    end
    return table.concat(KEeDXZsn)
end

local rdGOheYc_flat = {}
for _, chunk in ipairs(BjyFQnqM) do
    for _, byte in ipairs(chunk) do
        table.insert(rdGOheYc_flat, byte)
    end
end

local decrypted = KcBZQovB(rdGOheYc_flat, GRDhUHRL)
local XVPMNIWJ, HMpIBtEA = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(rdGOheYc_flat)
rdGOheYc_flat = nil

if XVPMNIWJ then 
    local result = XVPMNIWJ() 
    decrypted = nil
    XVPMNIWJ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(HMpIBtEA)) 
end
