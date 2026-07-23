-- Protected Segment (teleport_handler)
local LSeevIPf = 31
local ryDSzTkN = {
{74,180,117,2,138,188,95,173,139,3,25,250,104,5,90,33,56,95,89,132,75,148,170,30,25,156,172,6,248,36,80,157,134,166,100,222,245,249,117,72,26,140,29,57,244,10,197,13,193,31,6,184,70,156,235,54,46,32,34,120},{67,58,188,249,214,213,6,40,18,205,195,230,155,1,231,205,161,79,171,58,109,193,61,207,187,55,164,54,228,142,109,159,15,7,201,181,5,6,254,212,25,43,166,117,218,83,6,50,32,211,231,206,31,254,123,117,37,166,81,66},{77,78,156,242,153,68,12,129,138,158,228,19,18,170,95,55,78,126,12,42,219,1,248,174,209,240,97,251}
}
local MslbhlSU = "GBaxCDihSsMJvZFx"

local function kyNYRXje(jBnEMswR_data, jBnEMswR_key)
    if type(jBnEMswR_key) ~= "string" or #jBnEMswR_key == 0 then return "" end
    local jBnEMswR = {}
    for xvILkqSM = 0, 255 do jBnEMswR[xvILkqSM] = xvILkqSM end
    local uCHKEJJF = 0
    for xvILkqSM = 0, 255 do
        local VtLJxZFo = jBnEMswR_key:byte((xvILkqSM % #jBnEMswR_key) + 1)
        uCHKEJJF = (uCHKEJJF + jBnEMswR[xvILkqSM] + VtLJxZFo) % 256
        jBnEMswR[xvILkqSM], jBnEMswR[uCHKEJJF] = jBnEMswR[uCHKEJJF], jBnEMswR[xvILkqSM]
    end
    local xvILkqSM = 0
    local uCHKEJJF = 0
    local zyVOWpwd = {}
    for _, wFcEADLJ in ipairs(jBnEMswR_data) do
        xvILkqSM = (xvILkqSM + 1) % 256
        uCHKEJJF = (uCHKEJJF + jBnEMswR[xvILkqSM]) % 256
        jBnEMswR[xvILkqSM], jBnEMswR[uCHKEJJF] = jBnEMswR[uCHKEJJF], jBnEMswR[xvILkqSM]
        local VtLJxZFo = jBnEMswR[(jBnEMswR[xvILkqSM] + jBnEMswR[uCHKEJJF]) % 256]
        local unmasked = bit32.bxor(wFcEADLJ, LSeevIPf)
        table.insert(zyVOWpwd, string.char(bit32.bxor(unmasked, VtLJxZFo)))
    end
    return table.concat(zyVOWpwd)
end

local jBnEMswR_flat = {}
for _, chunk in ipairs(ryDSzTkN) do
    for _, byte in ipairs(chunk) do
        table.insert(jBnEMswR_flat, byte)
    end
end

local decrypted = kyNYRXje(jBnEMswR_flat, MslbhlSU)
local SnLoBtnE, JrbUFQVI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(jBnEMswR_flat)
jBnEMswR_flat = nil

if SnLoBtnE then 
    local result = SnLoBtnE() 
    decrypted = nil
    SnLoBtnE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(JrbUFQVI)) 
end
