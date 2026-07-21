-- Compiled secure segment
local jNZzggYb = {
{30,24,87,156,143,218,234,1,111,179,106,3,25,248,12,130,205,125,7,29,214,146,10,150,122,165,68,204,118,47,60,34,64,53,179,134,93,122,198,172,152,5,45,219,214,182,210,228,49,58,30,156,19,71,218,17,135,55,196,209},{40,15,116,141,177,102,172,3,124,69,62,169,50,37,94,247,110,181,209,79,23,112,252,255,176,163,193,248,200,16,232,241,60,237,233,101,171,203,150,79,0,49,108,249,105,255,22,233,236,223,0,57,122,109,21,81,41,128,186,90},{198,68,21,35,157,15,150,89,169,0,14,115,158,113,90,26,238,113,104,221,12,227,21,10,123,116,204,202,132}
}
local GlFJcfzi = "UnUubdesxRxFdagl"

local function zIChSkMl(EEVaZToM_data, EEVaZToM_key)
    local EEVaZToM = {}
    for HxotAOjJ = 0, 255 do EEVaZToM[HxotAOjJ] = HxotAOjJ end
    local ZzhwtlpE = 0
    for HxotAOjJ = 0, 255 do
        local oqbFwLMu = EEVaZToM_key:byte((HxotAOjJ % #EEVaZToM_key) + 1)
        ZzhwtlpE = (ZzhwtlpE + EEVaZToM[HxotAOjJ] + oqbFwLMu) % 256
        EEVaZToM[HxotAOjJ], EEVaZToM[ZzhwtlpE] = EEVaZToM[ZzhwtlpE], EEVaZToM[HxotAOjJ]
    end
    local HxotAOjJ = 0
    local ZzhwtlpE = 0
    local KIoKaTpw = {}
    for _, wKUKWHCO in ipairs(EEVaZToM_data) do
        HxotAOjJ = (HxotAOjJ + 1) % 256
        ZzhwtlpE = (ZzhwtlpE + EEVaZToM[HxotAOjJ]) % 256
        EEVaZToM[HxotAOjJ], EEVaZToM[ZzhwtlpE] = EEVaZToM[ZzhwtlpE], EEVaZToM[HxotAOjJ]
        local oqbFwLMu = EEVaZToM[(EEVaZToM[HxotAOjJ] + EEVaZToM[ZzhwtlpE]) % 256]
        table.insert(KIoKaTpw, string.char(bit32.bxor(wKUKWHCO, oqbFwLMu)))
    end
    return table.concat(KIoKaTpw)
end

local EEVaZToM_flat = {}
for _, chunk in ipairs(jNZzggYb) do
    for _, byte in ipairs(chunk) do
        table.insert(EEVaZToM_flat, byte)
    end
end

local decrypted = zIChSkMl(EEVaZToM_flat, GlFJcfzi)
local bLuDNWjP, rKaNCsuo = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(EEVaZToM_flat)
EEVaZToM_flat = nil

if bLuDNWjP then 
    local result = bLuDNWjP() 
    decrypted = nil
    bLuDNWjP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(rKaNCsuo)) 
end
