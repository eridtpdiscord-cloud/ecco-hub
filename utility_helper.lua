-- Compiled secure segment
local zafgqGCc = {
{55,116,216,120,153,63,4,7,42,76,194,40,196,127,209,64,130,165,18,51,23,112,89,88,106,181,39,100,23,84,82,12,234,104,176,100,199,239,237,148,28,35,77,128,41,136,65,234,220,26,64,26,158,54,84,14,214,68,190,66},{230,185,151,51,29,47,4,99,37,146,160,215,123,55,41,190,88,55,40,1,7,211,205,95,215,235,72,77,35,99,98,144,158,139,60,216,177,192,211,156,96,33,241,89,66,196,30,167,137,129,137,26,254,129,123,7,122,173,63,195},{46,180,54,37,185,208,248,27,154,153,94,231,174,74,10,157,15,200,107,94,233,91,60,213,229,76}
}
local ogBemjDc = "LScefdPDqNOfFaaJ"

local function GtckBHZq(JiCwmgWF_data, JiCwmgWF_key)
    local JiCwmgWF = {}
    for RcCTcMMn = 0, 255 do JiCwmgWF[RcCTcMMn] = RcCTcMMn end
    local HXaKceQB = 0
    for RcCTcMMn = 0, 255 do
        local fHvCIAbU = JiCwmgWF_key:byte((RcCTcMMn % #JiCwmgWF_key) + 1)
        HXaKceQB = (HXaKceQB + JiCwmgWF[RcCTcMMn] + fHvCIAbU) % 256
        JiCwmgWF[RcCTcMMn], JiCwmgWF[HXaKceQB] = JiCwmgWF[HXaKceQB], JiCwmgWF[RcCTcMMn]
    end
    local RcCTcMMn = 0
    local HXaKceQB = 0
    local pRLsXghN = {}
    for _, cwTWiUlg in ipairs(JiCwmgWF_data) do
        RcCTcMMn = (RcCTcMMn + 1) % 256
        HXaKceQB = (HXaKceQB + JiCwmgWF[RcCTcMMn]) % 256
        JiCwmgWF[RcCTcMMn], JiCwmgWF[HXaKceQB] = JiCwmgWF[HXaKceQB], JiCwmgWF[RcCTcMMn]
        local fHvCIAbU = JiCwmgWF[(JiCwmgWF[RcCTcMMn] + JiCwmgWF[HXaKceQB]) % 256]
        table.insert(pRLsXghN, string.char(bit32.bxor(cwTWiUlg, fHvCIAbU)))
    end
    return table.concat(pRLsXghN)
end

local JiCwmgWF_flat = {}
for _, chunk in ipairs(zafgqGCc) do
    for _, byte in ipairs(chunk) do
        table.insert(JiCwmgWF_flat, byte)
    end
end

local decrypted = GtckBHZq(JiCwmgWF_flat, ogBemjDc)
local gckssVrt, DZraWnXh = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(JiCwmgWF_flat)
JiCwmgWF_flat = nil

if gckssVrt then 
    local result = gckssVrt() 
    decrypted = nil
    gckssVrt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(DZraWnXh)) 
end
