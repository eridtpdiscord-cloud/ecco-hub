-- Protected Segment (ui_themes)
local tglUMxhW = 28
local uSJFXMqB = {
{20,26,73,54,86,172,147,181,67,184,154,16,109,88,141,52,114,63,117,43,194,238,253,104,76,236,192,232,210,68,159,217,227,185,53,71,96,228,119,163,54,149,161,67,248,74,223,156,186,66,10,28,246,25,214,57,117,102,154,242},{69,180,169,208,187,27,137,70,78,29,218,121,236,232,91,217,103,70,69,45,144,114,122,126,191,159,35,100,80,205,148,198,63,112,169,3,130,137,115,37,51,157,196,242,204,146,226,95,13,96,21,72,57,58,68,72,112,228,81,164},{225,147,81,235,148,232,164,168,199,219,111,119,7,212,7,48,34,66,200,240,127}
}
local vWFnTVCU = "gdekkJjNAgNNetmd"

local function xRHtFpGl(rQqbKIpi_data, rQqbKIpi_key)
    local rQqbKIpi = {}
    for XMoJVLjG = 0, 255 do rQqbKIpi[XMoJVLjG] = XMoJVLjG end
    local cOtMiLxu = 0
    for XMoJVLjG = 0, 255 do
        local kZDTLcvp = rQqbKIpi_key:byte((XMoJVLjG % #rQqbKIpi_key) + 1)
        cOtMiLxu = (cOtMiLxu + rQqbKIpi[XMoJVLjG] + kZDTLcvp) % 256
        rQqbKIpi[XMoJVLjG], rQqbKIpi[cOtMiLxu] = rQqbKIpi[cOtMiLxu], rQqbKIpi[XMoJVLjG]
    end
    local XMoJVLjG = 0
    local cOtMiLxu = 0
    local TfpwZUMu = {}
    for _, oZjwBxGT in ipairs(rQqbKIpi_data) do
        XMoJVLjG = (XMoJVLjG + 1) % 256
        cOtMiLxu = (cOtMiLxu + rQqbKIpi[XMoJVLjG]) % 256
        rQqbKIpi[XMoJVLjG], rQqbKIpi[cOtMiLxu] = rQqbKIpi[cOtMiLxu], rQqbKIpi[XMoJVLjG]
        local kZDTLcvp = rQqbKIpi[(rQqbKIpi[XMoJVLjG] + rQqbKIpi[cOtMiLxu]) % 256]
        local unmasked = bit32.bxor(oZjwBxGT, tglUMxhW)
        table.insert(TfpwZUMu, string.char(bit32.bxor(unmasked, kZDTLcvp)))
    end
    return table.concat(TfpwZUMu)
end

local rQqbKIpi_flat = {}
for _, chunk in ipairs(uSJFXMqB) do
    for _, byte in ipairs(chunk) do
        table.insert(rQqbKIpi_flat, byte)
    end
end

local decrypted = xRHtFpGl(rQqbKIpi_flat, vWFnTVCU)
local KQUcJlBA, TvcVUjvs = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(rQqbKIpi_flat)
rQqbKIpi_flat = nil

if KQUcJlBA then 
    local result = KQUcJlBA() 
    decrypted = nil
    KQUcJlBA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(TvcVUjvs)) 
end
