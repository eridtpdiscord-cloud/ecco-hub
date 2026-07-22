-- Protected Segment (tween_library)
local pTzfzWxb = 125
local xqoFbuCx = {
{250,122,68,46,222,103,130,212,232,199,185,25,156,166,183,230,18,166,19,240,70,102,132,181,2,126,30,57,91,165,120,39,254,172,130,171,31,49,203,0,207,229,158,171,245,159,25,193,35,21,253,80,195,201,147,26,11,37,104,238},{199,41,111,7,183,88,196,201,29,140,234,176,189,194,202,225,23,221,213,237,134,200,15,38,154,194,167,158,240,206,247,153,229,221,119,169,210,247,170,163,183,72,144,252,203,155,161,35,56,147,81,148,194,174,11,164,203,75,15,60},{254,12,110,184,35,249,162,145,215,52,142,237,243,122,163,55,103,216,248,244,69,109,38,224,187}
}
local jCrxkKUN = "aPETURqASrAorhTG"

local function BEcLSEbf(WrPupkzj_data, WrPupkzj_key)
    local WrPupkzj = {}
    for ovIQtLPA = 0, 255 do WrPupkzj[ovIQtLPA] = ovIQtLPA end
    local OTjRKYmF = 0
    for ovIQtLPA = 0, 255 do
        local sSMnZXIC = WrPupkzj_key:byte((ovIQtLPA % #WrPupkzj_key) + 1)
        OTjRKYmF = (OTjRKYmF + WrPupkzj[ovIQtLPA] + sSMnZXIC) % 256
        WrPupkzj[ovIQtLPA], WrPupkzj[OTjRKYmF] = WrPupkzj[OTjRKYmF], WrPupkzj[ovIQtLPA]
    end
    local ovIQtLPA = 0
    local OTjRKYmF = 0
    local opQlgjtv = {}
    for _, XjAOgdSC in ipairs(WrPupkzj_data) do
        ovIQtLPA = (ovIQtLPA + 1) % 256
        OTjRKYmF = (OTjRKYmF + WrPupkzj[ovIQtLPA]) % 256
        WrPupkzj[ovIQtLPA], WrPupkzj[OTjRKYmF] = WrPupkzj[OTjRKYmF], WrPupkzj[ovIQtLPA]
        local sSMnZXIC = WrPupkzj[(WrPupkzj[ovIQtLPA] + WrPupkzj[OTjRKYmF]) % 256]
        local unmasked = bit32.bxor(XjAOgdSC, pTzfzWxb)
        table.insert(opQlgjtv, string.char(bit32.bxor(unmasked, sSMnZXIC)))
    end
    return table.concat(opQlgjtv)
end

local WrPupkzj_flat = {}
for _, chunk in ipairs(xqoFbuCx) do
    for _, byte in ipairs(chunk) do
        table.insert(WrPupkzj_flat, byte)
    end
end

local decrypted = BEcLSEbf(WrPupkzj_flat, jCrxkKUN)
local jZICuYTA, fJgDOxUJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(WrPupkzj_flat)
WrPupkzj_flat = nil

if jZICuYTA then 
    local result = jZICuYTA() 
    decrypted = nil
    jZICuYTA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(fJgDOxUJ)) 
end
