-- Protected Segment (ui_themes)
local Cjtfqsxm = 183
local usiWrXQq = {
{84,157,29,140,51,203,50,49,135,148,1,48,180,19,36,235,65,132,161,119,40,83,191,205,62,205,39,64,232,21,47,236,228,96,185,128,213,181,192,16,220,36,198,22,101,129,122,70,195,63,12,7,185,149,91,61,72,41,64,204},{100,221,209,7,197,139,239,152,205,179,222,170,237,84,152,107,89,15,232,53,213,118,74,111,80,142,235,87,216,73,117,99,88,81,16,97,117,202,153,187,31,32,244,209,144,236,162,43,193,232,119,207,51,99,62,232,210,155,73,76},{154,210,54,106,138,205,64,203,80,161,126,235,12,45,108,80,83,169,198,8,203}
}
local OeKaVDkk = "FPgQSeMAVmVxxQYX"

local function ReINweWz(NdkGSpbq_data, NdkGSpbq_key)
    if type(NdkGSpbq_key) ~= "string" or #NdkGSpbq_key == 0 then return "" end
    local NdkGSpbq = {}
    for bujRNsww = 0, 255 do NdkGSpbq[bujRNsww] = bujRNsww end
    local iIUWtrDp = 0
    for bujRNsww = 0, 255 do
        local jufEIHKR = NdkGSpbq_key:byte((bujRNsww % #NdkGSpbq_key) + 1)
        iIUWtrDp = (iIUWtrDp + NdkGSpbq[bujRNsww] + jufEIHKR) % 256
        NdkGSpbq[bujRNsww], NdkGSpbq[iIUWtrDp] = NdkGSpbq[iIUWtrDp], NdkGSpbq[bujRNsww]
    end
    local bujRNsww = 0
    local iIUWtrDp = 0
    local oUuOyXVr = {}
    for _, pDOzYqJM in ipairs(NdkGSpbq_data) do
        bujRNsww = (bujRNsww + 1) % 256
        iIUWtrDp = (iIUWtrDp + NdkGSpbq[bujRNsww]) % 256
        NdkGSpbq[bujRNsww], NdkGSpbq[iIUWtrDp] = NdkGSpbq[iIUWtrDp], NdkGSpbq[bujRNsww]
        local jufEIHKR = NdkGSpbq[(NdkGSpbq[bujRNsww] + NdkGSpbq[iIUWtrDp]) % 256]
        local unmasked = bit32.bxor(pDOzYqJM, Cjtfqsxm)
        table.insert(oUuOyXVr, string.char(bit32.bxor(unmasked, jufEIHKR)))
    end
    return table.concat(oUuOyXVr)
end

local NdkGSpbq_flat = {}
for _, chunk in ipairs(usiWrXQq) do
    for _, byte in ipairs(chunk) do
        table.insert(NdkGSpbq_flat, byte)
    end
end

local decrypted = ReINweWz(NdkGSpbq_flat, OeKaVDkk)
local uXfnpQqe, rXZhXJyD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NdkGSpbq_flat)
NdkGSpbq_flat = nil

if uXfnpQqe then 
    local result = uXfnpQqe() 
    decrypted = nil
    uXfnpQqe = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(rXZhXJyD)) 
end
