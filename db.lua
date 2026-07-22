-- Protected Segment (db)
local gvQRKtqc = 129
local bylErFin = {
{87,229,163,44,59,235,11,105,106,135,250,253,245,86,21,39,10,122,170,60,84,127,85,75,162,136,117,25,140,64,59,79,57,171,103,115,164,163,201,112,1,26,215,175,136,175,190,232,91,54,40,44,96,150,27,61,114,131,118,71},{129,92,252,46,236,89,186,1,240,43,152,186,104,147,28,42,136,67,82,188,229,23,194,181,26,104,138,201,192,219,71,145,193,161,85,87,185,115,194,51,9,191,36,212,13,63,214,249,91,118,245,44,164,146,217,163,177,171,182,168},{183,185,31,30,155,248,201,2,28,168,0,159,161,74,39,9,79,163,233,246,109,213,206,233,137,243,66,4,188,230,44,165,110,233,59,80,8,41,109,150,245,207,25,237,119,111,229,86,43,166,92,14,75,59,0,96,254,81,217,164},{152,189,121,122,7,181,161,109,18,11,163,81,104,203,228,247,114,249,228,33,114,11,195,228,144,255,111,0,166,179,110,249,57,104,119,76,64,3,247,61,173,118,45,114,72,251,213,205,215,87,252,48,200,38,59,219,7,16,54,204},{162,179,113,223,216,4,154,193,62,176,62,66,87,3,133,161,176,123,98,138,156,136,243,253,96,101,38,173,32,189,48,252,21,4,126,216,184,63,11,248,240,82,77,22,118,1,181,32,88,42,37,162,44,202,176,238,4,143,134,72},{217,2,203,83,65,4,40,91,192,12,181,125,115,53,171,27,85,113,172,10,199,146,234,183,245,245,241,32,254,218,204,142,243,130,2,13,125,80,64,197,228,111,165,164,36,186,216,119,148,129,180,135,129,124,38,253,25,207,136,8},{225,40,247,116,199,66,38,209,235,18,184,98,2,143,215,6,48,224,140,212,239,131,153,122,72,226,22,48,49,104,191,162,102,29,19,65,113,160,73,130,83,40,19,163,232,138}
}
local EkQABFGD = "WbffjQcStaBYKdef"

local function qLhnVIEH(JnPIRPNA_data, JnPIRPNA_key)
    local JnPIRPNA = {}
    for YasdpdZM = 0, 255 do JnPIRPNA[YasdpdZM] = YasdpdZM end
    local RQKwiLYl = 0
    for YasdpdZM = 0, 255 do
        local BDAGJqCm = JnPIRPNA_key:byte((YasdpdZM % #JnPIRPNA_key) + 1)
        RQKwiLYl = (RQKwiLYl + JnPIRPNA[YasdpdZM] + BDAGJqCm) % 256
        JnPIRPNA[YasdpdZM], JnPIRPNA[RQKwiLYl] = JnPIRPNA[RQKwiLYl], JnPIRPNA[YasdpdZM]
    end
    local YasdpdZM = 0
    local RQKwiLYl = 0
    local bZRCGIuL = {}
    for _, APezGmMa in ipairs(JnPIRPNA_data) do
        YasdpdZM = (YasdpdZM + 1) % 256
        RQKwiLYl = (RQKwiLYl + JnPIRPNA[YasdpdZM]) % 256
        JnPIRPNA[YasdpdZM], JnPIRPNA[RQKwiLYl] = JnPIRPNA[RQKwiLYl], JnPIRPNA[YasdpdZM]
        local BDAGJqCm = JnPIRPNA[(JnPIRPNA[YasdpdZM] + JnPIRPNA[RQKwiLYl]) % 256]
        local unmasked = bit32.bxor(APezGmMa, gvQRKtqc)
        table.insert(bZRCGIuL, string.char(bit32.bxor(unmasked, BDAGJqCm)))
    end
    return table.concat(bZRCGIuL)
end

local JnPIRPNA_flat = {}
for _, chunk in ipairs(bylErFin) do
    for _, byte in ipairs(chunk) do
        table.insert(JnPIRPNA_flat, byte)
    end
end

local decrypted = qLhnVIEH(JnPIRPNA_flat, EkQABFGD)
local GCcgaWcr, iOSKaEBp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JnPIRPNA_flat)
JnPIRPNA_flat = nil

if GCcgaWcr then 
    local result = GCcgaWcr() 
    decrypted = nil
    GCcgaWcr = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(iOSKaEBp)) 
end
