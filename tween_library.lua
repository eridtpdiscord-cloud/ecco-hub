-- Protected Segment (tween_library)
local iLlEHRCj = 197
local rVBxCClm = {
{121,217,212,80,244,240,149,246,72,37,151,15,142,136,127,191,211,243,107,84,106,23,145,3,244,236,120,8,11,189,35,252,122,96,1,238,238,48,167,122,92,100,139,201,86,185,84,228,92,146,59,147,133,221,65,69,202,110,152,1},{159,40,177,68,12,222,226,89,58,246,58,172,119,55,138,121,83,174,162,122,104,151,92,20,166,250,47,135,92,139,227,255,107,146,230,86,129,180,126,48,118,40,48,18,13,28,243,14,203,105,46,56,199,156,226,33,154,123,209,117},{111,254,220,234,169,239,25,140,173,109,203,125,244,41,90,86,10,52,209,219,30,53,177,49,37}
}
local XrfMuLSY = "JHOAfRDzXSdYIGai"

local function QIRlwTQY(IOCDSXJj_data, IOCDSXJj_key)
    if type(IOCDSXJj_key) ~= "string" or #IOCDSXJj_key == 0 then return "" end
    local IOCDSXJj = {}
    for FGgTrpmM = 0, 255 do IOCDSXJj[FGgTrpmM] = FGgTrpmM end
    local GjTmWRXD = 0
    for FGgTrpmM = 0, 255 do
        local wxeIJIUX = IOCDSXJj_key:byte((FGgTrpmM % #IOCDSXJj_key) + 1)
        GjTmWRXD = (GjTmWRXD + IOCDSXJj[FGgTrpmM] + wxeIJIUX) % 256
        IOCDSXJj[FGgTrpmM], IOCDSXJj[GjTmWRXD] = IOCDSXJj[GjTmWRXD], IOCDSXJj[FGgTrpmM]
    end
    local FGgTrpmM = 0
    local GjTmWRXD = 0
    local EahLRPtg = {}
    for _, pvKdHWsQ in ipairs(IOCDSXJj_data) do
        FGgTrpmM = (FGgTrpmM + 1) % 256
        GjTmWRXD = (GjTmWRXD + IOCDSXJj[FGgTrpmM]) % 256
        IOCDSXJj[FGgTrpmM], IOCDSXJj[GjTmWRXD] = IOCDSXJj[GjTmWRXD], IOCDSXJj[FGgTrpmM]
        local wxeIJIUX = IOCDSXJj[(IOCDSXJj[FGgTrpmM] + IOCDSXJj[GjTmWRXD]) % 256]
        local unmasked = bit32.bxor(pvKdHWsQ, iLlEHRCj)
        table.insert(EahLRPtg, string.char(bit32.bxor(unmasked, wxeIJIUX)))
    end
    return table.concat(EahLRPtg)
end

local IOCDSXJj_flat = {}
for _, chunk in ipairs(rVBxCClm) do
    for _, byte in ipairs(chunk) do
        table.insert(IOCDSXJj_flat, byte)
    end
end

local decrypted = QIRlwTQY(IOCDSXJj_flat, XrfMuLSY)
local NZkAdbYd, RLGMYfhH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(IOCDSXJj_flat)
IOCDSXJj_flat = nil

if NZkAdbYd then 
    local result = NZkAdbYd() 
    decrypted = nil
    NZkAdbYd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(RLGMYfhH)) 
end
