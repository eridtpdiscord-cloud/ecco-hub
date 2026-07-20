-- Compiled secure segment
local BfWhgtTQ = {
{106,204,168,40,247,161,61,53,241,91,169,10,190,229,182,72,73,8,27,4,236,63,111,145,135,239,132,234,211,201,23,63,64,250,194,72,23,160,82,137,186,18,136,171,80,2,251,107,27,159,193,82,207,124,173,126,201,135,133,34},{67,19,125,58,71,175,212,189,249,21,20,68,80,170,61,48,12,59,98,227,242,80,74,11,211,122,34,104,82,156,159,175,31,57,172,141,226,4,73,182,89,200,25,99,249,156,103,215,128,51,196,151,153,207,146,204,46,131,103,48},{175,27,80,62,214,236,105,117,202,156,22,101,217,51,84,247,164,78,48,102,189,82,201,156,203,11,149,194,33}
}
local uAjUdVVZ = "nDzIAhwIvGRVjTVJ"

local function VmLRnUXo(ZZOShuaX_data, ZZOShuaX_key)
    local ZZOShuaX = {}
    for OeVjDosg = 0, 255 do ZZOShuaX[OeVjDosg] = OeVjDosg end
    local aMQCyGGA = 0
    for OeVjDosg = 0, 255 do
        local guCIOLkP = ZZOShuaX_key:byte((OeVjDosg % #ZZOShuaX_key) + 1)
        aMQCyGGA = (aMQCyGGA + ZZOShuaX[OeVjDosg] + guCIOLkP) % 256
        ZZOShuaX[OeVjDosg], ZZOShuaX[aMQCyGGA] = ZZOShuaX[aMQCyGGA], ZZOShuaX[OeVjDosg]
    end
    local OeVjDosg = 0
    local aMQCyGGA = 0
    local sfdvQiqK = {}
    for _, khAQLjjm in ipairs(ZZOShuaX_data) do
        OeVjDosg = (OeVjDosg + 1) % 256
        aMQCyGGA = (aMQCyGGA + ZZOShuaX[OeVjDosg]) % 256
        ZZOShuaX[OeVjDosg], ZZOShuaX[aMQCyGGA] = ZZOShuaX[aMQCyGGA], ZZOShuaX[OeVjDosg]
        local guCIOLkP = ZZOShuaX[(ZZOShuaX[OeVjDosg] + ZZOShuaX[aMQCyGGA]) % 256]
        table.insert(sfdvQiqK, string.char(bit32.bxor(khAQLjjm, guCIOLkP)))
    end
    return table.concat(sfdvQiqK)
end

local ZZOShuaX_flat = {}
for _, chunk in ipairs(BfWhgtTQ) do
    for _, byte in ipairs(chunk) do
        table.insert(ZZOShuaX_flat, byte)
    end
end

local decrypted = VmLRnUXo(ZZOShuaX_flat, uAjUdVVZ)
local JYKWMgoX, MrQRGpvS = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(ZZOShuaX_flat)
ZZOShuaX_flat = nil

if JYKWMgoX then 
    local result = JYKWMgoX() 
    decrypted = nil
    JYKWMgoX = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(MrQRGpvS)) 
end
