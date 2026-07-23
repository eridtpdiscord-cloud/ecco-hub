-- Protected Segment (anti_cheat_bypass)
local npMcbEjl = 149
local IdvcDXVn = {
{15,46,234,249,237,62,35,88,17,79,244,98,34,115,135,77,244,191,227,209,75,126,106,171,42,98,225,183,2,233,54,198,254,212,86,159,141,231,9,106,81,170,140,181,239,106,209,51,217,10,181,182,185,228,204,20,43,228,176,234},{196,247,1,139,88,154,209,43,237,127,142,49,197,96,12,200,185,25,211,117,47,36,80,156,50,90,142,111,159,104,235,89,227,227,5,31,90,169,244,15,180,156,4,189,99,67,181,147,59,159,205,61,172,66,207,0,165,140,214,246},{217,123,190,137,121,110,116,190,142,162,34,222,88,81,184,21,204,244,90,64,100,250,241,129,14,228,56,104,123}
}
local bUQStxzA = "YdsgFptWFvXGbSpP"

local function TmvuUSVA(CsavAKOu_data, CsavAKOu_key)
    if type(CsavAKOu_key) ~= "string" or #CsavAKOu_key == 0 then return "" end
    local CsavAKOu = {}
    for PLAKlFJC = 0, 255 do CsavAKOu[PLAKlFJC] = PLAKlFJC end
    local WQBEPbNI = 0
    for PLAKlFJC = 0, 255 do
        local cOEIhcjU = CsavAKOu_key:byte((PLAKlFJC % #CsavAKOu_key) + 1)
        WQBEPbNI = (WQBEPbNI + CsavAKOu[PLAKlFJC] + cOEIhcjU) % 256
        CsavAKOu[PLAKlFJC], CsavAKOu[WQBEPbNI] = CsavAKOu[WQBEPbNI], CsavAKOu[PLAKlFJC]
    end
    local PLAKlFJC = 0
    local WQBEPbNI = 0
    local ulDixlmI = {}
    for _, fmKQCrah in ipairs(CsavAKOu_data) do
        PLAKlFJC = (PLAKlFJC + 1) % 256
        WQBEPbNI = (WQBEPbNI + CsavAKOu[PLAKlFJC]) % 256
        CsavAKOu[PLAKlFJC], CsavAKOu[WQBEPbNI] = CsavAKOu[WQBEPbNI], CsavAKOu[PLAKlFJC]
        local cOEIhcjU = CsavAKOu[(CsavAKOu[PLAKlFJC] + CsavAKOu[WQBEPbNI]) % 256]
        local unmasked = bit32.bxor(fmKQCrah, npMcbEjl)
        table.insert(ulDixlmI, string.char(bit32.bxor(unmasked, cOEIhcjU)))
    end
    return table.concat(ulDixlmI)
end

local CsavAKOu_flat = {}
for _, chunk in ipairs(IdvcDXVn) do
    for _, byte in ipairs(chunk) do
        table.insert(CsavAKOu_flat, byte)
    end
end

local decrypted = TmvuUSVA(CsavAKOu_flat, bUQStxzA)
local mHKJBSlD, xobfJrvd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CsavAKOu_flat)
CsavAKOu_flat = nil

if mHKJBSlD then 
    local result = mHKJBSlD() 
    decrypted = nil
    mHKJBSlD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(xobfJrvd)) 
end
