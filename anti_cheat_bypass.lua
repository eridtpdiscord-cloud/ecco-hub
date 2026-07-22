-- Protected Segment (anti_cheat_bypass)
local LHwedKRm = 169
local iJlNJeIQ = {
{23,249,146,62,160,71,13,113,106,198,86,198,36,226,242,165,125,68,108,173,139,61,12,34,169,143,172,196,149,22,156,251,191,10,176,205,32,243,98,28,205,132,142,170,199,22,145,47,210,212,182,102,97,163,8,7,182,106,166,212},{141,253,10,50,173,134,116,83,140,204,105,37,178,75,112,189,152,18,106,176,240,109,51,71,150,112,142,144,48,95,115,75,244,196,193,244,206,61,215,141,56,226,121,193,155,66,58,233,83,13,73,220,235,195,22,99,89,239,108,5},{48,101,207,224,31,58,58,85,34,157,247,74,136,180,231,216,220,91,149,175,124,49,169,5,111,241,62,25,248}
}
local drFCMrJg = "NzqlzWLALaFKyhAa"

local function yBcsNQxW(FkjRBkYL_data, FkjRBkYL_key)
    local FkjRBkYL = {}
    for PCZJBQDC = 0, 255 do FkjRBkYL[PCZJBQDC] = PCZJBQDC end
    local fNhamgWY = 0
    for PCZJBQDC = 0, 255 do
        local SvKyZhmS = FkjRBkYL_key:byte((PCZJBQDC % #FkjRBkYL_key) + 1)
        fNhamgWY = (fNhamgWY + FkjRBkYL[PCZJBQDC] + SvKyZhmS) % 256
        FkjRBkYL[PCZJBQDC], FkjRBkYL[fNhamgWY] = FkjRBkYL[fNhamgWY], FkjRBkYL[PCZJBQDC]
    end
    local PCZJBQDC = 0
    local fNhamgWY = 0
    local tuosVfVQ = {}
    for _, zZWmnjjB in ipairs(FkjRBkYL_data) do
        PCZJBQDC = (PCZJBQDC + 1) % 256
        fNhamgWY = (fNhamgWY + FkjRBkYL[PCZJBQDC]) % 256
        FkjRBkYL[PCZJBQDC], FkjRBkYL[fNhamgWY] = FkjRBkYL[fNhamgWY], FkjRBkYL[PCZJBQDC]
        local SvKyZhmS = FkjRBkYL[(FkjRBkYL[PCZJBQDC] + FkjRBkYL[fNhamgWY]) % 256]
        local unmasked = bit32.bxor(zZWmnjjB, LHwedKRm)
        table.insert(tuosVfVQ, string.char(bit32.bxor(unmasked, SvKyZhmS)))
    end
    return table.concat(tuosVfVQ)
end

local FkjRBkYL_flat = {}
for _, chunk in ipairs(iJlNJeIQ) do
    for _, byte in ipairs(chunk) do
        table.insert(FkjRBkYL_flat, byte)
    end
end

local decrypted = yBcsNQxW(FkjRBkYL_flat, drFCMrJg)
local cQVTpSon, UUVkRNEt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(FkjRBkYL_flat)
FkjRBkYL_flat = nil

if cQVTpSon then 
    local result = cQVTpSon() 
    decrypted = nil
    cQVTpSon = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(UUVkRNEt)) 
end
