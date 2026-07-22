-- Protected Segment (teleport_handler)
local cRQlOPOL = 250
local rMQpRaEw = {
{194,29,64,177,53,210,150,100,251,122,147,170,162,153,76,60,16,90,237,27,93,255,129,55,86,5,120,144,184,213,11,12,214,201,205,7,38,70,132,222,127,137,69,18,44,14,40,221,52,247,149,140,125,184,60,32,139,4,233,126},{246,235,182,69,178,8,187,211,247,155,254,38,139,253,180,102,26,96,241,250,251,58,17,65,252,137,72,132,196,250,255,244,28,7,130,149,207,83,219,114,44,122,78,246,123,201,120,138,74,110,203,205,15,36,110,22,87,172,124,220},{81,187,71,2,225,22,9,152,59,202,89,130,209,159,96,187,90,21,6,214,102,216,78,4,231,221,11,218}
}
local CcSVTDlP = "kDfrpEVcQxsxRuzM"

local function sQUWYyNw(uknLqHHb_data, uknLqHHb_key)
    local uknLqHHb = {}
    for gvLHbRPq = 0, 255 do uknLqHHb[gvLHbRPq] = gvLHbRPq end
    local MJhHkkVB = 0
    for gvLHbRPq = 0, 255 do
        local oNHLQoPC = uknLqHHb_key:byte((gvLHbRPq % #uknLqHHb_key) + 1)
        MJhHkkVB = (MJhHkkVB + uknLqHHb[gvLHbRPq] + oNHLQoPC) % 256
        uknLqHHb[gvLHbRPq], uknLqHHb[MJhHkkVB] = uknLqHHb[MJhHkkVB], uknLqHHb[gvLHbRPq]
    end
    local gvLHbRPq = 0
    local MJhHkkVB = 0
    local pdsUEkjp = {}
    for _, kvLPOtJL in ipairs(uknLqHHb_data) do
        gvLHbRPq = (gvLHbRPq + 1) % 256
        MJhHkkVB = (MJhHkkVB + uknLqHHb[gvLHbRPq]) % 256
        uknLqHHb[gvLHbRPq], uknLqHHb[MJhHkkVB] = uknLqHHb[MJhHkkVB], uknLqHHb[gvLHbRPq]
        local oNHLQoPC = uknLqHHb[(uknLqHHb[gvLHbRPq] + uknLqHHb[MJhHkkVB]) % 256]
        local unmasked = bit32.bxor(kvLPOtJL, cRQlOPOL)
        table.insert(pdsUEkjp, string.char(bit32.bxor(unmasked, oNHLQoPC)))
    end
    return table.concat(pdsUEkjp)
end

local uknLqHHb_flat = {}
for _, chunk in ipairs(rMQpRaEw) do
    for _, byte in ipairs(chunk) do
        table.insert(uknLqHHb_flat, byte)
    end
end

local decrypted = sQUWYyNw(uknLqHHb_flat, CcSVTDlP)
local KIGKJBPB, kZsvslih = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(uknLqHHb_flat)
uknLqHHb_flat = nil

if KIGKJBPB then 
    local result = KIGKJBPB() 
    decrypted = nil
    KIGKJBPB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(kZsvslih)) 
end
