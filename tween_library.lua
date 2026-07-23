-- Protected Segment (tween_library)
local mbULKlqk = 163
local kPGtYkIw = {
{8,224,196,59,236,208,128,5,30,247,3,198,94,167,148,146,227,103,227,69,88,10,143,132,112,225,38,224,24,150,54,230,44,242,79,38,44,196,94,32,88,163,181,131,173,51,24,208,92,2,28,4,241,138,140,14,147,217,239,131},{202,135,26,119,136,130,88,186,48,189,41,0,201,170,53,214,148,33,52,234,74,112,60,100,178,134,145,73,142,233,2,167,109,108,225,217,111,131,105,254,250,29,89,228,233,155,248,100,20,143,128,237,54,207,185,211,59,125,169,244},{78,45,16,2,199,224,152,118,129,103,151,28,180,13,14,25,179,137,57,236,179,214,4,58,161}
}
local EBeUPFYI = "VgCpCTvZlYRRvMmH"

local function ZaaySpYM(XmYwHVuL_data, XmYwHVuL_key)
    if type(XmYwHVuL_key) ~= "string" or #XmYwHVuL_key == 0 then return "" end
    local XmYwHVuL = {}
    for ZCpELHHm = 0, 255 do XmYwHVuL[ZCpELHHm] = ZCpELHHm end
    local ulCbadjt = 0
    for ZCpELHHm = 0, 255 do
        local GeqXrZrY = XmYwHVuL_key:byte((ZCpELHHm % #XmYwHVuL_key) + 1)
        ulCbadjt = (ulCbadjt + XmYwHVuL[ZCpELHHm] + GeqXrZrY) % 256
        XmYwHVuL[ZCpELHHm], XmYwHVuL[ulCbadjt] = XmYwHVuL[ulCbadjt], XmYwHVuL[ZCpELHHm]
    end
    local ZCpELHHm = 0
    local ulCbadjt = 0
    local dCRCfJLU = {}
    for _, xRWJPWsD in ipairs(XmYwHVuL_data) do
        ZCpELHHm = (ZCpELHHm + 1) % 256
        ulCbadjt = (ulCbadjt + XmYwHVuL[ZCpELHHm]) % 256
        XmYwHVuL[ZCpELHHm], XmYwHVuL[ulCbadjt] = XmYwHVuL[ulCbadjt], XmYwHVuL[ZCpELHHm]
        local GeqXrZrY = XmYwHVuL[(XmYwHVuL[ZCpELHHm] + XmYwHVuL[ulCbadjt]) % 256]
        local unmasked = bit32.bxor(xRWJPWsD, mbULKlqk)
        table.insert(dCRCfJLU, string.char(bit32.bxor(unmasked, GeqXrZrY)))
    end
    return table.concat(dCRCfJLU)
end

local XmYwHVuL_flat = {}
for _, chunk in ipairs(kPGtYkIw) do
    for _, byte in ipairs(chunk) do
        table.insert(XmYwHVuL_flat, byte)
    end
end

local decrypted = ZaaySpYM(XmYwHVuL_flat, EBeUPFYI)
local YECBaJnY, OLypXfCz = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(XmYwHVuL_flat)
XmYwHVuL_flat = nil

if YECBaJnY then 
    local result = YECBaJnY() 
    decrypted = nil
    YECBaJnY = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(OLypXfCz)) 
end
