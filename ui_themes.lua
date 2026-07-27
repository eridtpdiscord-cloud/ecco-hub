-- Protected Segment (ui_themes)
local oMQqMian = 145
local UrzpptJR = {
{19,44,144,157,175,227,128,181,95,110,35,32,42,209,119,113,155,19,59,98,235,210,9,246,239,98,61,240,217,57,82,128,69,206,98,135,106,229,114,65,242,57,217,234,104,100,163,111,72,179,217,91,246,21,201,133,86,21,43,41},{5,189,126,185,186,155,184,150,100,128,97,8,50,184,17,156,60,20,173,119,221,236,64,218,141,47,28,14,74,30,215,64,121,88,31,29,133,233,255,240,250,108,14,92,198,57,203,91,198,197,209,119,36,115,249,235,174,119,103,7},{42,82,91,164,24,243,131,74,235,78,218,166,114,52,117,88,36,180,52,30,159}
}
local OdzBvsDd = "rzWNjVqfeeRAeNAf"

local function lRVCPpVp(dmCzFiFo_data, dmCzFiFo_key)
    if type(dmCzFiFo_key) ~= "string" or #dmCzFiFo_key == 0 then return "" end
    local dmCzFiFo = {}
    for GDjWVrbf = 0, 255 do dmCzFiFo[GDjWVrbf] = GDjWVrbf end
    local MlTLFrwJ = 0
    for GDjWVrbf = 0, 255 do
        local dgoEyFHN = dmCzFiFo_key:byte((GDjWVrbf % #dmCzFiFo_key) + 1)
        MlTLFrwJ = (MlTLFrwJ + dmCzFiFo[GDjWVrbf] + dgoEyFHN) % 256
        dmCzFiFo[GDjWVrbf], dmCzFiFo[MlTLFrwJ] = dmCzFiFo[MlTLFrwJ], dmCzFiFo[GDjWVrbf]
    end
    local GDjWVrbf = 0
    local MlTLFrwJ = 0
    local WXRMgNUO = {}
    for _, oFmiEEwi in ipairs(dmCzFiFo_data) do
        GDjWVrbf = (GDjWVrbf + 1) % 256
        MlTLFrwJ = (MlTLFrwJ + dmCzFiFo[GDjWVrbf]) % 256
        dmCzFiFo[GDjWVrbf], dmCzFiFo[MlTLFrwJ] = dmCzFiFo[MlTLFrwJ], dmCzFiFo[GDjWVrbf]
        local dgoEyFHN = dmCzFiFo[(dmCzFiFo[GDjWVrbf] + dmCzFiFo[MlTLFrwJ]) % 256]
        local unmasked = bit32.bxor(oFmiEEwi, oMQqMian)
        table.insert(WXRMgNUO, string.char(bit32.bxor(unmasked, dgoEyFHN)))
    end
    return table.concat(WXRMgNUO)
end

local dmCzFiFo_flat = {}
for _, chunk in ipairs(UrzpptJR) do
    for _, byte in ipairs(chunk) do
        table.insert(dmCzFiFo_flat, byte)
    end
end

local decrypted = lRVCPpVp(dmCzFiFo_flat, OdzBvsDd)
local HhjhTcLY, MAvwczMJ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(dmCzFiFo_flat)
dmCzFiFo_flat = nil

if HhjhTcLY then 
    local result = HhjhTcLY() 
    decrypted = nil
    HhjhTcLY = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(MAvwczMJ)) 
end
