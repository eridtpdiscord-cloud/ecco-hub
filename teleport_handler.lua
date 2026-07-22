-- Protected Segment (teleport_handler)
local FwujRzey = 179
local NceeqNYR = {
{82,27,148,35,18,101,147,225,2,188,220,227,219,154,51,24,164,18,229,6,74,83,16,149,106,82,68,104,80,92,234,151,84,11,247,221,220,139,193,50,9,232,185,118,187,31,194,249,130,195,68,209,163,95,107,254,147,109,4,33},{117,163,176,165,91,190,7,68,250,135,178,68,60,130,164,69,141,165,17,81,142,223,244,212,89,201,47,185,74,49,141,138,68,107,217,242,126,144,100,153,156,191,20,6,78,40,201,50,21,164,134,30,132,34,71,197,92,230,172,60},{65,140,138,94,253,235,60,77,243,100,57,67,208,59,191,167,155,234,187,234,154,207,52,26,194,178,13,80}
}
local hRubIFnz = "fOirDWDcSbnMdWqv"

local function PsYwCFPX(iiljVcnO_data, iiljVcnO_key)
    local iiljVcnO = {}
    for SDdQEZMh = 0, 255 do iiljVcnO[SDdQEZMh] = SDdQEZMh end
    local IthdFvhE = 0
    for SDdQEZMh = 0, 255 do
        local aemBeUOy = iiljVcnO_key:byte((SDdQEZMh % #iiljVcnO_key) + 1)
        IthdFvhE = (IthdFvhE + iiljVcnO[SDdQEZMh] + aemBeUOy) % 256
        iiljVcnO[SDdQEZMh], iiljVcnO[IthdFvhE] = iiljVcnO[IthdFvhE], iiljVcnO[SDdQEZMh]
    end
    local SDdQEZMh = 0
    local IthdFvhE = 0
    local neMwOgai = {}
    for _, abGcrpOw in ipairs(iiljVcnO_data) do
        SDdQEZMh = (SDdQEZMh + 1) % 256
        IthdFvhE = (IthdFvhE + iiljVcnO[SDdQEZMh]) % 256
        iiljVcnO[SDdQEZMh], iiljVcnO[IthdFvhE] = iiljVcnO[IthdFvhE], iiljVcnO[SDdQEZMh]
        local aemBeUOy = iiljVcnO[(iiljVcnO[SDdQEZMh] + iiljVcnO[IthdFvhE]) % 256]
        local unmasked = bit32.bxor(abGcrpOw, FwujRzey)
        table.insert(neMwOgai, string.char(bit32.bxor(unmasked, aemBeUOy)))
    end
    return table.concat(neMwOgai)
end

local iiljVcnO_flat = {}
for _, chunk in ipairs(NceeqNYR) do
    for _, byte in ipairs(chunk) do
        table.insert(iiljVcnO_flat, byte)
    end
end

local decrypted = PsYwCFPX(iiljVcnO_flat, hRubIFnz)
local wFJhigMF, GWOePbhb = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(iiljVcnO_flat)
iiljVcnO_flat = nil

if wFJhigMF then 
    local result = wFJhigMF() 
    decrypted = nil
    wFJhigMF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(GWOePbhb)) 
end
