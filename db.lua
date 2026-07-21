-- Protected Segment (db)
local GVsreshR = 11
local GbYrVpLt = {
{249,168,61,1,15,184,59,152,147,229,52,95,121,19,182,229,33,23,154,173,70,130,104,164,184,245,179,82,187,163,113,72,160,219,61,254,233,218,91,132,138,118,12,109,24,12,90,19,3,114,41,121,13,243,155,227,197,158,223,201},{128,26,64,184,18,71,59,253,114,26,248,77,239,0,55,75,141,207,204,39,79,194,198,104,92,127,171,63,42,203,168,14,128,55,250,254,131,106,53,179,249,12,239,184,83,89,10,169,66,38,13,212,51,19,185,72,40,104,211,57},{43,166,6,109,29,91,189,98,223,173,2,135,253,95,215,200,194,52,50,124,204,147,209,66,166,17,50,230,121,18,12,253,228,29,211,109,24,98,162,51,221,164,215,13,92,166,228,244,236,47,223,178,238,115,211,112,132,224,135,193},{246,199,166,148,12,196,10,199,166,27,217,7,134,46,139,26,43,211,137,233,15,8,189,154,144,157,223,236,203,31,20,181,137,241,189,250,138,51,185,114,26,212,233,126,71,81,49,128,207,45,26,185,187,75,124,248,143,105,134,225},{172,117,254,142,33,102,28,209,216,121,115,253,78,245,0,234,173,217,246,109,50,193,234,138,51,21,113,226,236,31,99,61,189,50,172,202,252,25,19,22,220,173,163,255,248,117,157,142,239,144,185,175,84,105,246,171,31,155,168,119},{75,52,139,229,207,151,219,34,49,73,221,52,99,9,195,154,254,20,28,138,205,104,3,102,113,61,129,37,106,238,202,248,28,186,38,211,171,193,221,199,235,186,138,215,123,194,113,180,91,129,219,5,49,38,98,59,16,22,112,219},{235,164,12,148,91,253,20,23,42,103,188,26,156,198,226,51,243,162,122,250,7,133,11,105,95,63,153,121,85,100,95,231,188,63,105,47,45,28,173,197,152,187,228,31,57}
}
local uZwfuAuc = "EBagpAsqkqrgbvvi"

local function PQWPNZJW(GHrGDPLF_data, GHrGDPLF_key)
    local GHrGDPLF = {}
    for kUvBaxpH = 0, 255 do GHrGDPLF[kUvBaxpH] = kUvBaxpH end
    local qRKUaxuT = 0
    for kUvBaxpH = 0, 255 do
        local hAsfVAIV = GHrGDPLF_key:byte((kUvBaxpH % #GHrGDPLF_key) + 1)
        qRKUaxuT = (qRKUaxuT + GHrGDPLF[kUvBaxpH] + hAsfVAIV) % 256
        GHrGDPLF[kUvBaxpH], GHrGDPLF[qRKUaxuT] = GHrGDPLF[qRKUaxuT], GHrGDPLF[kUvBaxpH]
    end
    local kUvBaxpH = 0
    local qRKUaxuT = 0
    local JUfXmzzd = {}
    for _, RHbUbYSm in ipairs(GHrGDPLF_data) do
        kUvBaxpH = (kUvBaxpH + 1) % 256
        qRKUaxuT = (qRKUaxuT + GHrGDPLF[kUvBaxpH]) % 256
        GHrGDPLF[kUvBaxpH], GHrGDPLF[qRKUaxuT] = GHrGDPLF[qRKUaxuT], GHrGDPLF[kUvBaxpH]
        local hAsfVAIV = GHrGDPLF[(GHrGDPLF[kUvBaxpH] + GHrGDPLF[qRKUaxuT]) % 256]
        local unmasked = bit32.bxor(RHbUbYSm, GVsreshR)
        table.insert(JUfXmzzd, string.char(bit32.bxor(unmasked, hAsfVAIV)))
    end
    return table.concat(JUfXmzzd)
end

local GHrGDPLF_flat = {}
for _, chunk in ipairs(GbYrVpLt) do
    for _, byte in ipairs(chunk) do
        table.insert(GHrGDPLF_flat, byte)
    end
end

local decrypted = PQWPNZJW(GHrGDPLF_flat, uZwfuAuc)
local smuxfHef, CpPnYjEA = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GHrGDPLF_flat)
GHrGDPLF_flat = nil

if smuxfHef then 
    local result = smuxfHef() 
    decrypted = nil
    smuxfHef = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(CpPnYjEA)) 
end
