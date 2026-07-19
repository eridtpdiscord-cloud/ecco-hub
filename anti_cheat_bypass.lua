-- Compiled secure segment
local uBLrRaVx = {
{192,149,236,96,120,136,96,135,247,169,230,194,141,151,156,9,93,21,190,212,169,73,41,190,254,116,107,175,116,13,161,55,90,143,239,1,186,177,162,127,35,26,158,165,202,97,93,159,129,67,42,83,21,113,169,225,211,128,180,211},{230,33,244,186,25,196,13,197,201,43,24,79,193,0,154,50,175,65,56,43,144,156,158,13,89,218,55,98,234,252,207,22,112,77,200,131,97,233,255,71,164,248,146,117,246,157,116,28,253,20,69,166,57,35,100,148,202,24,84,239},{40,158,19,238,190,106,70,123,48,118,162,22,60,24,69,132,223,88,88,118,45,241,200,126,60,6,226,4,11}
}
local WqxYBEdc = "StCGjHRMcoCqcbJX"

local function Mxdxcncz(tTZKNERY_data, tTZKNERY_key)
    local tTZKNERY = {}
    for EIqILGJu = 0, 255 do tTZKNERY[EIqILGJu] = EIqILGJu end
    local kTUfxLXk = 0
    for EIqILGJu = 0, 255 do
        local pwaaUvTN = tTZKNERY_key:byte((EIqILGJu % #tTZKNERY_key) + 1)
        kTUfxLXk = (kTUfxLXk + tTZKNERY[EIqILGJu] + pwaaUvTN) % 256
        tTZKNERY[EIqILGJu], tTZKNERY[kTUfxLXk] = tTZKNERY[kTUfxLXk], tTZKNERY[EIqILGJu]
    end
    local EIqILGJu = 0
    local kTUfxLXk = 0
    local vAjPVCQb = {}
    for _, SOqSiHFL in ipairs(tTZKNERY_data) do
        EIqILGJu = (EIqILGJu + 1) % 256
        kTUfxLXk = (kTUfxLXk + tTZKNERY[EIqILGJu]) % 256
        tTZKNERY[EIqILGJu], tTZKNERY[kTUfxLXk] = tTZKNERY[kTUfxLXk], tTZKNERY[EIqILGJu]
        local pwaaUvTN = tTZKNERY[(tTZKNERY[EIqILGJu] + tTZKNERY[kTUfxLXk]) % 256]
        table.insert(vAjPVCQb, string.char(bit32.bxor(SOqSiHFL, pwaaUvTN)))
    end
    return table.concat(vAjPVCQb)
end

local tTZKNERY_flat = {}
for _, chunk in ipairs(uBLrRaVx) do
    for _, byte in ipairs(chunk) do
        table.insert(tTZKNERY_flat, byte)
    end
end

local decrypted = Mxdxcncz(tTZKNERY_flat, WqxYBEdc)
local fXXMZFvm, RATxxWOo = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(tTZKNERY_flat)
tTZKNERY_flat = nil

if fXXMZFvm then 
    local result = fXXMZFvm() 
    decrypted = nil
    fXXMZFvm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(RATxxWOo)) 
end
