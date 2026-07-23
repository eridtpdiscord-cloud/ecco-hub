-- Protected Segment (db)
local xxfBYHug = 44
local drpdEkfB = {
{162,211,122,18,203,255,174,111,118,88,122,108,238,53,198,202,117,198,138,93,3,202,96,69,100,77,219,152,154,164,33,193,177,167,113,209,88,140,109,161,175,125,222,209,186,21,167,134,243,119,78,48,194,12,142,231,136,93,6,225},{248,30,122,94,208,54,191,190,107,14,112,65,76,23,12,49,125,25,196,211,241,205,244,234,195,108,44,21,158,83,126,247,167,177,66,154,79,252,140,249,128,8,143,10,80,146,208,222,46,111,243,11,239,3,236,105,189,198,253,157},{134,203,193,240,122,100,117,216,139,7,229,116,54,142,199,178,65,23,22,61,123,124,19,141,193,253,112,105,138,144,176,82,33,100,53,201,200,110,77,175,10,70,184,115,130,252,3,210,82,181,69,180,165,223,127,45,133,55,34,86},{235,154,247,170,214,211,6,200,89,185,131,127,85,22,101,255,218,38,227,133,239,234,237,66,52,192,118,180,141,172,234,167,177,22,244,209,161,36,34,5,88,85,25,20,209,253,211,119,10,13,83,185,24,72,159,98,151,201,80,188},{138,82,167,46,210,78,71,146,224,56,189,9,202,163,113,3,247,77,92,155,104,234,57,110,51,125,107,24,179,217,90,126,237,167,243,211,104,247,21,13,102,135,158,183,40,91,149,185,35,220,25,145,164,205,157,49,48,19,61,192},{94,152,12,168,247,157,229,88,220,231,197,234,214,208,55,100,170,153,139,160,148,85,98,144,172,202,121,221,252,230,218,7,245,83,209,237,23,64,129,111,195,233,17,119,241,238,163,206,155,164,12,103,101,179,113,73,57,247,2,78},{165,191,59,189,90,186,241,43,9,148,251,14,240,49,148,182,102,130,176,233,197,27,29,210,167,167,5,43,161,147,106,187,37,158,37,13,57,170,130,190,68,114,202,143,100,241,190,199,169,213,99,39,196,165,231,102,133,72,171,15},{22,13,251,169,130,117,208,137,200,102,83,66,47,90,239,243,132,213,153,112,247,254,65,232,46,114,139,248,84,167,2,102,124,33,253,146,208,215,16,12,91,132,238,74,163,143,222,217,237,151,5,86,162,231,206,37,217,120,168}
}
local nysIDnoD = "rCbkVvtlPADlytmJ"

local function TdrsAKeW(AyVJgAcf_data, AyVJgAcf_key)
    if type(AyVJgAcf_key) ~= "string" or #AyVJgAcf_key == 0 then return "" end
    local AyVJgAcf = {}
    for eOmAeoJO = 0, 255 do AyVJgAcf[eOmAeoJO] = eOmAeoJO end
    local vtVgyHlB = 0
    for eOmAeoJO = 0, 255 do
        local KOsrqFCB = AyVJgAcf_key:byte((eOmAeoJO % #AyVJgAcf_key) + 1)
        vtVgyHlB = (vtVgyHlB + AyVJgAcf[eOmAeoJO] + KOsrqFCB) % 256
        AyVJgAcf[eOmAeoJO], AyVJgAcf[vtVgyHlB] = AyVJgAcf[vtVgyHlB], AyVJgAcf[eOmAeoJO]
    end
    local eOmAeoJO = 0
    local vtVgyHlB = 0
    local PSRXPFmz = {}
    for _, swFwRuWy in ipairs(AyVJgAcf_data) do
        eOmAeoJO = (eOmAeoJO + 1) % 256
        vtVgyHlB = (vtVgyHlB + AyVJgAcf[eOmAeoJO]) % 256
        AyVJgAcf[eOmAeoJO], AyVJgAcf[vtVgyHlB] = AyVJgAcf[vtVgyHlB], AyVJgAcf[eOmAeoJO]
        local KOsrqFCB = AyVJgAcf[(AyVJgAcf[eOmAeoJO] + AyVJgAcf[vtVgyHlB]) % 256]
        local unmasked = bit32.bxor(swFwRuWy, xxfBYHug)
        table.insert(PSRXPFmz, string.char(bit32.bxor(unmasked, KOsrqFCB)))
    end
    return table.concat(PSRXPFmz)
end

local AyVJgAcf_flat = {}
for _, chunk in ipairs(drpdEkfB) do
    for _, byte in ipairs(chunk) do
        table.insert(AyVJgAcf_flat, byte)
    end
end

local decrypted = TdrsAKeW(AyVJgAcf_flat, nysIDnoD)
local pliQqEsg, treilzVR = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(AyVJgAcf_flat)
AyVJgAcf_flat = nil

if pliQqEsg then 
    local result = pliQqEsg() 
    decrypted = nil
    pliQqEsg = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(treilzVR)) 
end
