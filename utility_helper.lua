-- Protected Segment (utility_helper)
local toDXoRCE = 69
local hWdpzHQz = {
{204,74,142,253,244,65,112,74,144,229,243,144,89,11,119,7,96,182,171,17,250,229,52,137,255,99,140,252,151,181,248,97,7,95,253,244,115,197,249,158,65,192,24,106,245,230,187,222,115,96,244,209,184,182,160,242,233,252,196,84},{96,146,29,47,193,56,206,86,173,123,30,215,132,205,52,171,50,48,148,23,179,219,230,252,245,155,47,116,246,32,114,21,220,42,186,223,146,120,12,231,100,185,145,83,57,187,38,59,119,189,12,250,247,249,69,26,58,155,84,44},{89,141,180,102,83,236,151,40,153,180,157,97,76,244,121,81,196,74,150,81,125,175,35,53,139,6}
}
local fQEplixN = "tiOmrfXOutbawODI"

local function zBCtuQGd(kkrAaFkJ_data, kkrAaFkJ_key)
    if type(kkrAaFkJ_key) ~= "string" or #kkrAaFkJ_key == 0 then return "" end
    local kkrAaFkJ = {}
    for KoCWUJqp = 0, 255 do kkrAaFkJ[KoCWUJqp] = KoCWUJqp end
    local cEScPOui = 0
    for KoCWUJqp = 0, 255 do
        local mpoXdfVA = kkrAaFkJ_key:byte((KoCWUJqp % #kkrAaFkJ_key) + 1)
        cEScPOui = (cEScPOui + kkrAaFkJ[KoCWUJqp] + mpoXdfVA) % 256
        kkrAaFkJ[KoCWUJqp], kkrAaFkJ[cEScPOui] = kkrAaFkJ[cEScPOui], kkrAaFkJ[KoCWUJqp]
    end
    local KoCWUJqp = 0
    local cEScPOui = 0
    local VtXFdWPH = {}
    for _, uHZNsnJk in ipairs(kkrAaFkJ_data) do
        KoCWUJqp = (KoCWUJqp + 1) % 256
        cEScPOui = (cEScPOui + kkrAaFkJ[KoCWUJqp]) % 256
        kkrAaFkJ[KoCWUJqp], kkrAaFkJ[cEScPOui] = kkrAaFkJ[cEScPOui], kkrAaFkJ[KoCWUJqp]
        local mpoXdfVA = kkrAaFkJ[(kkrAaFkJ[KoCWUJqp] + kkrAaFkJ[cEScPOui]) % 256]
        local unmasked = bit32.bxor(uHZNsnJk, toDXoRCE)
        table.insert(VtXFdWPH, string.char(bit32.bxor(unmasked, mpoXdfVA)))
    end
    return table.concat(VtXFdWPH)
end

local kkrAaFkJ_flat = {}
for _, chunk in ipairs(hWdpzHQz) do
    for _, byte in ipairs(chunk) do
        table.insert(kkrAaFkJ_flat, byte)
    end
end

local decrypted = zBCtuQGd(kkrAaFkJ_flat, fQEplixN)
local sHTbFFok, WISBNCEm = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(kkrAaFkJ_flat)
kkrAaFkJ_flat = nil

if sHTbFFok then 
    local result = sHTbFFok() 
    decrypted = nil
    sHTbFFok = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(WISBNCEm)) 
end
