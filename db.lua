-- Compiled secure segment
local qzJFwbwi = {
{77,201,232,208,167,27,149,242,208,100,13,167,242,202,61,188,54,26,23,155,25,203,134,126,123,32,78,120,102,192,73,30,7,150,131,214,110,150,99,52,144,243,138,226,187,42,15,60,100,138,153,211,119,40,236,121,141,83,147,213},{182,36,228,34,204,254,57,126,100,63,39,101,17,188,23,35,151,71,192,233,124,206,224,3,213,73,42,6,242,47,196,83,40,164,188,47,200,55,41,72,62,57,148,231,116,166,122,194,140,70,42,170,138,194,230,59,120,213,235,178},{89,183,239,83,78,107,8,172,220,45,208,215,210,26,167,219,14,232,161,72,168,34,236,5,1,213,118,66,113,84,228,235,227,214,90,115,238,144,251,137,171,103,230,45,197,200,214,210,250,152,222,223,72,224,47,1,112,119,82,137},{107,69,64,25,148,218,240,156,32,209,33,32,27,74,101,4,92,86,100,34,242,123,109,43,162,156,220,240,238,47,116,106,31,13,195,98,16,219,139,210,245,154,154,71,78,74,94,157,90,15,232,65,65,250,116,62,167,227,167,127},{104,71,191,139,39,67,251,83,209,32,124,29,52,229,105,209,169,46,45,113,15,0,181,60,91,186,58,70,85,109,169,253,245,250,255,145,79,82,193,114,208,199,118,40,79,34,167,15,111,215,6,227,78,121,92,19,133,71,186,67},{142,78,154,230,76,245,113,188,109,92,1,219,170,17,238,87,70,161,196,106,240,124,225,188,101,71,169,97,30,186,192,178,162,67,202,88,60,74,44,8,132,75,101,223,234,139,223,115,16,247,56,111,4,0,242,78,252,214,136,210},{221,163,36,204,38,66,217,17,235,30,242,170,236,4,83,219,173,0,77,222,146,61,97,232,137,162,21,143,182,121,156,63,16,98,50,172,133,140,95,251,70,161,195,51,222}
}
local NRqvMCdA = "rOSygKkcNzMfQFYD"

local function ttNvbJJE(jIaUaAUy_data, jIaUaAUy_key)
    local jIaUaAUy = {}
    for PYorIUkd = 0, 255 do jIaUaAUy[PYorIUkd] = PYorIUkd end
    local hiamlYGL = 0
    for PYorIUkd = 0, 255 do
        local tGfGhZoI = jIaUaAUy_key:byte((PYorIUkd % #jIaUaAUy_key) + 1)
        hiamlYGL = (hiamlYGL + jIaUaAUy[PYorIUkd] + tGfGhZoI) % 256
        jIaUaAUy[PYorIUkd], jIaUaAUy[hiamlYGL] = jIaUaAUy[hiamlYGL], jIaUaAUy[PYorIUkd]
    end
    local PYorIUkd = 0
    local hiamlYGL = 0
    local xnlHJJpz = {}
    for _, nXhVEqyR in ipairs(jIaUaAUy_data) do
        PYorIUkd = (PYorIUkd + 1) % 256
        hiamlYGL = (hiamlYGL + jIaUaAUy[PYorIUkd]) % 256
        jIaUaAUy[PYorIUkd], jIaUaAUy[hiamlYGL] = jIaUaAUy[hiamlYGL], jIaUaAUy[PYorIUkd]
        local tGfGhZoI = jIaUaAUy[(jIaUaAUy[PYorIUkd] + jIaUaAUy[hiamlYGL]) % 256]
        table.insert(xnlHJJpz, string.char(bit32.bxor(nXhVEqyR, tGfGhZoI)))
    end
    return table.concat(xnlHJJpz)
end

local jIaUaAUy_flat = {}
for _, chunk in ipairs(qzJFwbwi) do
    for _, byte in ipairs(chunk) do
        table.insert(jIaUaAUy_flat, byte)
    end
end

local decrypted = ttNvbJJE(jIaUaAUy_flat, NRqvMCdA)
local XbcnEBgc, xJGGthlr = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(jIaUaAUy_flat)
jIaUaAUy_flat = nil

if XbcnEBgc then 
    local result = XbcnEBgc() 
    decrypted = nil
    XbcnEBgc = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(xJGGthlr)) 
end
