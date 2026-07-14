-- Compiled secure segment
local AItAdvGM = {
{219,39,32,225,222,76,115,198,8,115,173,38,95,66,54,217,223,228,45,43,232,150,27,32,43,167,13,114,123,53,165,38,216,142,51,77,215,35,230,197,228,7,97,67,29,31,122,210,242,230,19,67,239,143,82,194,187,142,198,234},{201,186,45,3,35,164,144,102,238,69,148,83,145,73,234,44,240,49,55,169,178,55,168,46,190,134,229,72,102,140,158,127,128,74,101,169,230,129,110,50,121,27,139,218,196,220,241,92,49,248,232,228,202,46,129,218,217,68,200,4},{173,60,5,117,244,157,38,138,56,97,247,233,97,3,233,77,96,13,216,178,158,242,207,104,165,195,126,245,202,73,188,133,215,83,67,250,232,186,225,210,28,199,28,194,120,81,109,81,59,92,40,241,225,250,112,127,95,48,168,36},{111,105,141,175,101,17,105,0,210,172,91,47,34,32,151,53,150,113,59,158,166,10,237,240,118,164,56,233,202,27,181,147,229,98,24,2,122,76,100,2,201,210,109,25,41,190,84,16,200,193,141,166,28,218,41,223}
}
local LaTfuILt = "wjmUguLEBNhoGwez"

local function JdUmLpHf(wbqECGlh_data, wbqECGlh_key)
    local wbqECGlh = {}
    for AUDLOZcW = 0, 255 do wbqECGlh[AUDLOZcW] = AUDLOZcW end
    local fIlmaTog = 0
    for AUDLOZcW = 0, 255 do
        local lRFNcWki = wbqECGlh_key:byte((AUDLOZcW % #wbqECGlh_key) + 1)
        fIlmaTog = (fIlmaTog + wbqECGlh[AUDLOZcW] + lRFNcWki) % 256
        wbqECGlh[AUDLOZcW], wbqECGlh[fIlmaTog] = wbqECGlh[fIlmaTog], wbqECGlh[AUDLOZcW]
    end
    local AUDLOZcW = 0
    local fIlmaTog = 0
    local wggVgaEH = {}
    for _, JYNrYBNG in ipairs(wbqECGlh_data) do
        AUDLOZcW = (AUDLOZcW + 1) % 256
        fIlmaTog = (fIlmaTog + wbqECGlh[AUDLOZcW]) % 256
        wbqECGlh[AUDLOZcW], wbqECGlh[fIlmaTog] = wbqECGlh[fIlmaTog], wbqECGlh[AUDLOZcW]
        local lRFNcWki = wbqECGlh[(wbqECGlh[AUDLOZcW] + wbqECGlh[fIlmaTog]) % 256]
        table.insert(wggVgaEH, string.char(bit32.bxor(JYNrYBNG, lRFNcWki)))
    end
    return table.concat(wggVgaEH)
end

local wbqECGlh_flat = {}
for _, chunk in ipairs(AItAdvGM) do
    for _, byte in ipairs(chunk) do
        table.insert(wbqECGlh_flat, byte)
    end
end

local decrypted = JdUmLpHf(wbqECGlh_flat, LaTfuILt)
local gGTSHxSB, vwDbfsCi = loadstring(decrypted)
if gGTSHxSB then 
    return gGTSHxSB() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(vwDbfsCi)) 
end
