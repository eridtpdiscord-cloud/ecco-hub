-- Protected Segment (anti_cheat_bypass)
local FpYBinkA = 218
local fEqLyOpd = {
{118,56,250,143,101,24,179,176,88,56,215,237,192,161,166,66,159,33,225,123,151,81,250,201,237,2,47,11,3,147,255,213,165,69,155,90,125,217,94,151,176,130,76,108,30,210,119,242,80,69,200,52,155,52,135,91,209,1,149,238},{59,15,73,143,239,34,73,90,21,163,49,146,246,148,118,170,209,77,206,89,184,223,226,132,9,102,235,149,231,54,132,219,243,101,46,173,246,98,88,193,128,155,171,235,111,204,202,230,83,10,213,77,30,13,113,109,165,34,228,29},{220,163,240,227,134,217,233,104,27,190,244,222,21,68,89,119,149,193,180,141,199,249,103,3,79,137,63,220,20}
}
local vqWGLAyl = "XhLuclsJbZvsIOPN"

local function WFgdZTUX(LBybbtEC_data, LBybbtEC_key)
    if type(LBybbtEC_key) ~= "string" or #LBybbtEC_key == 0 then return "" end
    local LBybbtEC = {}
    for wkdGZkOU = 0, 255 do LBybbtEC[wkdGZkOU] = wkdGZkOU end
    local virLDThe = 0
    for wkdGZkOU = 0, 255 do
        local xxaBfCRp = LBybbtEC_key:byte((wkdGZkOU % #LBybbtEC_key) + 1)
        virLDThe = (virLDThe + LBybbtEC[wkdGZkOU] + xxaBfCRp) % 256
        LBybbtEC[wkdGZkOU], LBybbtEC[virLDThe] = LBybbtEC[virLDThe], LBybbtEC[wkdGZkOU]
    end
    local wkdGZkOU = 0
    local virLDThe = 0
    local gEgLsxVt = {}
    for _, dBZeFlAI in ipairs(LBybbtEC_data) do
        wkdGZkOU = (wkdGZkOU + 1) % 256
        virLDThe = (virLDThe + LBybbtEC[wkdGZkOU]) % 256
        LBybbtEC[wkdGZkOU], LBybbtEC[virLDThe] = LBybbtEC[virLDThe], LBybbtEC[wkdGZkOU]
        local xxaBfCRp = LBybbtEC[(LBybbtEC[wkdGZkOU] + LBybbtEC[virLDThe]) % 256]
        local unmasked = bit32.bxor(dBZeFlAI, FpYBinkA)
        table.insert(gEgLsxVt, string.char(bit32.bxor(unmasked, xxaBfCRp)))
    end
    return table.concat(gEgLsxVt)
end

local LBybbtEC_flat = {}
for _, chunk in ipairs(fEqLyOpd) do
    for _, byte in ipairs(chunk) do
        table.insert(LBybbtEC_flat, byte)
    end
end

local decrypted = WFgdZTUX(LBybbtEC_flat, vqWGLAyl)
local EWHRRGIM, fXpeOtBC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(LBybbtEC_flat)
LBybbtEC_flat = nil

if EWHRRGIM then 
    local result = EWHRRGIM() 
    decrypted = nil
    EWHRRGIM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(fXpeOtBC)) 
end
