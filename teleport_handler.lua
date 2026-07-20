-- Compiled secure segment
local SCPFQitS = {
{161,57,39,184,232,225,65,194,59,107,81,252,3,10,51,56,78,203,145,83,170,202,77,252,24,62,0,253,134,69,21,159,3,57,24,99,189,164,98,106,74,55,224,68,55,21,186,160,47,104,105,134,4,216,153,88,59,56,211,35},{15,172,105,233,8,122,183,113,66,180,17,122,57,92,191,185,149,1,50,250,138,235,170,69,108,8,91,220,107,155,244,134,234,39,224,58,65,134,99,12,197,38,226,112,8,210,149,221,107,90,252,12,189,201,207,38,113,233,205,0},{152,235,34,240,67,140,175,222,118,200,0,89,229,253,249,120,128,116,252,65,161,113,246,140,81,68,211,9}
}
local MkvvHchH = "DCczxOaxWJQjaAEZ"

local function UldBDkBN(EdjeZZpC_data, EdjeZZpC_key)
    local EdjeZZpC = {}
    for yJdtinmi = 0, 255 do EdjeZZpC[yJdtinmi] = yJdtinmi end
    local tfFZtDIs = 0
    for yJdtinmi = 0, 255 do
        local bcSRSoQj = EdjeZZpC_key:byte((yJdtinmi % #EdjeZZpC_key) + 1)
        tfFZtDIs = (tfFZtDIs + EdjeZZpC[yJdtinmi] + bcSRSoQj) % 256
        EdjeZZpC[yJdtinmi], EdjeZZpC[tfFZtDIs] = EdjeZZpC[tfFZtDIs], EdjeZZpC[yJdtinmi]
    end
    local yJdtinmi = 0
    local tfFZtDIs = 0
    local SUybcPVV = {}
    for _, JmNRfFkA in ipairs(EdjeZZpC_data) do
        yJdtinmi = (yJdtinmi + 1) % 256
        tfFZtDIs = (tfFZtDIs + EdjeZZpC[yJdtinmi]) % 256
        EdjeZZpC[yJdtinmi], EdjeZZpC[tfFZtDIs] = EdjeZZpC[tfFZtDIs], EdjeZZpC[yJdtinmi]
        local bcSRSoQj = EdjeZZpC[(EdjeZZpC[yJdtinmi] + EdjeZZpC[tfFZtDIs]) % 256]
        table.insert(SUybcPVV, string.char(bit32.bxor(JmNRfFkA, bcSRSoQj)))
    end
    return table.concat(SUybcPVV)
end

local EdjeZZpC_flat = {}
for _, chunk in ipairs(SCPFQitS) do
    for _, byte in ipairs(chunk) do
        table.insert(EdjeZZpC_flat, byte)
    end
end

local decrypted = UldBDkBN(EdjeZZpC_flat, MkvvHchH)
local OGuLUNii, oWfXMJdD = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(EdjeZZpC_flat)
EdjeZZpC_flat = nil

if OGuLUNii then 
    local result = OGuLUNii() 
    decrypted = nil
    OGuLUNii = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(oWfXMJdD)) 
end
