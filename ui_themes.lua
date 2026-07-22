-- Protected Segment (ui_themes)
local GEgaHbVJ = 240
local hbzKIPoJ = {
{35,91,30,229,54,112,45,98,128,13,63,9,166,1,46,244,25,51,201,175,253,126,177,144,87,36,237,64,85,241,99,2,52,52,182,181,50,237,240,55,132,196,89,248,129,67,3,9,102,240,134,41,177,80,240,143,184,176,119,202},{11,29,123,248,118,26,250,108,88,29,110,107,130,178,162,211,9,146,38,44,157,125,62,252,195,126,119,54,111,154,178,17,168,163,182,82,120,0,141,92,253,69,192,34,153,114,44,84,79,32,68,48,28,144,252,202,137,147,98,224},{37,43,230,247,169,225,20,237,95,227,26,78,126,82,86,210,90,213,16,51,156}
}
local duzwOVDo = "rnLGAvrchMUsyUAg"

local function DOozNElL(XimoSLog_data, XimoSLog_key)
    local XimoSLog = {}
    for hygSkndf = 0, 255 do XimoSLog[hygSkndf] = hygSkndf end
    local OlXAzLMa = 0
    for hygSkndf = 0, 255 do
        local nMBqOyut = XimoSLog_key:byte((hygSkndf % #XimoSLog_key) + 1)
        OlXAzLMa = (OlXAzLMa + XimoSLog[hygSkndf] + nMBqOyut) % 256
        XimoSLog[hygSkndf], XimoSLog[OlXAzLMa] = XimoSLog[OlXAzLMa], XimoSLog[hygSkndf]
    end
    local hygSkndf = 0
    local OlXAzLMa = 0
    local BQsWMWCj = {}
    for _, HjkuJlzQ in ipairs(XimoSLog_data) do
        hygSkndf = (hygSkndf + 1) % 256
        OlXAzLMa = (OlXAzLMa + XimoSLog[hygSkndf]) % 256
        XimoSLog[hygSkndf], XimoSLog[OlXAzLMa] = XimoSLog[OlXAzLMa], XimoSLog[hygSkndf]
        local nMBqOyut = XimoSLog[(XimoSLog[hygSkndf] + XimoSLog[OlXAzLMa]) % 256]
        local unmasked = bit32.bxor(HjkuJlzQ, GEgaHbVJ)
        table.insert(BQsWMWCj, string.char(bit32.bxor(unmasked, nMBqOyut)))
    end
    return table.concat(BQsWMWCj)
end

local XimoSLog_flat = {}
for _, chunk in ipairs(hbzKIPoJ) do
    for _, byte in ipairs(chunk) do
        table.insert(XimoSLog_flat, byte)
    end
end

local decrypted = DOozNElL(XimoSLog_flat, duzwOVDo)
local VtfbMyLb, LsZmNyFp = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(XimoSLog_flat)
XimoSLog_flat = nil

if VtfbMyLb then 
    local result = VtfbMyLb() 
    decrypted = nil
    VtfbMyLb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(LsZmNyFp)) 
end
