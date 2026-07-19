-- Compiled secure segment
local OtcFVxYn = {
{248,195,150,12,58,119,195,193,249,169,227,108,140,30,45,69,44,116,230,190,165,242,175,236,229,44,92,93,16,145,252,91,244,1,247,0,142,158,109,69,47,35,239,144,157,65,238,174,64,116,2,81,141,42,31,141,246,3,12,246},{210,245,34,196,119,68,169,142,54,244,180,32,209,129,243,124,148,47,72,75,140,155,139,40,182,247,98,191,73,216,97,55,84,66,233,167,138,85,158,156,127,208,159,145,109,58,55,171,39,119,158,133,98,170,38,191,223,187,151,250},{224,94,136,167,124,171,12,193,135,151,31,67,199,210,172,84,241,102,57,164,25,114,78,70,205,189,243,144}
}
local ApKlNatY = "coUEjmNnusVWilve"

local function FXUvrKPO(fCaLdKXS_data, fCaLdKXS_key)
    local fCaLdKXS = {}
    for DrRTvQRI = 0, 255 do fCaLdKXS[DrRTvQRI] = DrRTvQRI end
    local brmTiGYd = 0
    for DrRTvQRI = 0, 255 do
        local iCbderDI = fCaLdKXS_key:byte((DrRTvQRI % #fCaLdKXS_key) + 1)
        brmTiGYd = (brmTiGYd + fCaLdKXS[DrRTvQRI] + iCbderDI) % 256
        fCaLdKXS[DrRTvQRI], fCaLdKXS[brmTiGYd] = fCaLdKXS[brmTiGYd], fCaLdKXS[DrRTvQRI]
    end
    local DrRTvQRI = 0
    local brmTiGYd = 0
    local mQeyXZnl = {}
    for _, kxrDudgY in ipairs(fCaLdKXS_data) do
        DrRTvQRI = (DrRTvQRI + 1) % 256
        brmTiGYd = (brmTiGYd + fCaLdKXS[DrRTvQRI]) % 256
        fCaLdKXS[DrRTvQRI], fCaLdKXS[brmTiGYd] = fCaLdKXS[brmTiGYd], fCaLdKXS[DrRTvQRI]
        local iCbderDI = fCaLdKXS[(fCaLdKXS[DrRTvQRI] + fCaLdKXS[brmTiGYd]) % 256]
        table.insert(mQeyXZnl, string.char(bit32.bxor(kxrDudgY, iCbderDI)))
    end
    return table.concat(mQeyXZnl)
end

local fCaLdKXS_flat = {}
for _, chunk in ipairs(OtcFVxYn) do
    for _, byte in ipairs(chunk) do
        table.insert(fCaLdKXS_flat, byte)
    end
end

local decrypted = FXUvrKPO(fCaLdKXS_flat, ApKlNatY)
local KEMxqZpI, vGdsTjwO = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(fCaLdKXS_flat)
fCaLdKXS_flat = nil

if KEMxqZpI then 
    local result = KEMxqZpI() 
    decrypted = nil
    KEMxqZpI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(vGdsTjwO)) 
end
