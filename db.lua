-- Compiled secure segment
local KNuQmJYc = {
{214,160,44,218,102,146,56,152,216,189,117,253,188,231,199,252,83,30,200,227,190,203,108,201,75,127,226,114,22,12,9,140,119,2,19,174,211,179,94,156,151,108,110,151,40,243,163,80,184,191,241,22,125,140,196,13,136,198,187,142},{0,28,65,140,189,116,180,209,137,121,60,250,94,223,191,52,115,30,170,35,4,253,54,227,163,165,236,143,122,1,220,160,234,127,73,211,252,141,15,255,104,58,171,196,227,103,51,31,192,255,77,214,129,51,55,125,173,186,205,90},{12,41,249,22,94,236,157,23,236,168,128,175,205,2,97,27,18,41,45,225,39,25,195,113,102,231,113,124,252,3,215,217,84,124,180,25,155,83,25,138,90,101,171,216,173,123,37,143,39,123,239,218,75,199,166,136,186,40,118,110},{20,26,132,66,112,232,105,211,15,142,163,1,161,75,173,120,20,135,181,88,80,35,153,205,45,150,129,64,81,187,68,179,92,104,14,240,227,12,226,184,25,161,177,93,118,42,16,241,135,46,245,238,30,238,11,51}
}
local mwwvYQca = "bzedYdWlqXZagaGO"

local function QTFBNCyY(KncBbOjX_data, KncBbOjX_key)
    local KncBbOjX = {}
    for YLusgidb = 0, 255 do KncBbOjX[YLusgidb] = YLusgidb end
    local SkgavHaQ = 0
    for YLusgidb = 0, 255 do
        local pWzNrTIW = KncBbOjX_key:byte((YLusgidb % #KncBbOjX_key) + 1)
        SkgavHaQ = (SkgavHaQ + KncBbOjX[YLusgidb] + pWzNrTIW) % 256
        KncBbOjX[YLusgidb], KncBbOjX[SkgavHaQ] = KncBbOjX[SkgavHaQ], KncBbOjX[YLusgidb]
    end
    local YLusgidb = 0
    local SkgavHaQ = 0
    local jjvZzqiw = {}
    for _, yxDBEZDv in ipairs(KncBbOjX_data) do
        YLusgidb = (YLusgidb + 1) % 256
        SkgavHaQ = (SkgavHaQ + KncBbOjX[YLusgidb]) % 256
        KncBbOjX[YLusgidb], KncBbOjX[SkgavHaQ] = KncBbOjX[SkgavHaQ], KncBbOjX[YLusgidb]
        local pWzNrTIW = KncBbOjX[(KncBbOjX[YLusgidb] + KncBbOjX[SkgavHaQ]) % 256]
        table.insert(jjvZzqiw, string.char(bit32.bxor(yxDBEZDv, pWzNrTIW)))
    end
    return table.concat(jjvZzqiw)
end

local KncBbOjX_flat = {}
for _, chunk in ipairs(KNuQmJYc) do
    for _, byte in ipairs(chunk) do
        table.insert(KncBbOjX_flat, byte)
    end
end

local decrypted = QTFBNCyY(KncBbOjX_flat, mwwvYQca)
local qFGMTbZK, VTtmMhXE = loadstring(decrypted)
if qFGMTbZK then 
    return qFGMTbZK() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(VTtmMhXE)) 
end
