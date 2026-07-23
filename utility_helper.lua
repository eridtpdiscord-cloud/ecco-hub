-- Protected Segment (utility_helper)
local yrEIEEsk = 236
local zfccmfix = {
{205,12,9,68,207,6,78,7,75,8,26,131,57,80,69,97,3,1,38,170,0,145,18,114,90,228,191,118,138,97,171,126,81,157,180,196,192,173,11,156,3,46,6,177,1,139,195,161,247,160,140,151,156,74,60,26,131,9,113,230},{44,55,78,246,60,104,124,42,122,19,196,129,121,15,147,228,117,213,14,40,50,156,248,7,208,227,189,4,148,210,236,5,226,219,180,213,244,157,192,58,85,26,65,52,244,0,18,198,118,253,165,221,199,226,193,138,209,75,217,246},{21,196,48,182,3,133,87,233,249,27,165,14,35,159,128,66,69,199,221,228,113,109,219,243,240,137}
}
local FVYGXfDd = "XprpLbwKJpfgJLtr"

local function xrJgvACO(rEXtjCRP_data, rEXtjCRP_key)
    if type(rEXtjCRP_key) ~= "string" or #rEXtjCRP_key == 0 then return "" end
    local rEXtjCRP = {}
    for NYveMShp = 0, 255 do rEXtjCRP[NYveMShp] = NYveMShp end
    local pWbnegFL = 0
    for NYveMShp = 0, 255 do
        local qsCuOwJP = rEXtjCRP_key:byte((NYveMShp % #rEXtjCRP_key) + 1)
        pWbnegFL = (pWbnegFL + rEXtjCRP[NYveMShp] + qsCuOwJP) % 256
        rEXtjCRP[NYveMShp], rEXtjCRP[pWbnegFL] = rEXtjCRP[pWbnegFL], rEXtjCRP[NYveMShp]
    end
    local NYveMShp = 0
    local pWbnegFL = 0
    local OdmvJWaM = {}
    for _, AAWPUcst in ipairs(rEXtjCRP_data) do
        NYveMShp = (NYveMShp + 1) % 256
        pWbnegFL = (pWbnegFL + rEXtjCRP[NYveMShp]) % 256
        rEXtjCRP[NYveMShp], rEXtjCRP[pWbnegFL] = rEXtjCRP[pWbnegFL], rEXtjCRP[NYveMShp]
        local qsCuOwJP = rEXtjCRP[(rEXtjCRP[NYveMShp] + rEXtjCRP[pWbnegFL]) % 256]
        local unmasked = bit32.bxor(AAWPUcst, yrEIEEsk)
        table.insert(OdmvJWaM, string.char(bit32.bxor(unmasked, qsCuOwJP)))
    end
    return table.concat(OdmvJWaM)
end

local rEXtjCRP_flat = {}
for _, chunk in ipairs(zfccmfix) do
    for _, byte in ipairs(chunk) do
        table.insert(rEXtjCRP_flat, byte)
    end
end

local decrypted = xrJgvACO(rEXtjCRP_flat, FVYGXfDd)
local AbgevEaG, eTYQWylh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(rEXtjCRP_flat)
rEXtjCRP_flat = nil

if AbgevEaG then 
    local result = AbgevEaG() 
    decrypted = nil
    AbgevEaG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(eTYQWylh)) 
end
