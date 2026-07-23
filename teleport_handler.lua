-- Protected Segment (teleport_handler)
local kWiuMQVT = 2
local FcgWAEsc = {
{117,188,153,86,117,28,21,162,145,136,154,218,207,0,0,151,62,162,253,39,82,169,127,96,161,2,6,170,88,48,154,113,205,179,194,61,131,59,227,117,123,241,177,187,157,104,232,166,99,169,28,28,163,220,78,66,109,174,113,68},{104,14,180,140,72,136,150,66,52,221,57,10,192,72,224,90,2,39,118,147,72,153,157,222,252,20,154,104,75,4,155,164,110,99,130,223,47,199,248,148,116,126,93,116,158,153,248,100,166,33,87,137,150,93,44,173,165,143,187,161},{43,251,141,125,198,129,249,155,209,175,237,163,7,164,242,7,152,168,22,4,26,207,244,59,127,134,37,94}
}
local qimmykEO = "ggbldmDALjAPDLuK"

local function kceXJvnT(NMwDCPip_data, NMwDCPip_key)
    if type(NMwDCPip_key) ~= "string" or #NMwDCPip_key == 0 then return "" end
    local NMwDCPip = {}
    for pPFgkPzT = 0, 255 do NMwDCPip[pPFgkPzT] = pPFgkPzT end
    local MISQKnwp = 0
    for pPFgkPzT = 0, 255 do
        local vJsmBuff = NMwDCPip_key:byte((pPFgkPzT % #NMwDCPip_key) + 1)
        MISQKnwp = (MISQKnwp + NMwDCPip[pPFgkPzT] + vJsmBuff) % 256
        NMwDCPip[pPFgkPzT], NMwDCPip[MISQKnwp] = NMwDCPip[MISQKnwp], NMwDCPip[pPFgkPzT]
    end
    local pPFgkPzT = 0
    local MISQKnwp = 0
    local bOwFYDCu = {}
    for _, ErLwEfWJ in ipairs(NMwDCPip_data) do
        pPFgkPzT = (pPFgkPzT + 1) % 256
        MISQKnwp = (MISQKnwp + NMwDCPip[pPFgkPzT]) % 256
        NMwDCPip[pPFgkPzT], NMwDCPip[MISQKnwp] = NMwDCPip[MISQKnwp], NMwDCPip[pPFgkPzT]
        local vJsmBuff = NMwDCPip[(NMwDCPip[pPFgkPzT] + NMwDCPip[MISQKnwp]) % 256]
        local unmasked = bit32.bxor(ErLwEfWJ, kWiuMQVT)
        table.insert(bOwFYDCu, string.char(bit32.bxor(unmasked, vJsmBuff)))
    end
    return table.concat(bOwFYDCu)
end

local NMwDCPip_flat = {}
for _, chunk in ipairs(FcgWAEsc) do
    for _, byte in ipairs(chunk) do
        table.insert(NMwDCPip_flat, byte)
    end
end

local decrypted = kceXJvnT(NMwDCPip_flat, qimmykEO)
local KfrcNTAV, BKtVEOiz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NMwDCPip_flat)
NMwDCPip_flat = nil

if KfrcNTAV then 
    local result = KfrcNTAV() 
    decrypted = nil
    KfrcNTAV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(BKtVEOiz)) 
end
