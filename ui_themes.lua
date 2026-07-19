-- Compiled secure segment
local eiDUDIJh = {
{13,98,132,51,21,189,240,142,46,39,71,211,188,124,82,9,49,78,204,240,154,142,184,255,36,211,47,70,60,140,179,92,159,200,98,111,191,15,165,55,144,250,248,107,60,2,132,96,60,79,155,32,147,55,103,247,13,4,76,3},{236,143,0,28,6,36,210,118,168,216,245,253,111,103,156,64,244,142,68,128,251,142,118,41,112,23,236,127,6,192,254,233,116,136,117,245,35,70,49,159,53,202,132,30,48,15,151,245,153,85,69,169,241,54,234,142,255,130,187,241},{139,153,47,117,154,72,78,108,4,6,48,99,123,216,214,142,173,70,249,160,140}
}
local VgrTqLrQ = "iNDZRVQtLNJSaLQS"

local function QFxWTrje(UBMJFMcj_data, UBMJFMcj_key)
    local UBMJFMcj = {}
    for aCUoUfZA = 0, 255 do UBMJFMcj[aCUoUfZA] = aCUoUfZA end
    local OjfbBcoo = 0
    for aCUoUfZA = 0, 255 do
        local dlxnPTVE = UBMJFMcj_key:byte((aCUoUfZA % #UBMJFMcj_key) + 1)
        OjfbBcoo = (OjfbBcoo + UBMJFMcj[aCUoUfZA] + dlxnPTVE) % 256
        UBMJFMcj[aCUoUfZA], UBMJFMcj[OjfbBcoo] = UBMJFMcj[OjfbBcoo], UBMJFMcj[aCUoUfZA]
    end
    local aCUoUfZA = 0
    local OjfbBcoo = 0
    local tfgHrHWQ = {}
    for _, sBovAflM in ipairs(UBMJFMcj_data) do
        aCUoUfZA = (aCUoUfZA + 1) % 256
        OjfbBcoo = (OjfbBcoo + UBMJFMcj[aCUoUfZA]) % 256
        UBMJFMcj[aCUoUfZA], UBMJFMcj[OjfbBcoo] = UBMJFMcj[OjfbBcoo], UBMJFMcj[aCUoUfZA]
        local dlxnPTVE = UBMJFMcj[(UBMJFMcj[aCUoUfZA] + UBMJFMcj[OjfbBcoo]) % 256]
        table.insert(tfgHrHWQ, string.char(bit32.bxor(sBovAflM, dlxnPTVE)))
    end
    return table.concat(tfgHrHWQ)
end

local UBMJFMcj_flat = {}
for _, chunk in ipairs(eiDUDIJh) do
    for _, byte in ipairs(chunk) do
        table.insert(UBMJFMcj_flat, byte)
    end
end

local decrypted = QFxWTrje(UBMJFMcj_flat, VgrTqLrQ)
local IjAlrayp, fEQKCYli = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(UBMJFMcj_flat)
UBMJFMcj_flat = nil

if IjAlrayp then 
    local result = IjAlrayp() 
    decrypted = nil
    IjAlrayp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(fEQKCYli)) 
end
