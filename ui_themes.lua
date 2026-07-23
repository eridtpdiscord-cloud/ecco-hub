-- Protected Segment (ui_themes)
local rQSoROAY = 86
local BhBkpqel = {
{4,154,26,58,196,54,219,236,253,182,232,203,139,9,166,119,193,12,164,184,94,159,210,62,94,159,125,40,198,248,0,223,217,36,76,234,134,3,92,156,223,104,129,29,39,1,244,242,187,13,239,237,211,41,144,38,202,106,229,40},{113,87,170,56,61,44,29,29,242,226,22,213,123,121,154,203,155,22,110,129,165,1,51,56,114,52,90,75,197,59,152,212,93,121,86,90,26,221,197,44,78,127,155,65,200,137,212,67,163,123,110,250,227,124,84,7,222,107,23,5},{31,238,189,94,151,216,81,184,4,210,72,188,129,134,122,59,157,102,105,128,206}
}
local VRHmPfRu = "clEoDxdspyiNJavj"

local function mGnNNMAI(kYktLIiw_data, kYktLIiw_key)
    if type(kYktLIiw_key) ~= "string" or #kYktLIiw_key == 0 then return "" end
    local kYktLIiw = {}
    for HOGWpxLb = 0, 255 do kYktLIiw[HOGWpxLb] = HOGWpxLb end
    local bAhXbyry = 0
    for HOGWpxLb = 0, 255 do
        local SXNmePfI = kYktLIiw_key:byte((HOGWpxLb % #kYktLIiw_key) + 1)
        bAhXbyry = (bAhXbyry + kYktLIiw[HOGWpxLb] + SXNmePfI) % 256
        kYktLIiw[HOGWpxLb], kYktLIiw[bAhXbyry] = kYktLIiw[bAhXbyry], kYktLIiw[HOGWpxLb]
    end
    local HOGWpxLb = 0
    local bAhXbyry = 0
    local xUJEvOBf = {}
    for _, mRvAxqja in ipairs(kYktLIiw_data) do
        HOGWpxLb = (HOGWpxLb + 1) % 256
        bAhXbyry = (bAhXbyry + kYktLIiw[HOGWpxLb]) % 256
        kYktLIiw[HOGWpxLb], kYktLIiw[bAhXbyry] = kYktLIiw[bAhXbyry], kYktLIiw[HOGWpxLb]
        local SXNmePfI = kYktLIiw[(kYktLIiw[HOGWpxLb] + kYktLIiw[bAhXbyry]) % 256]
        local unmasked = bit32.bxor(mRvAxqja, rQSoROAY)
        table.insert(xUJEvOBf, string.char(bit32.bxor(unmasked, SXNmePfI)))
    end
    return table.concat(xUJEvOBf)
end

local kYktLIiw_flat = {}
for _, chunk in ipairs(BhBkpqel) do
    for _, byte in ipairs(chunk) do
        table.insert(kYktLIiw_flat, byte)
    end
end

local decrypted = mGnNNMAI(kYktLIiw_flat, VRHmPfRu)
local nEYAzIRV, smrGmpIr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(kYktLIiw_flat)
kYktLIiw_flat = nil

if nEYAzIRV then 
    local result = nEYAzIRV() 
    decrypted = nil
    nEYAzIRV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(smrGmpIr)) 
end
