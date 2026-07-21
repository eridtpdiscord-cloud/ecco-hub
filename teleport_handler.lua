-- Compiled secure segment
local VKFJpKzf = {
{57,148,80,112,51,89,209,208,134,204,238,202,88,115,241,15,36,43,81,88,190,51,159,228,17,221,197,20,178,67,198,95,137,219,182,140,250,7,158,218,3,211,206,109,184,133,50,242,24,89,234,137,117,146,2,59,113,87,207,20},{17,30,6,107,132,32,75,185,11,128,59,251,231,181,252,129,19,165,157,159,176,131,218,112,179,214,117,132,107,88,108,70,246,64,244,189,85,198,46,1,115,86,127,254,125,6,182,252,148,94,18,182,58,123,211,32,49,159,22,179},{188,38,18,138,64,46,12,112,200,29,71,114,121,15,183,7,57,4,250,15,97,94,146,208,191,3,220,73}
}
local VdRjiTJp = "QTefABCycimgdltA"

local function KLcKjNwl(EpNsVAFl_data, EpNsVAFl_key)
    local EpNsVAFl = {}
    for xbKSSBxT = 0, 255 do EpNsVAFl[xbKSSBxT] = xbKSSBxT end
    local xJQQisRv = 0
    for xbKSSBxT = 0, 255 do
        local TYEgakQH = EpNsVAFl_key:byte((xbKSSBxT % #EpNsVAFl_key) + 1)
        xJQQisRv = (xJQQisRv + EpNsVAFl[xbKSSBxT] + TYEgakQH) % 256
        EpNsVAFl[xbKSSBxT], EpNsVAFl[xJQQisRv] = EpNsVAFl[xJQQisRv], EpNsVAFl[xbKSSBxT]
    end
    local xbKSSBxT = 0
    local xJQQisRv = 0
    local IyqSbpad = {}
    for _, hVaxaqYd in ipairs(EpNsVAFl_data) do
        xbKSSBxT = (xbKSSBxT + 1) % 256
        xJQQisRv = (xJQQisRv + EpNsVAFl[xbKSSBxT]) % 256
        EpNsVAFl[xbKSSBxT], EpNsVAFl[xJQQisRv] = EpNsVAFl[xJQQisRv], EpNsVAFl[xbKSSBxT]
        local TYEgakQH = EpNsVAFl[(EpNsVAFl[xbKSSBxT] + EpNsVAFl[xJQQisRv]) % 256]
        table.insert(IyqSbpad, string.char(bit32.bxor(hVaxaqYd, TYEgakQH)))
    end
    return table.concat(IyqSbpad)
end

local EpNsVAFl_flat = {}
for _, chunk in ipairs(VKFJpKzf) do
    for _, byte in ipairs(chunk) do
        table.insert(EpNsVAFl_flat, byte)
    end
end

local decrypted = KLcKjNwl(EpNsVAFl_flat, VdRjiTJp)
local jWhAMNtd, QYzBXhcx = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(EpNsVAFl_flat)
EpNsVAFl_flat = nil

if jWhAMNtd then 
    local result = jWhAMNtd() 
    decrypted = nil
    jWhAMNtd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(QYzBXhcx)) 
end
