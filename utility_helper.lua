-- Compiled secure segment
local ilcYyBNo = {
{198,168,203,10,22,232,62,78,74,101,226,165,16,20,103,62,33,152,41,196,214,201,255,130,225,58,160,50,118,83,166,70,111,214,55,112,108,10,30,104,97,172,148,200,108,80,67,206,98,231,64,247,223,239,11,182,35,225,114,246},{157,226,50,125,75,158,239,173,182,207,103,115,214,121,233,163,129,189,167,189,153,249,186,245,4,85,153,237,4,14,241,58,232,222,176,113,136,149,126,72,232,137,121,88,96,146,114,118,189,207,128,237,7,14,247,111,13,209,100,164},{214,214,67,113,86,239,153,42,50,249,124,158,187,225,130,193,79,239,101,252,237,78,70,251,13,246}
}
local juteEtjR = "JshgqxLxbNcmRzQs"

local function mAOnDqmE(ChxNERZu_data, ChxNERZu_key)
    local ChxNERZu = {}
    for shCAJajc = 0, 255 do ChxNERZu[shCAJajc] = shCAJajc end
    local FimeMQTN = 0
    for shCAJajc = 0, 255 do
        local ANHyZtrM = ChxNERZu_key:byte((shCAJajc % #ChxNERZu_key) + 1)
        FimeMQTN = (FimeMQTN + ChxNERZu[shCAJajc] + ANHyZtrM) % 256
        ChxNERZu[shCAJajc], ChxNERZu[FimeMQTN] = ChxNERZu[FimeMQTN], ChxNERZu[shCAJajc]
    end
    local shCAJajc = 0
    local FimeMQTN = 0
    local GEAAsngC = {}
    for _, akaIUvvR in ipairs(ChxNERZu_data) do
        shCAJajc = (shCAJajc + 1) % 256
        FimeMQTN = (FimeMQTN + ChxNERZu[shCAJajc]) % 256
        ChxNERZu[shCAJajc], ChxNERZu[FimeMQTN] = ChxNERZu[FimeMQTN], ChxNERZu[shCAJajc]
        local ANHyZtrM = ChxNERZu[(ChxNERZu[shCAJajc] + ChxNERZu[FimeMQTN]) % 256]
        table.insert(GEAAsngC, string.char(bit32.bxor(akaIUvvR, ANHyZtrM)))
    end
    return table.concat(GEAAsngC)
end

local ChxNERZu_flat = {}
for _, chunk in ipairs(ilcYyBNo) do
    for _, byte in ipairs(chunk) do
        table.insert(ChxNERZu_flat, byte)
    end
end

local decrypted = mAOnDqmE(ChxNERZu_flat, juteEtjR)
local LNRAmFKs, vCCISZVM = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(ChxNERZu_flat)
ChxNERZu_flat = nil

if LNRAmFKs then 
    local result = LNRAmFKs() 
    decrypted = nil
    LNRAmFKs = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(vCCISZVM)) 
end
