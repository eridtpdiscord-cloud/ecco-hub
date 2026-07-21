-- Protected Segment (tween_library)
local EgeicMDH = 244
local zWBVSKPm = {
{246,160,88,128,87,180,30,97,71,11,225,104,78,166,145,181,150,109,5,231,150,200,111,142,21,102,97,140,74,158,126,191,46,204,159,181,194,250,217,55,7,79,66,127,202,158,45,185,42,2,98,185,151,187,188,85,58,11,187,248},{212,97,80,244,170,153,18,185,38,73,165,185,145,12,122,55,86,103,243,110,137,139,140,243,29,68,80,133,103,250,180,57,4,74,48,3,136,182,197,236,207,235,138,216,102,24,78,53,66,115,137,179,172,151,33,64,116,76,86,255},{243,40,43,122,25,34,50,216,36,86,71,40,168,136,0,217,152,104,125,9,237,160,135,67,14}
}
local cWGKOMMR = "aoDqkespTdPFwXor"

local function rmcybOLX(eVqDmvAS_data, eVqDmvAS_key)
    local eVqDmvAS = {}
    for yMiJdSws = 0, 255 do eVqDmvAS[yMiJdSws] = yMiJdSws end
    local uGySGJpB = 0
    for yMiJdSws = 0, 255 do
        local UiGvGmFd = eVqDmvAS_key:byte((yMiJdSws % #eVqDmvAS_key) + 1)
        uGySGJpB = (uGySGJpB + eVqDmvAS[yMiJdSws] + UiGvGmFd) % 256
        eVqDmvAS[yMiJdSws], eVqDmvAS[uGySGJpB] = eVqDmvAS[uGySGJpB], eVqDmvAS[yMiJdSws]
    end
    local yMiJdSws = 0
    local uGySGJpB = 0
    local mzQmMhnv = {}
    for _, BmQLsZDr in ipairs(eVqDmvAS_data) do
        yMiJdSws = (yMiJdSws + 1) % 256
        uGySGJpB = (uGySGJpB + eVqDmvAS[yMiJdSws]) % 256
        eVqDmvAS[yMiJdSws], eVqDmvAS[uGySGJpB] = eVqDmvAS[uGySGJpB], eVqDmvAS[yMiJdSws]
        local UiGvGmFd = eVqDmvAS[(eVqDmvAS[yMiJdSws] + eVqDmvAS[uGySGJpB]) % 256]
        local unmasked = bit32.bxor(BmQLsZDr, EgeicMDH)
        table.insert(mzQmMhnv, string.char(bit32.bxor(unmasked, UiGvGmFd)))
    end
    return table.concat(mzQmMhnv)
end

local eVqDmvAS_flat = {}
for _, chunk in ipairs(zWBVSKPm) do
    for _, byte in ipairs(chunk) do
        table.insert(eVqDmvAS_flat, byte)
    end
end

local decrypted = rmcybOLX(eVqDmvAS_flat, cWGKOMMR)
local eeReHrCU, EwLfuHZn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eVqDmvAS_flat)
eVqDmvAS_flat = nil

if eeReHrCU then 
    local result = eeReHrCU() 
    decrypted = nil
    eeReHrCU = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(EwLfuHZn)) 
end
