-- Protected Segment (db)
local FbXhHjTz = 24
local QCkLzBoi = {
{95,151,235,43,125,132,219,2,33,188,154,56,68,20,206,196,1,33,44,162,21,88,83,21,127,108,142,246,200,36,247,45,120,82,119,128,108,80,133,218,2,121,160,72,97,18,49,194,17,189,27,215,131,96,16,41,228,41,198,23},{22,225,78,42,182,20,71,240,214,105,44,52,86,244,55,141,17,81,140,156,195,107,3,27,7,154,43,195,71,230,130,9,225,36,63,10,65,96,201,58,70,226,27,118,98,201,207,103,187,96,140,175,185,158,93,43,141,179,161,124},{180,163,6,108,95,241,75,93,5,206,109,64,66,228,96,79,38,32,92,34,82,137,139,72,217,31,36,44,213,214,130,141,201,193,132,181,255,3,205,62,208,221,228,222,91,42,70,123,69,101,201,22,194,162,8,15,33,74,33,33},{147,133,64,60,208,103,155,32,167,238,196,151,146,240,167,177,54,185,222,40,143,184,12,253,239,145,120,10,66,205,213,75,168,177,97,9,4,60,144,10,238,74,85,232,37,228,149,48,234,223,252,5,225,223,64,65,197,188,2,193},{184,99,237,21,219,182,2,37,239,173,227,194,128,113,212,10,209,47,80,177,55,2,163,38,153,217,1,137,19,101,54,77,216,215,135,71,30,59,242,78,113,145,197,147,227,84,146,178,123,113,21,202,20,200,221,65,206,185,58,218},{87,95,122,230,35,192,88,127,217,53,50,132,48,39,170,40,247,246,85,114,0,198,233,170,63,141,19,70,186,36,71,186,40,193,228,81,153,153,63,150,39,188,22,77,235,186,156,253,10,81,67,242,139,178,29,215,3,192,8,187},{114,202,171,41,60,77,101,12,176,59,206,136,247,230,134,94,240,75,212,45,2,41,220,15,213,6,130,129,5,145,136,221,44,215,137,12,90,19,16,38,144,208,49,145}
}
local yKsIFoLq = "hztPyrgJHSNDJlCU"

local function thzNvYTE(LLFvYiSi_data, LLFvYiSi_key)
    local LLFvYiSi = {}
    for WBFIfOeO = 0, 255 do LLFvYiSi[WBFIfOeO] = WBFIfOeO end
    local aODLNwSB = 0
    for WBFIfOeO = 0, 255 do
        local TlbHXWLz = LLFvYiSi_key:byte((WBFIfOeO % #LLFvYiSi_key) + 1)
        aODLNwSB = (aODLNwSB + LLFvYiSi[WBFIfOeO] + TlbHXWLz) % 256
        LLFvYiSi[WBFIfOeO], LLFvYiSi[aODLNwSB] = LLFvYiSi[aODLNwSB], LLFvYiSi[WBFIfOeO]
    end
    local WBFIfOeO = 0
    local aODLNwSB = 0
    local KiWCtsOO = {}
    for _, BnNVHlVT in ipairs(LLFvYiSi_data) do
        WBFIfOeO = (WBFIfOeO + 1) % 256
        aODLNwSB = (aODLNwSB + LLFvYiSi[WBFIfOeO]) % 256
        LLFvYiSi[WBFIfOeO], LLFvYiSi[aODLNwSB] = LLFvYiSi[aODLNwSB], LLFvYiSi[WBFIfOeO]
        local TlbHXWLz = LLFvYiSi[(LLFvYiSi[WBFIfOeO] + LLFvYiSi[aODLNwSB]) % 256]
        local unmasked = bit32.bxor(BnNVHlVT, FbXhHjTz)
        table.insert(KiWCtsOO, string.char(bit32.bxor(unmasked, TlbHXWLz)))
    end
    return table.concat(KiWCtsOO)
end

local LLFvYiSi_flat = {}
for _, chunk in ipairs(QCkLzBoi) do
    for _, byte in ipairs(chunk) do
        table.insert(LLFvYiSi_flat, byte)
    end
end

local decrypted = thzNvYTE(LLFvYiSi_flat, yKsIFoLq)
local oSLUkPoH, XiAbrxTt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(LLFvYiSi_flat)
LLFvYiSi_flat = nil

if oSLUkPoH then 
    local result = oSLUkPoH() 
    decrypted = nil
    oSLUkPoH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(XiAbrxTt)) 
end
