-- Protected Segment (anti_cheat_bypass)
local NaACeWQv = 166
local DuBMgYlT = {
{90,230,20,172,97,12,61,42,64,79,34,192,159,44,150,184,194,81,127,63,199,113,22,250,105,136,64,38,170,157,236,159,61,40,119,162,41,204,205,52,87,31,232,214,226,62,135,97,194,179,46,165,47,85,134,185,115,94,151,6},{212,35,123,32,105,48,10,41,118,255,157,252,64,68,38,107,10,18,82,211,156,191,83,221,150,57,19,53,212,144,244,104,78,53,137,173,203,16,180,215,108,93,129,75,35,116,191,224,204,218,68,198,93,132,115,37,13,105,172,159},{141,153,105,196,72,145,246,213,2,67,151,175,128,74,224,91,97,49,238,58,230,146,96,108,108,3,55,117,109}
}
local xbUMRYJi = "luNgcdergXEkLobU"

local function FYaUIKGs(JXKaGGHk_data, JXKaGGHk_key)
    local JXKaGGHk = {}
    for iNTJOjtu = 0, 255 do JXKaGGHk[iNTJOjtu] = iNTJOjtu end
    local LlqcLAKH = 0
    for iNTJOjtu = 0, 255 do
        local iOmqnXhe = JXKaGGHk_key:byte((iNTJOjtu % #JXKaGGHk_key) + 1)
        LlqcLAKH = (LlqcLAKH + JXKaGGHk[iNTJOjtu] + iOmqnXhe) % 256
        JXKaGGHk[iNTJOjtu], JXKaGGHk[LlqcLAKH] = JXKaGGHk[LlqcLAKH], JXKaGGHk[iNTJOjtu]
    end
    local iNTJOjtu = 0
    local LlqcLAKH = 0
    local oOFGsncv = {}
    for _, onGMOJFa in ipairs(JXKaGGHk_data) do
        iNTJOjtu = (iNTJOjtu + 1) % 256
        LlqcLAKH = (LlqcLAKH + JXKaGGHk[iNTJOjtu]) % 256
        JXKaGGHk[iNTJOjtu], JXKaGGHk[LlqcLAKH] = JXKaGGHk[LlqcLAKH], JXKaGGHk[iNTJOjtu]
        local iOmqnXhe = JXKaGGHk[(JXKaGGHk[iNTJOjtu] + JXKaGGHk[LlqcLAKH]) % 256]
        local unmasked = bit32.bxor(onGMOJFa, NaACeWQv)
        table.insert(oOFGsncv, string.char(bit32.bxor(unmasked, iOmqnXhe)))
    end
    return table.concat(oOFGsncv)
end

local JXKaGGHk_flat = {}
for _, chunk in ipairs(DuBMgYlT) do
    for _, byte in ipairs(chunk) do
        table.insert(JXKaGGHk_flat, byte)
    end
end

local decrypted = FYaUIKGs(JXKaGGHk_flat, xbUMRYJi)
local rOxExjlX, VmeJCkMt = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JXKaGGHk_flat)
JXKaGGHk_flat = nil

if rOxExjlX then 
    local result = rOxExjlX() 
    decrypted = nil
    rOxExjlX = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(VmeJCkMt)) 
end
