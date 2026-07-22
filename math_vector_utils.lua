-- Protected Segment (math_vector_utils)
local casysfsV = 197
local pwMyZlTk = {
{33,77,173,120,175,149,180,156,164,215,50,13,166,218,160,161,255,56,229,24,208,94,230,212,100,204,164,23,239,212,85,161,167,33,174,171,146,223,202,103,196,186,232,3,24,98,50,106,42,44,87,156,97,250,0,30,211,207,154,143},{195,157,181,184,154,232,42,188,174,202,3,64,67,79,196,205,139,91,47,247,6,194,45,184,119,177,137,240,89,245,175,144,248,142,52,130,116,175,55,50,135,117,181,86,73,72,131,124,145,184,113,226,142,6,29,132,95,202,183,112},{187,31,83,232,202,25,19,116,148,37,117,177,125,113,244,167,68,113,173,60,86,72,219,167,122,137,232,233,119}
}
local pGPNIwcH = "mtDguYRHolgwOtEN"

local function yklFwQCS(CnvkqAwu_data, CnvkqAwu_key)
    local CnvkqAwu = {}
    for DwunFwDA = 0, 255 do CnvkqAwu[DwunFwDA] = DwunFwDA end
    local tjnANsJm = 0
    for DwunFwDA = 0, 255 do
        local vzBuqgGK = CnvkqAwu_key:byte((DwunFwDA % #CnvkqAwu_key) + 1)
        tjnANsJm = (tjnANsJm + CnvkqAwu[DwunFwDA] + vzBuqgGK) % 256
        CnvkqAwu[DwunFwDA], CnvkqAwu[tjnANsJm] = CnvkqAwu[tjnANsJm], CnvkqAwu[DwunFwDA]
    end
    local DwunFwDA = 0
    local tjnANsJm = 0
    local OnLzDFnI = {}
    for _, OhdSDLWj in ipairs(CnvkqAwu_data) do
        DwunFwDA = (DwunFwDA + 1) % 256
        tjnANsJm = (tjnANsJm + CnvkqAwu[DwunFwDA]) % 256
        CnvkqAwu[DwunFwDA], CnvkqAwu[tjnANsJm] = CnvkqAwu[tjnANsJm], CnvkqAwu[DwunFwDA]
        local vzBuqgGK = CnvkqAwu[(CnvkqAwu[DwunFwDA] + CnvkqAwu[tjnANsJm]) % 256]
        local unmasked = bit32.bxor(OhdSDLWj, casysfsV)
        table.insert(OnLzDFnI, string.char(bit32.bxor(unmasked, vzBuqgGK)))
    end
    return table.concat(OnLzDFnI)
end

local CnvkqAwu_flat = {}
for _, chunk in ipairs(pwMyZlTk) do
    for _, byte in ipairs(chunk) do
        table.insert(CnvkqAwu_flat, byte)
    end
end

local decrypted = yklFwQCS(CnvkqAwu_flat, pGPNIwcH)
local QBPtkZnO, OVSKjsXy = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CnvkqAwu_flat)
CnvkqAwu_flat = nil

if QBPtkZnO then 
    local result = QBPtkZnO() 
    decrypted = nil
    QBPtkZnO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(OVSKjsXy)) 
end
