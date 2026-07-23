-- Protected Segment (ui_themes)
local xVwqAqEt = 137
local LjKPmOoC = {
{5,140,251,227,188,149,206,88,241,112,203,116,186,52,188,102,90,105,148,64,167,110,16,165,15,169,155,203,14,88,241,39,186,46,83,43,145,235,21,216,212,195,8,180,214,52,186,176,152,8,222,32,92,108,37,154,212,244,217,56},{111,255,168,192,122,9,104,151,14,206,163,142,253,82,229,241,109,104,104,30,62,5,222,108,116,64,66,95,255,129,100,17,163,162,63,227,157,195,78,167,241,230,89,18,24,175,164,102,14,205,149,170,98,131,240,121,75,193,212,109},{168,11,56,110,76,205,230,33,199,52,176,29,180,159,172,156,56,183,73,233,78}
}
local ZdMiLjye = "WMJpyFdltfzulrGv"

local function mGIQmyUe(yOHhNLua_data, yOHhNLua_key)
    if type(yOHhNLua_key) ~= "string" or #yOHhNLua_key == 0 then return "" end
    local yOHhNLua = {}
    for AMQDGnKv = 0, 255 do yOHhNLua[AMQDGnKv] = AMQDGnKv end
    local BrNtleds = 0
    for AMQDGnKv = 0, 255 do
        local ILnsbUGf = yOHhNLua_key:byte((AMQDGnKv % #yOHhNLua_key) + 1)
        BrNtleds = (BrNtleds + yOHhNLua[AMQDGnKv] + ILnsbUGf) % 256
        yOHhNLua[AMQDGnKv], yOHhNLua[BrNtleds] = yOHhNLua[BrNtleds], yOHhNLua[AMQDGnKv]
    end
    local AMQDGnKv = 0
    local BrNtleds = 0
    local SAZnUTLk = {}
    for _, AhQHdPXG in ipairs(yOHhNLua_data) do
        AMQDGnKv = (AMQDGnKv + 1) % 256
        BrNtleds = (BrNtleds + yOHhNLua[AMQDGnKv]) % 256
        yOHhNLua[AMQDGnKv], yOHhNLua[BrNtleds] = yOHhNLua[BrNtleds], yOHhNLua[AMQDGnKv]
        local ILnsbUGf = yOHhNLua[(yOHhNLua[AMQDGnKv] + yOHhNLua[BrNtleds]) % 256]
        local unmasked = bit32.bxor(AhQHdPXG, xVwqAqEt)
        table.insert(SAZnUTLk, string.char(bit32.bxor(unmasked, ILnsbUGf)))
    end
    return table.concat(SAZnUTLk)
end

local yOHhNLua_flat = {}
for _, chunk in ipairs(LjKPmOoC) do
    for _, byte in ipairs(chunk) do
        table.insert(yOHhNLua_flat, byte)
    end
end

local decrypted = mGIQmyUe(yOHhNLua_flat, ZdMiLjye)
local PvZsJRZo, WBNeblof = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yOHhNLua_flat)
yOHhNLua_flat = nil

if PvZsJRZo then 
    local result = PvZsJRZo() 
    decrypted = nil
    PvZsJRZo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(WBNeblof)) 
end
