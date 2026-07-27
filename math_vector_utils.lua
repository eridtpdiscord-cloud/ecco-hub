-- Protected Segment (math_vector_utils)
local BeUCyToh = 240
local rvpAVOnn = {
{116,27,162,165,188,55,37,194,69,216,35,68,27,134,158,98,58,119,30,99,108,135,209,23,3,6,45,168,232,61,99,184,247,42,196,81,152,117,99,159,130,7,44,217,50,130,63,95,184,247,194,1,218,148,24,195,176,169,151,178},{228,228,53,179,235,84,75,104,234,99,62,183,67,215,24,3,62,134,112,217,165,189,12,230,107,47,94,69,50,197,118,44,87,215,0,171,109,120,193,235,203,37,71,181,4,72,17,139,73,61,34,70,71,81,162,211,161,133,157,65},{55,29,165,25,179,144,250,16,175,188,205,48,51,216,94,192,69,162,90,39,151,121,134,185,230,176,177,151,60}
}
local HaVQVypa = "WcMUCsKylCVAVilj"

local function MOhvowvu(KOAmtoSg_data, KOAmtoSg_key)
    if type(KOAmtoSg_key) ~= "string" or #KOAmtoSg_key == 0 then return "" end
    local KOAmtoSg = {}
    for hCqiVbKx = 0, 255 do KOAmtoSg[hCqiVbKx] = hCqiVbKx end
    local NFEAqodM = 0
    for hCqiVbKx = 0, 255 do
        local sUOoIwFP = KOAmtoSg_key:byte((hCqiVbKx % #KOAmtoSg_key) + 1)
        NFEAqodM = (NFEAqodM + KOAmtoSg[hCqiVbKx] + sUOoIwFP) % 256
        KOAmtoSg[hCqiVbKx], KOAmtoSg[NFEAqodM] = KOAmtoSg[NFEAqodM], KOAmtoSg[hCqiVbKx]
    end
    local hCqiVbKx = 0
    local NFEAqodM = 0
    local ICLTBrZp = {}
    for _, zuUNEUnQ in ipairs(KOAmtoSg_data) do
        hCqiVbKx = (hCqiVbKx + 1) % 256
        NFEAqodM = (NFEAqodM + KOAmtoSg[hCqiVbKx]) % 256
        KOAmtoSg[hCqiVbKx], KOAmtoSg[NFEAqodM] = KOAmtoSg[NFEAqodM], KOAmtoSg[hCqiVbKx]
        local sUOoIwFP = KOAmtoSg[(KOAmtoSg[hCqiVbKx] + KOAmtoSg[NFEAqodM]) % 256]
        local unmasked = bit32.bxor(zuUNEUnQ, BeUCyToh)
        table.insert(ICLTBrZp, string.char(bit32.bxor(unmasked, sUOoIwFP)))
    end
    return table.concat(ICLTBrZp)
end

local KOAmtoSg_flat = {}
for _, chunk in ipairs(rvpAVOnn) do
    for _, byte in ipairs(chunk) do
        table.insert(KOAmtoSg_flat, byte)
    end
end

local decrypted = MOhvowvu(KOAmtoSg_flat, HaVQVypa)
local amZImSTA, IaVjAFDb = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(KOAmtoSg_flat)
KOAmtoSg_flat = nil

if amZImSTA then 
    local result = amZImSTA() 
    decrypted = nil
    amZImSTA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(IaVjAFDb)) 
end
