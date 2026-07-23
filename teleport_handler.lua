-- Protected Segment (teleport_handler)
local DLvqcTPQ = 204
local vBUwCxdm = {
{116,124,232,94,102,107,186,126,13,23,19,52,36,22,174,54,217,228,225,66,253,191,67,235,79,113,183,13,180,72,25,224,159,82,67,115,113,199,225,52,244,153,160,36,130,189,78,197,55,121,160,62,133,83,159,60,130,252,224,29},{246,93,181,249,198,165,146,178,212,95,56,169,164,208,187,152,58,219,119,244,39,59,180,178,150,163,119,185,156,191,68,233,31,74,17,195,16,170,215,32,69,34,225,194,38,34,205,221,230,37,173,227,101,40,39,103,161,34,247,114},{160,3,101,99,22,47,87,209,178,193,196,114,160,183,177,185,159,33,35,85,53,81,134,9,228,202,208,134}
}
local jFOXiBJv = "WlhNgIQsameoOvYt"

local function BFDMGgNr(wqUwQkmq_data, wqUwQkmq_key)
    if type(wqUwQkmq_key) ~= "string" or #wqUwQkmq_key == 0 then return "" end
    local wqUwQkmq = {}
    for kqdBZBiV = 0, 255 do wqUwQkmq[kqdBZBiV] = kqdBZBiV end
    local jYTNFrRU = 0
    for kqdBZBiV = 0, 255 do
        local KaaPAxbB = wqUwQkmq_key:byte((kqdBZBiV % #wqUwQkmq_key) + 1)
        jYTNFrRU = (jYTNFrRU + wqUwQkmq[kqdBZBiV] + KaaPAxbB) % 256
        wqUwQkmq[kqdBZBiV], wqUwQkmq[jYTNFrRU] = wqUwQkmq[jYTNFrRU], wqUwQkmq[kqdBZBiV]
    end
    local kqdBZBiV = 0
    local jYTNFrRU = 0
    local qshMcuOu = {}
    for _, AEATrSrh in ipairs(wqUwQkmq_data) do
        kqdBZBiV = (kqdBZBiV + 1) % 256
        jYTNFrRU = (jYTNFrRU + wqUwQkmq[kqdBZBiV]) % 256
        wqUwQkmq[kqdBZBiV], wqUwQkmq[jYTNFrRU] = wqUwQkmq[jYTNFrRU], wqUwQkmq[kqdBZBiV]
        local KaaPAxbB = wqUwQkmq[(wqUwQkmq[kqdBZBiV] + wqUwQkmq[jYTNFrRU]) % 256]
        local unmasked = bit32.bxor(AEATrSrh, DLvqcTPQ)
        table.insert(qshMcuOu, string.char(bit32.bxor(unmasked, KaaPAxbB)))
    end
    return table.concat(qshMcuOu)
end

local wqUwQkmq_flat = {}
for _, chunk in ipairs(vBUwCxdm) do
    for _, byte in ipairs(chunk) do
        table.insert(wqUwQkmq_flat, byte)
    end
end

local decrypted = BFDMGgNr(wqUwQkmq_flat, jFOXiBJv)
local jXFGkKIg, kVabhufj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(wqUwQkmq_flat)
wqUwQkmq_flat = nil

if jXFGkKIg then 
    local result = jXFGkKIg() 
    decrypted = nil
    jXFGkKIg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(kVabhufj)) 
end
