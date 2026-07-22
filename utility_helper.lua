-- Protected Segment (utility_helper)
local orivKzLt = 132
local NcoMrESd = {
{60,80,111,198,186,81,211,90,93,27,127,143,209,166,93,219,52,96,0,15,8,219,214,186,8,153,183,70,242,92,35,13,198,25,17,69,60,164,177,19,252,180,62,26,34,153,225,137,198,135,117,136,217,57,15,128,48,111,149,223},{115,132,197,96,252,141,37,43,145,64,155,121,155,128,231,124,85,244,223,247,19,19,30,101,126,41,157,250,70,227,220,137,182,243,22,136,191,131,160,85,218,89,155,51,75,132,49,5,173,54,11,226,116,207,240,94,122,254,94,34},{216,234,63,175,27,229,108,105,218,195,207,14,103,191,247,174,187,71,187,70,204,155,153,209,98,112}
}
local gfxxFhgA = "zAsIjeOClDpMRatG"

local function NicOhkEn(QEDPANiS_data, QEDPANiS_key)
    local QEDPANiS = {}
    for PSIfpdkq = 0, 255 do QEDPANiS[PSIfpdkq] = PSIfpdkq end
    local CwfbJsNb = 0
    for PSIfpdkq = 0, 255 do
        local UNouNYcF = QEDPANiS_key:byte((PSIfpdkq % #QEDPANiS_key) + 1)
        CwfbJsNb = (CwfbJsNb + QEDPANiS[PSIfpdkq] + UNouNYcF) % 256
        QEDPANiS[PSIfpdkq], QEDPANiS[CwfbJsNb] = QEDPANiS[CwfbJsNb], QEDPANiS[PSIfpdkq]
    end
    local PSIfpdkq = 0
    local CwfbJsNb = 0
    local DjhkajkB = {}
    for _, XZUDkVFB in ipairs(QEDPANiS_data) do
        PSIfpdkq = (PSIfpdkq + 1) % 256
        CwfbJsNb = (CwfbJsNb + QEDPANiS[PSIfpdkq]) % 256
        QEDPANiS[PSIfpdkq], QEDPANiS[CwfbJsNb] = QEDPANiS[CwfbJsNb], QEDPANiS[PSIfpdkq]
        local UNouNYcF = QEDPANiS[(QEDPANiS[PSIfpdkq] + QEDPANiS[CwfbJsNb]) % 256]
        local unmasked = bit32.bxor(XZUDkVFB, orivKzLt)
        table.insert(DjhkajkB, string.char(bit32.bxor(unmasked, UNouNYcF)))
    end
    return table.concat(DjhkajkB)
end

local QEDPANiS_flat = {}
for _, chunk in ipairs(NcoMrESd) do
    for _, byte in ipairs(chunk) do
        table.insert(QEDPANiS_flat, byte)
    end
end

local decrypted = NicOhkEn(QEDPANiS_flat, gfxxFhgA)
local KgTnsELH, JwivFrGz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QEDPANiS_flat)
QEDPANiS_flat = nil

if KgTnsELH then 
    local result = KgTnsELH() 
    decrypted = nil
    KgTnsELH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(JwivFrGz)) 
end
