-- Protected Segment (tween_library)
local JUlTKSlb = 200
local yQAIwqnC = {
{75,229,145,168,13,19,38,197,9,209,75,134,60,40,127,57,78,230,33,11,245,74,207,107,222,202,32,143,246,79,131,108,107,163,121,198,152,159,224,177,120,153,6,175,70,134,42,49,156,107,33,11,115,206,120,74,159,250,252,47},{173,20,138,69,218,218,85,141,189,120,48,6,26,129,138,32,13,248,52,126,146,133,118,135,57,63,165,57,201,68,5,127,16,47,212,25,79,215,94,93,137,12,83,13,125,101,253,90,12,66,159,23,191,78,249,42,121,136,6,140},{177,84,186,230,199,63,119,38,78,160,175,90,41,199,44,231,140,121,180,39,58,111,155,50,71}
}
local TaERxsEm = "essXANdvhFXgmCgA"

local function MKNqlaYa(pWpLwqlT_data, pWpLwqlT_key)
    local pWpLwqlT = {}
    for wjAJPofw = 0, 255 do pWpLwqlT[wjAJPofw] = wjAJPofw end
    local yskGbDNE = 0
    for wjAJPofw = 0, 255 do
        local PZxgrkpV = pWpLwqlT_key:byte((wjAJPofw % #pWpLwqlT_key) + 1)
        yskGbDNE = (yskGbDNE + pWpLwqlT[wjAJPofw] + PZxgrkpV) % 256
        pWpLwqlT[wjAJPofw], pWpLwqlT[yskGbDNE] = pWpLwqlT[yskGbDNE], pWpLwqlT[wjAJPofw]
    end
    local wjAJPofw = 0
    local yskGbDNE = 0
    local WfQknBfV = {}
    for _, KAvevUMc in ipairs(pWpLwqlT_data) do
        wjAJPofw = (wjAJPofw + 1) % 256
        yskGbDNE = (yskGbDNE + pWpLwqlT[wjAJPofw]) % 256
        pWpLwqlT[wjAJPofw], pWpLwqlT[yskGbDNE] = pWpLwqlT[yskGbDNE], pWpLwqlT[wjAJPofw]
        local PZxgrkpV = pWpLwqlT[(pWpLwqlT[wjAJPofw] + pWpLwqlT[yskGbDNE]) % 256]
        local unmasked = bit32.bxor(KAvevUMc, JUlTKSlb)
        table.insert(WfQknBfV, string.char(bit32.bxor(unmasked, PZxgrkpV)))
    end
    return table.concat(WfQknBfV)
end

local pWpLwqlT_flat = {}
for _, chunk in ipairs(yQAIwqnC) do
    for _, byte in ipairs(chunk) do
        table.insert(pWpLwqlT_flat, byte)
    end
end

local decrypted = MKNqlaYa(pWpLwqlT_flat, TaERxsEm)
local odeAYmoY, kEOlJrkd = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pWpLwqlT_flat)
pWpLwqlT_flat = nil

if odeAYmoY then 
    local result = odeAYmoY() 
    decrypted = nil
    odeAYmoY = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(kEOlJrkd)) 
end
