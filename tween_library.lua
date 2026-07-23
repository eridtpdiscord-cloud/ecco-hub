-- Protected Segment (tween_library)
local VsMEuEpe = 197
local lrXvvtvM = {
{196,166,115,110,214,166,126,80,213,140,47,142,36,21,187,45,21,137,223,197,48,59,104,50,90,77,139,85,6,243,193,172,255,118,126,157,226,210,89,60,207,240,169,17,168,161,2,124,241,168,217,63,211,217,245,78,17,190,103,19},{16,112,145,205,68,150,144,36,106,110,148,90,14,151,160,64,93,42,147,16,192,121,31,218,144,152,166,129,38,84,80,167,92,22,69,82,137,58,12,224,9,138,148,124,140,245,180,4,135,168,56,166,100,195,206,133,64,180,253,103},{73,154,70,7,252,59,18,210,41,99,41,4,155,90,170,98,142,203,102,234,150,247,138,123,188}
}
local EQtkMKiJ = "NWwoHoFmobaAGVMO"

local function naBYTrow(WFpLtFwY_data, WFpLtFwY_key)
    if type(WFpLtFwY_key) ~= "string" or #WFpLtFwY_key == 0 then return "" end
    local WFpLtFwY = {}
    for sEnkQmmc = 0, 255 do WFpLtFwY[sEnkQmmc] = sEnkQmmc end
    local mFBFGvoa = 0
    for sEnkQmmc = 0, 255 do
        local aqpTXxqI = WFpLtFwY_key:byte((sEnkQmmc % #WFpLtFwY_key) + 1)
        mFBFGvoa = (mFBFGvoa + WFpLtFwY[sEnkQmmc] + aqpTXxqI) % 256
        WFpLtFwY[sEnkQmmc], WFpLtFwY[mFBFGvoa] = WFpLtFwY[mFBFGvoa], WFpLtFwY[sEnkQmmc]
    end
    local sEnkQmmc = 0
    local mFBFGvoa = 0
    local zCJkRecR = {}
    for _, lqmiJnVE in ipairs(WFpLtFwY_data) do
        sEnkQmmc = (sEnkQmmc + 1) % 256
        mFBFGvoa = (mFBFGvoa + WFpLtFwY[sEnkQmmc]) % 256
        WFpLtFwY[sEnkQmmc], WFpLtFwY[mFBFGvoa] = WFpLtFwY[mFBFGvoa], WFpLtFwY[sEnkQmmc]
        local aqpTXxqI = WFpLtFwY[(WFpLtFwY[sEnkQmmc] + WFpLtFwY[mFBFGvoa]) % 256]
        local unmasked = bit32.bxor(lqmiJnVE, VsMEuEpe)
        table.insert(zCJkRecR, string.char(bit32.bxor(unmasked, aqpTXxqI)))
    end
    return table.concat(zCJkRecR)
end

local WFpLtFwY_flat = {}
for _, chunk in ipairs(lrXvvtvM) do
    for _, byte in ipairs(chunk) do
        table.insert(WFpLtFwY_flat, byte)
    end
end

local decrypted = naBYTrow(WFpLtFwY_flat, EQtkMKiJ)
local AjRgFWuy, ynKUZSiC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(WFpLtFwY_flat)
WFpLtFwY_flat = nil

if AjRgFWuy then 
    local result = AjRgFWuy() 
    decrypted = nil
    AjRgFWuy = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(ynKUZSiC)) 
end
