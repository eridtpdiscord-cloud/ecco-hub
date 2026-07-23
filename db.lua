-- Protected Segment (db)
local qGSsIBnn = 30
local SPZgkESI = {
{17,83,253,128,43,166,116,89,58,89,180,11,2,34,175,176,161,151,177,193,153,125,180,53,76,170,174,146,12,43,151,86,167,195,83,159,26,171,132,73,70,45,132,164,182,34,171,204,65,21,111,143,30,217,238,44,48,237,69,98},{117,227,130,0,70,123,194,120,29,33,240,244,244,3,253,117,12,198,160,219,204,114,114,4,25,155,164,53,165,90,157,250,241,100,167,197,82,98,143,28,216,199,179,220,117,111,145,236,117,175,109,51,95,134,119,29,166,94,63,235},{83,253,43,233,49,236,223,250,220,167,87,9,161,139,82,4,255,176,210,100,38,4,226,130,249,184,128,3,23,141,210,174,83,193,144,82,112,26,169,152,144,97,184,146,163,176,64,226,247,43,61,97,215,244,133,218,99,152,48,2},{227,154,62,59,163,59,38,84,250,85,205,229,227,86,13,24,201,180,29,48,33,8,184,128,189,73,241,150,41,43,79,151,26,212,187,96,220,2,230,102,203,157,222,22,44,58,68,217,107,38,43,143,111,99,180,52,218,19,101,58},{96,185,74,161,5,69,131,104,236,6,143,162,196,88,132,110,54,33,180,82,45,136,111,168,236,206,81,190,169,173,173,176,89,16,36,246,139,170,243,104,21,167,60,125,20,239,62,199,12,69,211,152,39,36,56,142,172,49,46,167},{50,40,6,74,141,96,214,124,156,46,236,183,46,213,26,86,215,169,242,198,200,6,172,187,87,79,132,36,171,75,142,134,200,147,228,251,154,1,209,78,254,235,205,80,23,123,91,93,147,49,239,128,186,248,54,234,244,136,198,242},{39,139,247,95,18,193,66,214,202,72,50,56,68,241,39,80,127,192,233,244,18,211,173,111,254,64,97,161,252,26,234,13,155,209,114,163,77,148,144,104,68,52,103,174,36,168,76,226,201,148,218,243,240,206,108,11,31,0,46,65},{209,13,208,204,193,230,105,7,255,255,77,106,151,111,248,88,153,68,82,51,48,107,195,176,180,34,113,211,69,133,242,199,87,46,46,241,225,61,37,167,200,120,10,10,249,28,241,89,250,127,37,28,78,58,146,7,131,236,152}
}
local dLXQGbBx = "miEOhqORxRoXacJh"

local function roJtjzrz(xGyfqaUo_data, xGyfqaUo_key)
    if type(xGyfqaUo_key) ~= "string" or #xGyfqaUo_key == 0 then return "" end
    local xGyfqaUo = {}
    for VJRqguMp = 0, 255 do xGyfqaUo[VJRqguMp] = VJRqguMp end
    local JWnBlMbQ = 0
    for VJRqguMp = 0, 255 do
        local qojFanML = xGyfqaUo_key:byte((VJRqguMp % #xGyfqaUo_key) + 1)
        JWnBlMbQ = (JWnBlMbQ + xGyfqaUo[VJRqguMp] + qojFanML) % 256
        xGyfqaUo[VJRqguMp], xGyfqaUo[JWnBlMbQ] = xGyfqaUo[JWnBlMbQ], xGyfqaUo[VJRqguMp]
    end
    local VJRqguMp = 0
    local JWnBlMbQ = 0
    local vDyiFAeT = {}
    for _, LgTbSLJI in ipairs(xGyfqaUo_data) do
        VJRqguMp = (VJRqguMp + 1) % 256
        JWnBlMbQ = (JWnBlMbQ + xGyfqaUo[VJRqguMp]) % 256
        xGyfqaUo[VJRqguMp], xGyfqaUo[JWnBlMbQ] = xGyfqaUo[JWnBlMbQ], xGyfqaUo[VJRqguMp]
        local qojFanML = xGyfqaUo[(xGyfqaUo[VJRqguMp] + xGyfqaUo[JWnBlMbQ]) % 256]
        local unmasked = bit32.bxor(LgTbSLJI, qGSsIBnn)
        table.insert(vDyiFAeT, string.char(bit32.bxor(unmasked, qojFanML)))
    end
    return table.concat(vDyiFAeT)
end

local xGyfqaUo_flat = {}
for _, chunk in ipairs(SPZgkESI) do
    for _, byte in ipairs(chunk) do
        table.insert(xGyfqaUo_flat, byte)
    end
end

local decrypted = roJtjzrz(xGyfqaUo_flat, dLXQGbBx)
local smxAjqwI, mJqRqOQa = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xGyfqaUo_flat)
xGyfqaUo_flat = nil

if smxAjqwI then 
    local result = smxAjqwI() 
    decrypted = nil
    smxAjqwI = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(mJqRqOQa)) 
end
