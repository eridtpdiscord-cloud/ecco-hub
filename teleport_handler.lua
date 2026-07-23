-- Protected Segment (teleport_handler)
local eNtTxExZ = 190
local yWOBGYxl = {
{76,131,168,228,82,27,183,50,235,247,226,173,137,251,228,100,115,171,216,211,69,235,2,16,157,30,177,145,83,109,28,129,231,238,19,240,88,115,217,186,33,203,124,3,207,209,141,194,37,186,126,89,61,56,43,189,95,227,97,160},{170,129,234,116,236,154,200,38,0,174,166,233,163,230,227,188,123,117,17,9,30,234,239,179,196,185,88,183,135,27,191,71,19,210,2,219,249,189,254,188,47,152,225,233,3,169,186,103,129,172,184,25,154,79,0,200,213,196,21,113},{174,106,126,114,63,109,80,61,165,164,61,150,100,185,215,197,139,168,163,232,52,106,9,193,86,223,105,16}
}
local YJBtBckU = "BTBjrYGcXAMbWMjj"

local function JgyJXhyM(WmNfNkqG_data, WmNfNkqG_key)
    if type(WmNfNkqG_key) ~= "string" or #WmNfNkqG_key == 0 then return "" end
    local WmNfNkqG = {}
    for uZBHbCGj = 0, 255 do WmNfNkqG[uZBHbCGj] = uZBHbCGj end
    local ythMHURJ = 0
    for uZBHbCGj = 0, 255 do
        local dEdWWuSI = WmNfNkqG_key:byte((uZBHbCGj % #WmNfNkqG_key) + 1)
        ythMHURJ = (ythMHURJ + WmNfNkqG[uZBHbCGj] + dEdWWuSI) % 256
        WmNfNkqG[uZBHbCGj], WmNfNkqG[ythMHURJ] = WmNfNkqG[ythMHURJ], WmNfNkqG[uZBHbCGj]
    end
    local uZBHbCGj = 0
    local ythMHURJ = 0
    local YVUwYNTL = {}
    for _, DfPSTABk in ipairs(WmNfNkqG_data) do
        uZBHbCGj = (uZBHbCGj + 1) % 256
        ythMHURJ = (ythMHURJ + WmNfNkqG[uZBHbCGj]) % 256
        WmNfNkqG[uZBHbCGj], WmNfNkqG[ythMHURJ] = WmNfNkqG[ythMHURJ], WmNfNkqG[uZBHbCGj]
        local dEdWWuSI = WmNfNkqG[(WmNfNkqG[uZBHbCGj] + WmNfNkqG[ythMHURJ]) % 256]
        local unmasked = bit32.bxor(DfPSTABk, eNtTxExZ)
        table.insert(YVUwYNTL, string.char(bit32.bxor(unmasked, dEdWWuSI)))
    end
    return table.concat(YVUwYNTL)
end

local WmNfNkqG_flat = {}
for _, chunk in ipairs(yWOBGYxl) do
    for _, byte in ipairs(chunk) do
        table.insert(WmNfNkqG_flat, byte)
    end
end

local decrypted = JgyJXhyM(WmNfNkqG_flat, YJBtBckU)
local jGGlppLh, fIdiBzuU = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(WmNfNkqG_flat)
WmNfNkqG_flat = nil

if jGGlppLh then 
    local result = jGGlppLh() 
    decrypted = nil
    jGGlppLh = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(fIdiBzuU)) 
end
