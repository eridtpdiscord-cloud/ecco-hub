-- Protected Segment (math_vector_utils)
local afaYCELa = 70
local nyEugUaq = {
{131,222,99,141,172,168,67,28,151,218,91,151,9,143,150,64,133,11,246,79,29,140,166,126,211,247,86,240,238,174,195,244,227,209,206,67,217,39,233,251,145,19,104,249,70,68,53,28,253,168,246,64,112,32,101,64,11,198,133,195},{217,134,69,90,56,196,232,0,44,165,116,104,159,147,163,133,180,221,31,185,130,140,55,90,102,38,195,170,222,254,49,148,201,119,42,184,195,231,205,142,13,223,183,253,177,67,140,84,217,102,193,248,105,12,90,92,186,185,31,51},{246,104,41,19,212,56,179,14,48,62,39,57,30,222,159,202,249,28,188,163,170,156,126,71,96,177,222,95,24}
}
local VZvPGzDg = "rqjWrigsVvvVLGOD"

local function AWJwhMIc(TjLSSJek_data, TjLSSJek_key)
    if type(TjLSSJek_key) ~= "string" or #TjLSSJek_key == 0 then return "" end
    local TjLSSJek = {}
    for LaNXvrXV = 0, 255 do TjLSSJek[LaNXvrXV] = LaNXvrXV end
    local LejnVfDK = 0
    for LaNXvrXV = 0, 255 do
        local gfoIUuGs = TjLSSJek_key:byte((LaNXvrXV % #TjLSSJek_key) + 1)
        LejnVfDK = (LejnVfDK + TjLSSJek[LaNXvrXV] + gfoIUuGs) % 256
        TjLSSJek[LaNXvrXV], TjLSSJek[LejnVfDK] = TjLSSJek[LejnVfDK], TjLSSJek[LaNXvrXV]
    end
    local LaNXvrXV = 0
    local LejnVfDK = 0
    local upHJopkq = {}
    for _, kLuksTcD in ipairs(TjLSSJek_data) do
        LaNXvrXV = (LaNXvrXV + 1) % 256
        LejnVfDK = (LejnVfDK + TjLSSJek[LaNXvrXV]) % 256
        TjLSSJek[LaNXvrXV], TjLSSJek[LejnVfDK] = TjLSSJek[LejnVfDK], TjLSSJek[LaNXvrXV]
        local gfoIUuGs = TjLSSJek[(TjLSSJek[LaNXvrXV] + TjLSSJek[LejnVfDK]) % 256]
        local unmasked = bit32.bxor(kLuksTcD, afaYCELa)
        table.insert(upHJopkq, string.char(bit32.bxor(unmasked, gfoIUuGs)))
    end
    return table.concat(upHJopkq)
end

local TjLSSJek_flat = {}
for _, chunk in ipairs(nyEugUaq) do
    for _, byte in ipairs(chunk) do
        table.insert(TjLSSJek_flat, byte)
    end
end

local decrypted = AWJwhMIc(TjLSSJek_flat, VZvPGzDg)
local pUfFARwR, HXVLdBgw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(TjLSSJek_flat)
TjLSSJek_flat = nil

if pUfFARwR then 
    local result = pUfFARwR() 
    decrypted = nil
    pUfFARwR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(HXVLdBgw)) 
end
