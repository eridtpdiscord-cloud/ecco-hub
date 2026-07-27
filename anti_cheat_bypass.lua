-- Protected Segment (anti_cheat_bypass)
local wjLjsBNF = 54
local FomItRCX = {
{231,223,42,90,151,159,109,219,240,93,139,186,243,220,77,199,190,124,16,209,228,114,63,113,107,137,81,231,211,55,164,64,163,37,136,124,95,242,6,50,28,151,7,170,68,25,137,36,23,141,102,147,247,19,156,223,121,197,236,138},{249,5,43,135,77,169,117,220,51,122,51,42,166,84,66,136,68,171,33,212,40,46,0,236,223,57,253,186,42,181,28,202,152,242,147,63,117,220,135,12,58,231,107,59,34,139,31,154,184,111,140,145,189,142,238,77,232,205,148,79},{153,175,66,82,249,229,212,3,51,246,8,213,72,197,18,127,61,175,157,45,77,145,3,206,181,4,69,106,249}
}
local RKxkTkHS = "mCspDFkXmHOrlCDo"

local function rhyteVzk(fIivAhAv_data, fIivAhAv_key)
    if type(fIivAhAv_key) ~= "string" or #fIivAhAv_key == 0 then return "" end
    local fIivAhAv = {}
    for SBBRDhYs = 0, 255 do fIivAhAv[SBBRDhYs] = SBBRDhYs end
    local UQlzzogu = 0
    for SBBRDhYs = 0, 255 do
        local IPisRTSu = fIivAhAv_key:byte((SBBRDhYs % #fIivAhAv_key) + 1)
        UQlzzogu = (UQlzzogu + fIivAhAv[SBBRDhYs] + IPisRTSu) % 256
        fIivAhAv[SBBRDhYs], fIivAhAv[UQlzzogu] = fIivAhAv[UQlzzogu], fIivAhAv[SBBRDhYs]
    end
    local SBBRDhYs = 0
    local UQlzzogu = 0
    local DsnpoOTH = {}
    for _, wJDESemN in ipairs(fIivAhAv_data) do
        SBBRDhYs = (SBBRDhYs + 1) % 256
        UQlzzogu = (UQlzzogu + fIivAhAv[SBBRDhYs]) % 256
        fIivAhAv[SBBRDhYs], fIivAhAv[UQlzzogu] = fIivAhAv[UQlzzogu], fIivAhAv[SBBRDhYs]
        local IPisRTSu = fIivAhAv[(fIivAhAv[SBBRDhYs] + fIivAhAv[UQlzzogu]) % 256]
        local unmasked = bit32.bxor(wJDESemN, wjLjsBNF)
        table.insert(DsnpoOTH, string.char(bit32.bxor(unmasked, IPisRTSu)))
    end
    return table.concat(DsnpoOTH)
end

local fIivAhAv_flat = {}
for _, chunk in ipairs(FomItRCX) do
    for _, byte in ipairs(chunk) do
        table.insert(fIivAhAv_flat, byte)
    end
end

local decrypted = rhyteVzk(fIivAhAv_flat, RKxkTkHS)
local pGpoGQyQ, YvGjyKoN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(fIivAhAv_flat)
fIivAhAv_flat = nil

if pGpoGQyQ then 
    local result = pGpoGQyQ() 
    decrypted = nil
    pGpoGQyQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(YvGjyKoN)) 
end
