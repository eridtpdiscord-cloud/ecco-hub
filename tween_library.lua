-- Protected Segment (tween_library)
local KzrezvYq = 185
local fPbGQJTZ = {
{59,189,182,243,192,176,115,228,14,200,128,169,165,39,91,50,85,86,224,11,68,115,35,244,86,166,251,164,189,170,220,107,72,210,99,116,182,143,13,234,59,30,181,232,155,203,244,82,184,227,113,191,105,150,174,120,178,197,50,237},{231,64,246,214,143,231,115,150,228,15,198,220,30,26,186,234,166,171,110,240,67,90,204,190,136,137,156,32,239,203,4,212,83,42,213,177,221,56,109,51,15,169,160,123,101,76,69,250,200,163,160,65,78,36,149,161,28,214,131,16},{194,139,0,154,150,193,148,175,39,38,119,177,234,214,204,62,61,24,85,110,68,104,214,208,197}
}
local zCWrxKsA = "HXadaMafaDlGspXc"

local function oUIhhJKn(cqYKFXuH_data, cqYKFXuH_key)
    local cqYKFXuH = {}
    for YNaghKha = 0, 255 do cqYKFXuH[YNaghKha] = YNaghKha end
    local xqMHaNve = 0
    for YNaghKha = 0, 255 do
        local CpDBqUvt = cqYKFXuH_key:byte((YNaghKha % #cqYKFXuH_key) + 1)
        xqMHaNve = (xqMHaNve + cqYKFXuH[YNaghKha] + CpDBqUvt) % 256
        cqYKFXuH[YNaghKha], cqYKFXuH[xqMHaNve] = cqYKFXuH[xqMHaNve], cqYKFXuH[YNaghKha]
    end
    local YNaghKha = 0
    local xqMHaNve = 0
    local jQYgbxlk = {}
    for _, kuYOyETY in ipairs(cqYKFXuH_data) do
        YNaghKha = (YNaghKha + 1) % 256
        xqMHaNve = (xqMHaNve + cqYKFXuH[YNaghKha]) % 256
        cqYKFXuH[YNaghKha], cqYKFXuH[xqMHaNve] = cqYKFXuH[xqMHaNve], cqYKFXuH[YNaghKha]
        local CpDBqUvt = cqYKFXuH[(cqYKFXuH[YNaghKha] + cqYKFXuH[xqMHaNve]) % 256]
        local unmasked = bit32.bxor(kuYOyETY, KzrezvYq)
        table.insert(jQYgbxlk, string.char(bit32.bxor(unmasked, CpDBqUvt)))
    end
    return table.concat(jQYgbxlk)
end

local cqYKFXuH_flat = {}
for _, chunk in ipairs(fPbGQJTZ) do
    for _, byte in ipairs(chunk) do
        table.insert(cqYKFXuH_flat, byte)
    end
end

local decrypted = oUIhhJKn(cqYKFXuH_flat, zCWrxKsA)
local XGmDpFHC, VVUrxeRh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(cqYKFXuH_flat)
cqYKFXuH_flat = nil

if XGmDpFHC then 
    local result = XGmDpFHC() 
    decrypted = nil
    XGmDpFHC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(VVUrxeRh)) 
end
