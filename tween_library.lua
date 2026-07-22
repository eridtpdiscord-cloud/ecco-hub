-- Protected Segment (tween_library)
local YugqVfrK = 92
local GEaXSGmD = {
{38,153,158,141,118,140,46,68,121,58,100,106,2,253,176,40,188,16,245,156,85,4,137,251,143,100,97,37,32,69,197,117,179,237,72,214,220,96,40,118,171,27,128,103,122,118,191,116,247,132,44,169,147,27,155,96,181,208,171,207},{14,161,181,233,243,168,151,210,139,7,228,78,101,23,179,115,38,109,132,185,110,9,190,119,249,143,224,113,169,105,211,139,170,10,153,71,6,235,108,232,71,65,204,119,204,149,219,211,153,14,45,192,36,91,248,21,50,189,211,24},{66,136,44,114,121,10,122,29,10,73,162,198,237,245,66,94,74,220,143,139,162,113,99,246,199}
}
local nxkhhmRM = "UoxyAJUNyAhgoGxR"

local function MYEcRgmd(usunWwOI_data, usunWwOI_key)
    local usunWwOI = {}
    for saFwpwSp = 0, 255 do usunWwOI[saFwpwSp] = saFwpwSp end
    local PAdUfWOF = 0
    for saFwpwSp = 0, 255 do
        local rvBIsBTO = usunWwOI_key:byte((saFwpwSp % #usunWwOI_key) + 1)
        PAdUfWOF = (PAdUfWOF + usunWwOI[saFwpwSp] + rvBIsBTO) % 256
        usunWwOI[saFwpwSp], usunWwOI[PAdUfWOF] = usunWwOI[PAdUfWOF], usunWwOI[saFwpwSp]
    end
    local saFwpwSp = 0
    local PAdUfWOF = 0
    local nubUGvJK = {}
    for _, mUsxESlL in ipairs(usunWwOI_data) do
        saFwpwSp = (saFwpwSp + 1) % 256
        PAdUfWOF = (PAdUfWOF + usunWwOI[saFwpwSp]) % 256
        usunWwOI[saFwpwSp], usunWwOI[PAdUfWOF] = usunWwOI[PAdUfWOF], usunWwOI[saFwpwSp]
        local rvBIsBTO = usunWwOI[(usunWwOI[saFwpwSp] + usunWwOI[PAdUfWOF]) % 256]
        local unmasked = bit32.bxor(mUsxESlL, YugqVfrK)
        table.insert(nubUGvJK, string.char(bit32.bxor(unmasked, rvBIsBTO)))
    end
    return table.concat(nubUGvJK)
end

local usunWwOI_flat = {}
for _, chunk in ipairs(GEaXSGmD) do
    for _, byte in ipairs(chunk) do
        table.insert(usunWwOI_flat, byte)
    end
end

local decrypted = MYEcRgmd(usunWwOI_flat, nxkhhmRM)
local sySoAoAI, UxTfGjzJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(usunWwOI_flat)
usunWwOI_flat = nil

if sySoAoAI then 
    local result = sySoAoAI() 
    decrypted = nil
    sySoAoAI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(UxTfGjzJ)) 
end
