-- Protected Segment (math_vector_utils)
local KsCyYFUx = 162
local wfblEtNO = {
{46,34,132,111,14,202,77,132,49,184,167,210,208,236,132,84,188,16,36,53,15,200,136,15,182,69,122,51,31,227,10,27,26,31,32,52,79,169,149,47,89,169,252,250,219,107,39,207,152,34,160,14,189,182,94,46,27,212,106,239},{186,247,248,106,101,83,102,0,81,225,220,66,97,214,208,21,191,231,233,244,46,191,102,31,87,128,147,235,158,171,81,126,68,245,250,200,118,180,56,28,156,102,121,174,95,214,124,73,170,187,53,177,169,131,74,118,152,241,64,163},{116,149,220,84,16,138,168,145,219,164,11,132,66,135,132,67,45,240,173,82,179,103,220,188,118,63,73,184,159}
}
local cbUChhhT = "GQSlgXENnymGCvQh"

local function gXfNdnMS(PtSrPmXd_data, PtSrPmXd_key)
    if type(PtSrPmXd_key) ~= "string" or #PtSrPmXd_key == 0 then return "" end
    local PtSrPmXd = {}
    for IgAQWnMl = 0, 255 do PtSrPmXd[IgAQWnMl] = IgAQWnMl end
    local doZJTqWv = 0
    for IgAQWnMl = 0, 255 do
        local hfMmfZoi = PtSrPmXd_key:byte((IgAQWnMl % #PtSrPmXd_key) + 1)
        doZJTqWv = (doZJTqWv + PtSrPmXd[IgAQWnMl] + hfMmfZoi) % 256
        PtSrPmXd[IgAQWnMl], PtSrPmXd[doZJTqWv] = PtSrPmXd[doZJTqWv], PtSrPmXd[IgAQWnMl]
    end
    local IgAQWnMl = 0
    local doZJTqWv = 0
    local CoAApQrh = {}
    for _, yMYiHDyn in ipairs(PtSrPmXd_data) do
        IgAQWnMl = (IgAQWnMl + 1) % 256
        doZJTqWv = (doZJTqWv + PtSrPmXd[IgAQWnMl]) % 256
        PtSrPmXd[IgAQWnMl], PtSrPmXd[doZJTqWv] = PtSrPmXd[doZJTqWv], PtSrPmXd[IgAQWnMl]
        local hfMmfZoi = PtSrPmXd[(PtSrPmXd[IgAQWnMl] + PtSrPmXd[doZJTqWv]) % 256]
        local unmasked = bit32.bxor(yMYiHDyn, KsCyYFUx)
        table.insert(CoAApQrh, string.char(bit32.bxor(unmasked, hfMmfZoi)))
    end
    return table.concat(CoAApQrh)
end

local PtSrPmXd_flat = {}
for _, chunk in ipairs(wfblEtNO) do
    for _, byte in ipairs(chunk) do
        table.insert(PtSrPmXd_flat, byte)
    end
end

local decrypted = gXfNdnMS(PtSrPmXd_flat, cbUChhhT)
local ampirwwt, AccAXkVZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PtSrPmXd_flat)
PtSrPmXd_flat = nil

if ampirwwt then 
    local result = ampirwwt() 
    decrypted = nil
    ampirwwt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(AccAXkVZ)) 
end
