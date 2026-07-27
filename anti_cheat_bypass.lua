-- Protected Segment (anti_cheat_bypass)
local ooEnAxRp = 91
local LMaiGhRA = {
{116,195,192,244,148,55,74,191,151,248,150,142,166,124,86,246,210,125,196,22,183,117,116,135,1,11,16,163,7,195,159,124,76,214,100,227,126,56,231,8,64,22,83,255,184,33,46,118,244,118,128,53,202,109,33,222,25,40,202,114},{226,98,221,7,208,28,158,31,236,4,25,40,126,205,178,153,135,112,47,84,227,98,119,21,135,233,20,180,66,74,245,34,125,46,63,216,149,108,51,182,167,156,103,122,221,41,60,161,185,231,119,166,111,38,115,52,211,147,80,154},{233,92,35,62,24,71,110,53,124,221,102,115,248,226,173,85,206,219,221,159,17,52,29,89,253,128,72,174,61}
}
local rFtcGqkp = "NrVmYxvQraBdayxJ"

local function aruXNIAl(IQVYWKGk_data, IQVYWKGk_key)
    if type(IQVYWKGk_key) ~= "string" or #IQVYWKGk_key == 0 then return "" end
    local IQVYWKGk = {}
    for qXjRNauz = 0, 255 do IQVYWKGk[qXjRNauz] = qXjRNauz end
    local wrUTcWDk = 0
    for qXjRNauz = 0, 255 do
        local aDpzeLSK = IQVYWKGk_key:byte((qXjRNauz % #IQVYWKGk_key) + 1)
        wrUTcWDk = (wrUTcWDk + IQVYWKGk[qXjRNauz] + aDpzeLSK) % 256
        IQVYWKGk[qXjRNauz], IQVYWKGk[wrUTcWDk] = IQVYWKGk[wrUTcWDk], IQVYWKGk[qXjRNauz]
    end
    local qXjRNauz = 0
    local wrUTcWDk = 0
    local iZYEXidz = {}
    for _, UYZeOkBP in ipairs(IQVYWKGk_data) do
        qXjRNauz = (qXjRNauz + 1) % 256
        wrUTcWDk = (wrUTcWDk + IQVYWKGk[qXjRNauz]) % 256
        IQVYWKGk[qXjRNauz], IQVYWKGk[wrUTcWDk] = IQVYWKGk[wrUTcWDk], IQVYWKGk[qXjRNauz]
        local aDpzeLSK = IQVYWKGk[(IQVYWKGk[qXjRNauz] + IQVYWKGk[wrUTcWDk]) % 256]
        local unmasked = bit32.bxor(UYZeOkBP, ooEnAxRp)
        table.insert(iZYEXidz, string.char(bit32.bxor(unmasked, aDpzeLSK)))
    end
    return table.concat(iZYEXidz)
end

local IQVYWKGk_flat = {}
for _, chunk in ipairs(LMaiGhRA) do
    for _, byte in ipairs(chunk) do
        table.insert(IQVYWKGk_flat, byte)
    end
end

local decrypted = aruXNIAl(IQVYWKGk_flat, rFtcGqkp)
local tGRPNUTk, CwWCuUMV = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(IQVYWKGk_flat)
IQVYWKGk_flat = nil

if tGRPNUTk then 
    local result = tGRPNUTk() 
    decrypted = nil
    tGRPNUTk = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(CwWCuUMV)) 
end
