-- Compiled secure segment
local mbpEIlqo = {
{84,175,206,201,58,244,251,136,13,95,145,18,102,119,102,54,201,43,55,118,78,187,36,181,234,30,16,88,72,171,71,234,9,107,97,56,14,52,97,217,90,112,63,80,75,35,147,134,23,174,5,221,19,134,229,221,195,255,206,76},{43,213,226,168,46,9,28,72,21,200,29,211,174,21,125,83,232,122,195,22,87,141,56,157,82,85,84,200,255,130,2,186,249,129,202,36,81,123,231,47,101,250,41,149,237,84,78,62,152,146,113,141,77,150,180,197,209,0,52,20},{19,133,244,95,149,169,3,228,69,217,79,130,150,22,149,133,64,223,98,170,102,46,27,10,112,243,101,124}
}
local dOkxlXuS = "cERUOiohhArLXMVL"

local function KzHViMCU(zaSxoaon_data, zaSxoaon_key)
    local zaSxoaon = {}
    for pmZZRnAk = 0, 255 do zaSxoaon[pmZZRnAk] = pmZZRnAk end
    local efWXIVWs = 0
    for pmZZRnAk = 0, 255 do
        local wvYDVnge = zaSxoaon_key:byte((pmZZRnAk % #zaSxoaon_key) + 1)
        efWXIVWs = (efWXIVWs + zaSxoaon[pmZZRnAk] + wvYDVnge) % 256
        zaSxoaon[pmZZRnAk], zaSxoaon[efWXIVWs] = zaSxoaon[efWXIVWs], zaSxoaon[pmZZRnAk]
    end
    local pmZZRnAk = 0
    local efWXIVWs = 0
    local atcuUutN = {}
    for _, dHnBCnTR in ipairs(zaSxoaon_data) do
        pmZZRnAk = (pmZZRnAk + 1) % 256
        efWXIVWs = (efWXIVWs + zaSxoaon[pmZZRnAk]) % 256
        zaSxoaon[pmZZRnAk], zaSxoaon[efWXIVWs] = zaSxoaon[efWXIVWs], zaSxoaon[pmZZRnAk]
        local wvYDVnge = zaSxoaon[(zaSxoaon[pmZZRnAk] + zaSxoaon[efWXIVWs]) % 256]
        table.insert(atcuUutN, string.char(bit32.bxor(dHnBCnTR, wvYDVnge)))
    end
    return table.concat(atcuUutN)
end

local zaSxoaon_flat = {}
for _, chunk in ipairs(mbpEIlqo) do
    for _, byte in ipairs(chunk) do
        table.insert(zaSxoaon_flat, byte)
    end
end

local decrypted = KzHViMCU(zaSxoaon_flat, dOkxlXuS)
local uXuSSHdo, WBCCIaAq = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(zaSxoaon_flat)
zaSxoaon_flat = nil

if uXuSSHdo then 
    local result = uXuSSHdo() 
    decrypted = nil
    uXuSSHdo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(WBCCIaAq)) 
end
