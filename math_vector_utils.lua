-- Protected Segment (math_vector_utils)
local iJJMJVUS = 45
local FexELZlZ = {
{73,136,67,32,132,212,216,30,146,33,21,120,40,93,14,216,250,45,165,4,203,125,125,47,193,0,121,4,32,116,23,131,211,192,180,232,99,255,62,119,4,72,173,95,66,116,62,123,246,183,109,93,224,213,100,90,97,11,79,23},{142,224,244,225,115,170,230,175,177,57,82,80,90,104,167,130,167,151,69,29,122,226,152,225,69,94,0,74,6,7,38,173,225,202,192,159,237,240,38,128,35,56,20,27,25,89,244,32,103,215,81,106,2,177,68,181,184,46,236,191},{186,89,206,75,249,191,5,72,217,147,49,134,171,205,118,236,211,102,41,18,47,41,80,66,234,87,239,75,77}
}
local nxlGvdLd = "UdPXVqEWGtGrYAyw"

local function WqoUXSAp(SHYglsTk_data, SHYglsTk_key)
    local SHYglsTk = {}
    for ohOtLahY = 0, 255 do SHYglsTk[ohOtLahY] = ohOtLahY end
    local OsqsmcHs = 0
    for ohOtLahY = 0, 255 do
        local jhzTlyFa = SHYglsTk_key:byte((ohOtLahY % #SHYglsTk_key) + 1)
        OsqsmcHs = (OsqsmcHs + SHYglsTk[ohOtLahY] + jhzTlyFa) % 256
        SHYglsTk[ohOtLahY], SHYglsTk[OsqsmcHs] = SHYglsTk[OsqsmcHs], SHYglsTk[ohOtLahY]
    end
    local ohOtLahY = 0
    local OsqsmcHs = 0
    local daERYXwR = {}
    for _, mgFvETqV in ipairs(SHYglsTk_data) do
        ohOtLahY = (ohOtLahY + 1) % 256
        OsqsmcHs = (OsqsmcHs + SHYglsTk[ohOtLahY]) % 256
        SHYglsTk[ohOtLahY], SHYglsTk[OsqsmcHs] = SHYglsTk[OsqsmcHs], SHYglsTk[ohOtLahY]
        local jhzTlyFa = SHYglsTk[(SHYglsTk[ohOtLahY] + SHYglsTk[OsqsmcHs]) % 256]
        local unmasked = bit32.bxor(mgFvETqV, iJJMJVUS)
        table.insert(daERYXwR, string.char(bit32.bxor(unmasked, jhzTlyFa)))
    end
    return table.concat(daERYXwR)
end

local SHYglsTk_flat = {}
for _, chunk in ipairs(FexELZlZ) do
    for _, byte in ipairs(chunk) do
        table.insert(SHYglsTk_flat, byte)
    end
end

local decrypted = WqoUXSAp(SHYglsTk_flat, nxlGvdLd)
local ZEjzBQTV, pkHUHjwH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SHYglsTk_flat)
SHYglsTk_flat = nil

if ZEjzBQTV then 
    local result = ZEjzBQTV() 
    decrypted = nil
    ZEjzBQTV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(pkHUHjwH)) 
end
