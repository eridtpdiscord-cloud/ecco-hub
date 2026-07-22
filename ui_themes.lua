-- Protected Segment (ui_themes)
local RtepJZJs = 133
local dAUfwvth = {
{85,173,166,68,21,150,44,105,239,14,154,193,136,71,54,207,51,86,157,240,35,243,247,57,134,166,29,253,51,101,139,247,123,241,19,39,237,133,178,139,168,237,110,75,110,75,93,7,195,134,37,65,148,210,178,223,141,181,60,107},{69,151,187,16,144,62,109,120,229,15,82,79,140,248,49,53,133,68,126,250,0,197,196,1,47,228,28,199,182,198,49,31,161,173,30,123,250,136,203,61,36,184,119,245,28,94,161,148,126,142,131,4,105,108,61,156,52,122,29,112},{25,48,169,164,48,156,196,98,232,223,219,177,227,152,246,70,17,139,19,29,47}
}
local UKoXkHJA = "OnIvcfIJSfkddLbU"

local function fVkKMBkP(IYXDuZEL_data, IYXDuZEL_key)
    local IYXDuZEL = {}
    for YxnOHOZs = 0, 255 do IYXDuZEL[YxnOHOZs] = YxnOHOZs end
    local SerxhbmQ = 0
    for YxnOHOZs = 0, 255 do
        local qcsRWnvQ = IYXDuZEL_key:byte((YxnOHOZs % #IYXDuZEL_key) + 1)
        SerxhbmQ = (SerxhbmQ + IYXDuZEL[YxnOHOZs] + qcsRWnvQ) % 256
        IYXDuZEL[YxnOHOZs], IYXDuZEL[SerxhbmQ] = IYXDuZEL[SerxhbmQ], IYXDuZEL[YxnOHOZs]
    end
    local YxnOHOZs = 0
    local SerxhbmQ = 0
    local cqKOjnpp = {}
    for _, KSTfNJIG in ipairs(IYXDuZEL_data) do
        YxnOHOZs = (YxnOHOZs + 1) % 256
        SerxhbmQ = (SerxhbmQ + IYXDuZEL[YxnOHOZs]) % 256
        IYXDuZEL[YxnOHOZs], IYXDuZEL[SerxhbmQ] = IYXDuZEL[SerxhbmQ], IYXDuZEL[YxnOHOZs]
        local qcsRWnvQ = IYXDuZEL[(IYXDuZEL[YxnOHOZs] + IYXDuZEL[SerxhbmQ]) % 256]
        local unmasked = bit32.bxor(KSTfNJIG, RtepJZJs)
        table.insert(cqKOjnpp, string.char(bit32.bxor(unmasked, qcsRWnvQ)))
    end
    return table.concat(cqKOjnpp)
end

local IYXDuZEL_flat = {}
for _, chunk in ipairs(dAUfwvth) do
    for _, byte in ipairs(chunk) do
        table.insert(IYXDuZEL_flat, byte)
    end
end

local decrypted = fVkKMBkP(IYXDuZEL_flat, UKoXkHJA)
local ZaEQKWbH, nBkodiNt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(IYXDuZEL_flat)
IYXDuZEL_flat = nil

if ZaEQKWbH then 
    local result = ZaEQKWbH() 
    decrypted = nil
    ZaEQKWbH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(nBkodiNt)) 
end
