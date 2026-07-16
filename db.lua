-- Compiled secure segment
local ItMqOuNA = {
{46,236,175,180,217,150,171,104,19,153,203,165,218,219,120,225,152,106,31,128,56,64,117,205,247,223,219,182,158,21,48,7,39,166,80,176,0,254,52,188,88,52,66,99,214,116,5,169,87,30,40,177,216,199,199,149,75,29,37,43},{238,214,164,168,64,250,230,2,202,103,251,52,148,71,209,216,82,207,97,232,60,147,136,102,235,57,0,30,23,93,69,65,174,31,108,168,180,65,245,111,54,213,153,180,123,172,73,13,202,32,171,71,70,228,52,140,77,228,10,86},{28,87,130,44,15,107,190,55,39,229,199,142,214,108,72,21,198,206,239,200,208,116,36,245,190,198,55,69,246,39,143,231,19,142,156,185,186,97,50,231,145,122,196,57,243,209,30,170,40,199,44,190,33,32,212,57,0,77,121,152},{160,80,232,194,28,88,43,141,85,248,74,42,1,75,178,186,35,186,93,148,2,194,46,188,198,248,12,159,115,177,65,236,231,122,38,15,237,213,150,137,5,99,175,161,49,220,7,89,29,211,11,3,155,159,115,6,48,63,163,213},{166,1,228,37,119,227,89,241,212,112,127,5,236,202,29,245,163,23,244,91,47,220,176,16,113,236,178,220,46,137,233,186,150,166,232,5,23,86,170,33,196,166,180,36,183,35,140,124,69,223,240,68,85,90,99,83,231,201,105,4},{44,22,123,198,237,227,58,78,59,52,209,194,118,15,114,58,59,216,238,92,18,58,128,184,93,23,173,95,220,73,70,176,181,178,185,215,226,94,228,129,231,48,92,191,141,227,16,163,247,34,45,141,234,121,237,111,246,93,27,246},{80,139,110,87,86,159,249,38,202,181,24,34,231,47,217,61,31,154,64,114,69,33,211,172,40,114,218,230,117,248,4,108,250,20,169,248,22,59,171,83,112,202,97,215,213,14,194,101,200,137,243,139,247,84,88,224,241,98,90,242},{212,210,126,11,86,207,83,247,139,100,57,225,182,219,3,111,105,156,245,253,251,204}
}
local BrIxXBLa = "TtVPHBzonGxfdtDM"

local function gGJddYik(VMUaBOys_data, VMUaBOys_key)
    local VMUaBOys = {}
    for fprHtUbV = 0, 255 do VMUaBOys[fprHtUbV] = fprHtUbV end
    local RrlHhCoZ = 0
    for fprHtUbV = 0, 255 do
        local xolyUiaY = VMUaBOys_key:byte((fprHtUbV % #VMUaBOys_key) + 1)
        RrlHhCoZ = (RrlHhCoZ + VMUaBOys[fprHtUbV] + xolyUiaY) % 256
        VMUaBOys[fprHtUbV], VMUaBOys[RrlHhCoZ] = VMUaBOys[RrlHhCoZ], VMUaBOys[fprHtUbV]
    end
    local fprHtUbV = 0
    local RrlHhCoZ = 0
    local QbvcnEIL = {}
    for _, RcTSGjhU in ipairs(VMUaBOys_data) do
        fprHtUbV = (fprHtUbV + 1) % 256
        RrlHhCoZ = (RrlHhCoZ + VMUaBOys[fprHtUbV]) % 256
        VMUaBOys[fprHtUbV], VMUaBOys[RrlHhCoZ] = VMUaBOys[RrlHhCoZ], VMUaBOys[fprHtUbV]
        local xolyUiaY = VMUaBOys[(VMUaBOys[fprHtUbV] + VMUaBOys[RrlHhCoZ]) % 256]
        table.insert(QbvcnEIL, string.char(bit32.bxor(RcTSGjhU, xolyUiaY)))
    end
    return table.concat(QbvcnEIL)
end

local VMUaBOys_flat = {}
for _, chunk in ipairs(ItMqOuNA) do
    for _, byte in ipairs(chunk) do
        table.insert(VMUaBOys_flat, byte)
    end
end

local decrypted = gGJddYik(VMUaBOys_flat, BrIxXBLa)
local uFXKkncc, QvnXCvLV = loadstring(decrypted)
if uFXKkncc then 
    return uFXKkncc() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(QvnXCvLV)) 
end
