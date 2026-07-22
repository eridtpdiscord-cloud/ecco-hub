-- Protected Segment (tween_library)
local rlUCNynv = 229
local CkRXNSui = {
{82,202,167,41,201,180,171,222,147,17,54,36,148,40,195,54,30,56,181,104,132,164,191,136,39,136,142,100,132,1,96,179,104,185,51,82,88,89,125,98,189,163,95,105,160,12,18,39,57,41,189,77,237,239,6,167,159,22,255,158},{174,36,21,192,17,52,227,19,7,9,211,166,154,37,227,247,204,183,196,157,72,209,21,217,251,77,17,99,106,97,213,85,99,31,84,78,80,87,25,112,103,242,166,145,175,187,179,254,171,72,116,131,247,142,197,7,60,220,72,31},{203,9,6,152,59,202,219,134,170,205,249,58,161,171,68,46,111,21,7,217,93,36,34,27,23}
}
local MhdLkMXy = "PyXTmGUIMOpAAcyW"

local function QdsIkXbg(VxBYlNvI_data, VxBYlNvI_key)
    local VxBYlNvI = {}
    for eoyRCpzc = 0, 255 do VxBYlNvI[eoyRCpzc] = eoyRCpzc end
    local FtgiEPSv = 0
    for eoyRCpzc = 0, 255 do
        local idMkYkuK = VxBYlNvI_key:byte((eoyRCpzc % #VxBYlNvI_key) + 1)
        FtgiEPSv = (FtgiEPSv + VxBYlNvI[eoyRCpzc] + idMkYkuK) % 256
        VxBYlNvI[eoyRCpzc], VxBYlNvI[FtgiEPSv] = VxBYlNvI[FtgiEPSv], VxBYlNvI[eoyRCpzc]
    end
    local eoyRCpzc = 0
    local FtgiEPSv = 0
    local YbDxwFky = {}
    for _, QZvsqwyN in ipairs(VxBYlNvI_data) do
        eoyRCpzc = (eoyRCpzc + 1) % 256
        FtgiEPSv = (FtgiEPSv + VxBYlNvI[eoyRCpzc]) % 256
        VxBYlNvI[eoyRCpzc], VxBYlNvI[FtgiEPSv] = VxBYlNvI[FtgiEPSv], VxBYlNvI[eoyRCpzc]
        local idMkYkuK = VxBYlNvI[(VxBYlNvI[eoyRCpzc] + VxBYlNvI[FtgiEPSv]) % 256]
        local unmasked = bit32.bxor(QZvsqwyN, rlUCNynv)
        table.insert(YbDxwFky, string.char(bit32.bxor(unmasked, idMkYkuK)))
    end
    return table.concat(YbDxwFky)
end

local VxBYlNvI_flat = {}
for _, chunk in ipairs(CkRXNSui) do
    for _, byte in ipairs(chunk) do
        table.insert(VxBYlNvI_flat, byte)
    end
end

local decrypted = QdsIkXbg(VxBYlNvI_flat, MhdLkMXy)
local NBvMqjHd, SkwXVmjb = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(VxBYlNvI_flat)
VxBYlNvI_flat = nil

if NBvMqjHd then 
    local result = NBvMqjHd() 
    decrypted = nil
    NBvMqjHd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(SkwXVmjb)) 
end
