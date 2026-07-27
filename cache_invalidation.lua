-- Protected Segment (cache_invalidation)
local yRYDNNYx = 88
local uAyTpFpt = {
{153,117,205,135,64,47,151,195,245,215,180,158,108,171,156,39,64,177,122,251,220,182,74,255,153,107,94,243,196,73,197,26,87,198,235,123,226,143,97,211,6,108,245,122,79,193,252,244,160,16,197,215,85,118,9,22,7,29,107,238},{35,209,180,209,128,82,88,120,147,168,94,98,184,27,196,254,15,27,28,165,185,65,121,28,1,194,49,199,46,77,93,91,27,7,141,86,155,239,100,1,182,213,51,147,155,98,107,180,94,115,159,180,42,122,100,237,216,148,187,196},{222,246,20,253,103,214,138,151,229,253,2,143,167,238,203,55,62,254,93,250,86,118,13,40,150,209,184,212,131,32}
}
local RkMazJcU = "WDsCWrxbziHavbNs"

local function YPVslkDT(OTEKvGfB_data, OTEKvGfB_key)
    if type(OTEKvGfB_key) ~= "string" or #OTEKvGfB_key == 0 then return "" end
    local OTEKvGfB = {}
    for RESowHUp = 0, 255 do OTEKvGfB[RESowHUp] = RESowHUp end
    local IvtsDeDH = 0
    for RESowHUp = 0, 255 do
        local JxXjPWro = OTEKvGfB_key:byte((RESowHUp % #OTEKvGfB_key) + 1)
        IvtsDeDH = (IvtsDeDH + OTEKvGfB[RESowHUp] + JxXjPWro) % 256
        OTEKvGfB[RESowHUp], OTEKvGfB[IvtsDeDH] = OTEKvGfB[IvtsDeDH], OTEKvGfB[RESowHUp]
    end
    local RESowHUp = 0
    local IvtsDeDH = 0
    local nzMDqEmC = {}
    for _, KHxGaREK in ipairs(OTEKvGfB_data) do
        RESowHUp = (RESowHUp + 1) % 256
        IvtsDeDH = (IvtsDeDH + OTEKvGfB[RESowHUp]) % 256
        OTEKvGfB[RESowHUp], OTEKvGfB[IvtsDeDH] = OTEKvGfB[IvtsDeDH], OTEKvGfB[RESowHUp]
        local JxXjPWro = OTEKvGfB[(OTEKvGfB[RESowHUp] + OTEKvGfB[IvtsDeDH]) % 256]
        local unmasked = bit32.bxor(KHxGaREK, yRYDNNYx)
        table.insert(nzMDqEmC, string.char(bit32.bxor(unmasked, JxXjPWro)))
    end
    return table.concat(nzMDqEmC)
end

local OTEKvGfB_flat = {}
for _, chunk in ipairs(uAyTpFpt) do
    for _, byte in ipairs(chunk) do
        table.insert(OTEKvGfB_flat, byte)
    end
end

local decrypted = YPVslkDT(OTEKvGfB_flat, RkMazJcU)
local DbJGejTa, DikhAiNT = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(OTEKvGfB_flat)
OTEKvGfB_flat = nil

if DbJGejTa then 
    local result = DbJGejTa() 
    decrypted = nil
    DbJGejTa = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(DikhAiNT)) 
end
