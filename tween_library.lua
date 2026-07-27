-- Protected Segment (tween_library)
local RdgTpRYw = 111
local zkWDgJBL = {
{170,70,90,232,209,120,169,181,187,159,233,81,21,144,19,194,108,240,222,75,191,225,14,154,155,200,237,174,210,123,14,93,83,181,67,191,74,165,186,162,191,135,69,85,221,154,40,54,105,228,230,10,58,243,5,172,58,81,243,243},{21,26,222,9,239,198,100,73,175,186,3,103,212,196,223,215,142,83,179,86,191,27,192,156,42,143,45,113,202,9,18,169,226,98,90,44,45,134,9,30,251,250,216,148,176,251,103,191,183,129,233,43,25,126,232,164,91,148,22,130},{221,175,251,202,55,52,246,31,145,139,215,10,174,253,154,98,95,174,209,20,67,118,6,82,43}
}
local zsIYJWJa = "ltRZXGUqgjJnFHhZ"

local function LepPbCAk(DvrqBwjt_data, DvrqBwjt_key)
    if type(DvrqBwjt_key) ~= "string" or #DvrqBwjt_key == 0 then return "" end
    local DvrqBwjt = {}
    for QArOkxmM = 0, 255 do DvrqBwjt[QArOkxmM] = QArOkxmM end
    local BljPduNX = 0
    for QArOkxmM = 0, 255 do
        local GjEsKyFb = DvrqBwjt_key:byte((QArOkxmM % #DvrqBwjt_key) + 1)
        BljPduNX = (BljPduNX + DvrqBwjt[QArOkxmM] + GjEsKyFb) % 256
        DvrqBwjt[QArOkxmM], DvrqBwjt[BljPduNX] = DvrqBwjt[BljPduNX], DvrqBwjt[QArOkxmM]
    end
    local QArOkxmM = 0
    local BljPduNX = 0
    local ULOMxSUU = {}
    for _, MqoTRpTK in ipairs(DvrqBwjt_data) do
        QArOkxmM = (QArOkxmM + 1) % 256
        BljPduNX = (BljPduNX + DvrqBwjt[QArOkxmM]) % 256
        DvrqBwjt[QArOkxmM], DvrqBwjt[BljPduNX] = DvrqBwjt[BljPduNX], DvrqBwjt[QArOkxmM]
        local GjEsKyFb = DvrqBwjt[(DvrqBwjt[QArOkxmM] + DvrqBwjt[BljPduNX]) % 256]
        local unmasked = bit32.bxor(MqoTRpTK, RdgTpRYw)
        table.insert(ULOMxSUU, string.char(bit32.bxor(unmasked, GjEsKyFb)))
    end
    return table.concat(ULOMxSUU)
end

local DvrqBwjt_flat = {}
for _, chunk in ipairs(zkWDgJBL) do
    for _, byte in ipairs(chunk) do
        table.insert(DvrqBwjt_flat, byte)
    end
end

local decrypted = LepPbCAk(DvrqBwjt_flat, zsIYJWJa)
local AFSJmTDo, BAvJLJZl = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(DvrqBwjt_flat)
DvrqBwjt_flat = nil

if AFSJmTDo then 
    local result = AFSJmTDo() 
    decrypted = nil
    AFSJmTDo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(BAvJLJZl)) 
end
