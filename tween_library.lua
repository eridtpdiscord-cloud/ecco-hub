-- Compiled secure segment
local ZzJGQEHz = {
{109,209,220,232,53,208,167,148,104,163,160,161,35,68,116,202,5,155,182,12,231,221,251,39,208,101,29,108,198,16,115,3,134,115,132,57,24,130,68,78,13,88,72,22,175,154,175,62,99,209,219,138,196,165,218,123,252,50,213,43},{153,55,138,129,109,161,41,138,251,68,1,84,19,142,176,136,250,145,49,57,145,88,184,24,25,135,183,21,45,216,232,16,4,36,67,235,116,247,38,73,15,105,203,35,61,206,220,16,44,56,14,220,72,178,44,176,185,141,51,248},{27,210,38,178,78,1,211,105,186,56,212,191,209,87,138,75,129,84,184,182,121,31,186,153,78}
}
local NHHpjroX = "TrQQWSoqUNpMabMW"

local function muFPgrwj(WYtAjlkW_data, WYtAjlkW_key)
    local WYtAjlkW = {}
    for mSCNhLJM = 0, 255 do WYtAjlkW[mSCNhLJM] = mSCNhLJM end
    local DkLLOIkI = 0
    for mSCNhLJM = 0, 255 do
        local utxOfkur = WYtAjlkW_key:byte((mSCNhLJM % #WYtAjlkW_key) + 1)
        DkLLOIkI = (DkLLOIkI + WYtAjlkW[mSCNhLJM] + utxOfkur) % 256
        WYtAjlkW[mSCNhLJM], WYtAjlkW[DkLLOIkI] = WYtAjlkW[DkLLOIkI], WYtAjlkW[mSCNhLJM]
    end
    local mSCNhLJM = 0
    local DkLLOIkI = 0
    local RiXepmFQ = {}
    for _, rBfdmZov in ipairs(WYtAjlkW_data) do
        mSCNhLJM = (mSCNhLJM + 1) % 256
        DkLLOIkI = (DkLLOIkI + WYtAjlkW[mSCNhLJM]) % 256
        WYtAjlkW[mSCNhLJM], WYtAjlkW[DkLLOIkI] = WYtAjlkW[DkLLOIkI], WYtAjlkW[mSCNhLJM]
        local utxOfkur = WYtAjlkW[(WYtAjlkW[mSCNhLJM] + WYtAjlkW[DkLLOIkI]) % 256]
        table.insert(RiXepmFQ, string.char(bit32.bxor(rBfdmZov, utxOfkur)))
    end
    return table.concat(RiXepmFQ)
end

local WYtAjlkW_flat = {}
for _, chunk in ipairs(ZzJGQEHz) do
    for _, byte in ipairs(chunk) do
        table.insert(WYtAjlkW_flat, byte)
    end
end

local decrypted = muFPgrwj(WYtAjlkW_flat, NHHpjroX)
local JeoxcGKL, kqQHPnUG = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(WYtAjlkW_flat)
WYtAjlkW_flat = nil

if JeoxcGKL then 
    local result = JeoxcGKL() 
    decrypted = nil
    JeoxcGKL = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(kqQHPnUG)) 
end
