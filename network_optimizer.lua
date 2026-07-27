-- Protected Segment (network_optimizer)
local QUrORhXU = 251
local aTrDVhiE = {
{189,228,217,209,154,221,42,164,58,138,195,71,62,213,54,106,158,161,29,97,80,197,105,73,139,65,247,240,49,49,248,222,126,198,30,222,170,255,253,103,111,93,192,25,10,110,87,92,112,244,177,205,187,178,97,132,21,122,251,78},{140,29,252,43,230,191,195,86,191,46,95,177,201,165,50,136,211,20,231,93,63,199,247,92,180,64,41,161,242,169,230,97,99,223,135,183,165,147,59,166,95,8,202,26,147,213,49,40,8,251,238,136,192,239,221,150,92,200,69,221},{90,102,85,66,116,177,73,105,200,254,110,10,130,62,197,175,24,41,121,146,29,242,110,89,233,250,107,224,232}
}
local fSiLkpSM = "tskAvTVszhsqAqbt"

local function cGMwioOq(ATzYCZtj_data, ATzYCZtj_key)
    if type(ATzYCZtj_key) ~= "string" or #ATzYCZtj_key == 0 then return "" end
    local ATzYCZtj = {}
    for vUrBAUxN = 0, 255 do ATzYCZtj[vUrBAUxN] = vUrBAUxN end
    local uVFUZClh = 0
    for vUrBAUxN = 0, 255 do
        local ZWIiTjrQ = ATzYCZtj_key:byte((vUrBAUxN % #ATzYCZtj_key) + 1)
        uVFUZClh = (uVFUZClh + ATzYCZtj[vUrBAUxN] + ZWIiTjrQ) % 256
        ATzYCZtj[vUrBAUxN], ATzYCZtj[uVFUZClh] = ATzYCZtj[uVFUZClh], ATzYCZtj[vUrBAUxN]
    end
    local vUrBAUxN = 0
    local uVFUZClh = 0
    local YNgmbFgV = {}
    for _, VgiIedak in ipairs(ATzYCZtj_data) do
        vUrBAUxN = (vUrBAUxN + 1) % 256
        uVFUZClh = (uVFUZClh + ATzYCZtj[vUrBAUxN]) % 256
        ATzYCZtj[vUrBAUxN], ATzYCZtj[uVFUZClh] = ATzYCZtj[uVFUZClh], ATzYCZtj[vUrBAUxN]
        local ZWIiTjrQ = ATzYCZtj[(ATzYCZtj[vUrBAUxN] + ATzYCZtj[uVFUZClh]) % 256]
        local unmasked = bit32.bxor(VgiIedak, QUrORhXU)
        table.insert(YNgmbFgV, string.char(bit32.bxor(unmasked, ZWIiTjrQ)))
    end
    return table.concat(YNgmbFgV)
end

local ATzYCZtj_flat = {}
for _, chunk in ipairs(aTrDVhiE) do
    for _, byte in ipairs(chunk) do
        table.insert(ATzYCZtj_flat, byte)
    end
end

local decrypted = cGMwioOq(ATzYCZtj_flat, fSiLkpSM)
local NkGJhqmQ, HawRMiNF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ATzYCZtj_flat)
ATzYCZtj_flat = nil

if NkGJhqmQ then 
    local result = NkGJhqmQ() 
    decrypted = nil
    NkGJhqmQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(HawRMiNF)) 
end
