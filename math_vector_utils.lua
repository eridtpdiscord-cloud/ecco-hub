-- Protected Segment (math_vector_utils)
local tUvltENS = 233
local NfrIXWVj = {
{52,172,36,64,217,118,253,140,108,103,90,142,130,246,161,49,30,66,49,161,41,94,136,185,88,172,154,4,94,141,189,234,15,232,40,15,93,168,80,13,210,59,245,23,38,73,30,4,33,220,212,103,255,67,53,187,107,194,230,67},{47,74,135,23,49,195,90,178,99,59,191,44,252,119,121,88,79,40,212,19,165,59,35,204,174,139,20,190,36,57,186,203,83,55,210,78,29,108,94,229,98,3,133,241,229,10,171,202,54,250,218,231,154,136,111,220,27,169,220,21},{96,229,129,144,217,130,234,146,6,233,94,200,167,217,92,249,137,55,127,222,26,132,230,1,47,151,228,5,156}
}
local OiywHaYn = "BYTqeVkwJnixneYM"

local function eCPxnwjE(tIeeAeej_data, tIeeAeej_key)
    if type(tIeeAeej_key) ~= "string" or #tIeeAeej_key == 0 then return "" end
    local tIeeAeej = {}
    for dtSbtsTh = 0, 255 do tIeeAeej[dtSbtsTh] = dtSbtsTh end
    local fVEIbXrn = 0
    for dtSbtsTh = 0, 255 do
        local EjrLuwox = tIeeAeej_key:byte((dtSbtsTh % #tIeeAeej_key) + 1)
        fVEIbXrn = (fVEIbXrn + tIeeAeej[dtSbtsTh] + EjrLuwox) % 256
        tIeeAeej[dtSbtsTh], tIeeAeej[fVEIbXrn] = tIeeAeej[fVEIbXrn], tIeeAeej[dtSbtsTh]
    end
    local dtSbtsTh = 0
    local fVEIbXrn = 0
    local HdFvZCRm = {}
    for _, JONuzdhp in ipairs(tIeeAeej_data) do
        dtSbtsTh = (dtSbtsTh + 1) % 256
        fVEIbXrn = (fVEIbXrn + tIeeAeej[dtSbtsTh]) % 256
        tIeeAeej[dtSbtsTh], tIeeAeej[fVEIbXrn] = tIeeAeej[fVEIbXrn], tIeeAeej[dtSbtsTh]
        local EjrLuwox = tIeeAeej[(tIeeAeej[dtSbtsTh] + tIeeAeej[fVEIbXrn]) % 256]
        local unmasked = bit32.bxor(JONuzdhp, tUvltENS)
        table.insert(HdFvZCRm, string.char(bit32.bxor(unmasked, EjrLuwox)))
    end
    return table.concat(HdFvZCRm)
end

local tIeeAeej_flat = {}
for _, chunk in ipairs(NfrIXWVj) do
    for _, byte in ipairs(chunk) do
        table.insert(tIeeAeej_flat, byte)
    end
end

local decrypted = eCPxnwjE(tIeeAeej_flat, OiywHaYn)
local wpVqdEKL, LepEsmac = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(tIeeAeej_flat)
tIeeAeej_flat = nil

if wpVqdEKL then 
    local result = wpVqdEKL() 
    decrypted = nil
    wpVqdEKL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(LepEsmac)) 
end
