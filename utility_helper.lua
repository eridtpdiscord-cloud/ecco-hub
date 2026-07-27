-- Protected Segment (utility_helper)
local cBkGeRCX = 221
local PqNpNUQk = {
{189,244,27,59,53,65,20,238,189,131,81,194,58,172,112,227,231,197,136,66,179,54,193,16,119,127,128,68,81,143,212,90,125,81,38,9,41,212,106,109,234,114,92,247,152,28,205,44,106,198,222,2,135,77,231,26,237,236,181,254},{230,219,97,249,177,192,184,227,27,188,71,235,136,158,169,117,112,121,84,127,61,151,194,218,201,171,201,41,100,27,118,20,27,112,241,69,148,45,27,174,239,126,84,23,186,58,126,222,119,182,191,174,148,194,211,51,221,205,171,70},{124,199,64,115,34,131,112,26,63,207,216,122,92,96,133,199,215,239,61,168,127,53,104,183,108,42}
}
local PjrqhQgr = "yyeDQtrvGVdfVaPC"

local function gfcKBXlK(KbotpGOm_data, KbotpGOm_key)
    if type(KbotpGOm_key) ~= "string" or #KbotpGOm_key == 0 then return "" end
    local KbotpGOm = {}
    for ggFZvWfi = 0, 255 do KbotpGOm[ggFZvWfi] = ggFZvWfi end
    local INGzkeLL = 0
    for ggFZvWfi = 0, 255 do
        local RNzCQCIk = KbotpGOm_key:byte((ggFZvWfi % #KbotpGOm_key) + 1)
        INGzkeLL = (INGzkeLL + KbotpGOm[ggFZvWfi] + RNzCQCIk) % 256
        KbotpGOm[ggFZvWfi], KbotpGOm[INGzkeLL] = KbotpGOm[INGzkeLL], KbotpGOm[ggFZvWfi]
    end
    local ggFZvWfi = 0
    local INGzkeLL = 0
    local hFvEHfmz = {}
    for _, fHcGMxdk in ipairs(KbotpGOm_data) do
        ggFZvWfi = (ggFZvWfi + 1) % 256
        INGzkeLL = (INGzkeLL + KbotpGOm[ggFZvWfi]) % 256
        KbotpGOm[ggFZvWfi], KbotpGOm[INGzkeLL] = KbotpGOm[INGzkeLL], KbotpGOm[ggFZvWfi]
        local RNzCQCIk = KbotpGOm[(KbotpGOm[ggFZvWfi] + KbotpGOm[INGzkeLL]) % 256]
        local unmasked = bit32.bxor(fHcGMxdk, cBkGeRCX)
        table.insert(hFvEHfmz, string.char(bit32.bxor(unmasked, RNzCQCIk)))
    end
    return table.concat(hFvEHfmz)
end

local KbotpGOm_flat = {}
for _, chunk in ipairs(PqNpNUQk) do
    for _, byte in ipairs(chunk) do
        table.insert(KbotpGOm_flat, byte)
    end
end

local decrypted = gfcKBXlK(KbotpGOm_flat, PjrqhQgr)
local IVyXmHdm, TBiztLXq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(KbotpGOm_flat)
KbotpGOm_flat = nil

if IVyXmHdm then 
    local result = IVyXmHdm() 
    decrypted = nil
    IVyXmHdm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(TBiztLXq)) 
end
