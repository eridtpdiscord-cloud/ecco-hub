-- Protected Segment (teleport_handler)
local WPxwQcNV = 33
local sIIXSokb = {
{97,146,50,109,36,124,95,242,204,207,105,25,209,3,253,194,191,52,117,176,174,101,139,2,90,14,252,126,99,160,113,198,54,114,152,80,187,170,139,157,80,161,241,112,216,193,43,67,125,18,137,88,149,159,6,53,214,248,240,220},{232,100,171,196,48,83,161,148,59,6,253,92,204,220,153,168,27,195,153,152,141,1,187,199,166,157,239,168,189,235,42,53,34,64,233,111,242,236,148,78,120,239,138,212,111,10,28,36,176,117,174,87,254,24,60,216,195,10,135,154},{119,6,251,154,121,59,149,105,99,111,216,232,252,62,131,160,102,26,80,192,54,132,44,56,223,120,35,39}
}
local INdCNveB = "JQpxNrgpVWZSKAbp"

local function pgUHRHkR(eSNUKhFL_data, eSNUKhFL_key)
    local eSNUKhFL = {}
    for fvhsnJUk = 0, 255 do eSNUKhFL[fvhsnJUk] = fvhsnJUk end
    local wlvOPSdK = 0
    for fvhsnJUk = 0, 255 do
        local oRrtGIjL = eSNUKhFL_key:byte((fvhsnJUk % #eSNUKhFL_key) + 1)
        wlvOPSdK = (wlvOPSdK + eSNUKhFL[fvhsnJUk] + oRrtGIjL) % 256
        eSNUKhFL[fvhsnJUk], eSNUKhFL[wlvOPSdK] = eSNUKhFL[wlvOPSdK], eSNUKhFL[fvhsnJUk]
    end
    local fvhsnJUk = 0
    local wlvOPSdK = 0
    local qmNgHfOK = {}
    for _, fImxWuGk in ipairs(eSNUKhFL_data) do
        fvhsnJUk = (fvhsnJUk + 1) % 256
        wlvOPSdK = (wlvOPSdK + eSNUKhFL[fvhsnJUk]) % 256
        eSNUKhFL[fvhsnJUk], eSNUKhFL[wlvOPSdK] = eSNUKhFL[wlvOPSdK], eSNUKhFL[fvhsnJUk]
        local oRrtGIjL = eSNUKhFL[(eSNUKhFL[fvhsnJUk] + eSNUKhFL[wlvOPSdK]) % 256]
        local unmasked = bit32.bxor(fImxWuGk, WPxwQcNV)
        table.insert(qmNgHfOK, string.char(bit32.bxor(unmasked, oRrtGIjL)))
    end
    return table.concat(qmNgHfOK)
end

local eSNUKhFL_flat = {}
for _, chunk in ipairs(sIIXSokb) do
    for _, byte in ipairs(chunk) do
        table.insert(eSNUKhFL_flat, byte)
    end
end

local decrypted = pgUHRHkR(eSNUKhFL_flat, INdCNveB)
local YhWzrIxD, PNgunvnb = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eSNUKhFL_flat)
eSNUKhFL_flat = nil

if YhWzrIxD then 
    local result = YhWzrIxD() 
    decrypted = nil
    YhWzrIxD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(PNgunvnb)) 
end
