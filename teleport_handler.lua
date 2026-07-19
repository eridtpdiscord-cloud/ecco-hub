-- Compiled secure segment
local hwFSPboI = {
{186,75,217,96,201,117,38,22,80,27,233,149,49,157,232,206,16,173,60,53,102,110,242,61,255,156,2,150,47,246,254,193,8,14,97,255,45,98,148,81,231,51,245,112,43,252,212,245,86,244,135,80,112,137,57,250,12,239,238,100},{45,217,197,14,177,12,23,173,243,168,102,70,31,141,165,12,111,231,233,164,52,126,66,197,110,27,43,47,232,255,221,197,206,188,208,181,21,217,21,225,136,203,40,149,121,70,144,80,172,153,132,22,188,214,77,168,2,16,55,113},{221,141,170,20,221,172,58,117,16,39,94,252,32,66,133,126,129,101,17,82,70,59,103,196,58,28,89,218}
}
local LpzEOglt = "ChjzlYGnSzWsiHwM"

local function MbDQCYIr(aopjhwqj_data, aopjhwqj_key)
    local aopjhwqj = {}
    for KFqRWYpo = 0, 255 do aopjhwqj[KFqRWYpo] = KFqRWYpo end
    local PaupBtsr = 0
    for KFqRWYpo = 0, 255 do
        local nTtUKQHh = aopjhwqj_key:byte((KFqRWYpo % #aopjhwqj_key) + 1)
        PaupBtsr = (PaupBtsr + aopjhwqj[KFqRWYpo] + nTtUKQHh) % 256
        aopjhwqj[KFqRWYpo], aopjhwqj[PaupBtsr] = aopjhwqj[PaupBtsr], aopjhwqj[KFqRWYpo]
    end
    local KFqRWYpo = 0
    local PaupBtsr = 0
    local uSpraeLQ = {}
    for _, rwQgpzVK in ipairs(aopjhwqj_data) do
        KFqRWYpo = (KFqRWYpo + 1) % 256
        PaupBtsr = (PaupBtsr + aopjhwqj[KFqRWYpo]) % 256
        aopjhwqj[KFqRWYpo], aopjhwqj[PaupBtsr] = aopjhwqj[PaupBtsr], aopjhwqj[KFqRWYpo]
        local nTtUKQHh = aopjhwqj[(aopjhwqj[KFqRWYpo] + aopjhwqj[PaupBtsr]) % 256]
        table.insert(uSpraeLQ, string.char(bit32.bxor(rwQgpzVK, nTtUKQHh)))
    end
    return table.concat(uSpraeLQ)
end

local aopjhwqj_flat = {}
for _, chunk in ipairs(hwFSPboI) do
    for _, byte in ipairs(chunk) do
        table.insert(aopjhwqj_flat, byte)
    end
end

local decrypted = MbDQCYIr(aopjhwqj_flat, LpzEOglt)
local hXGmTdKP, qHzisedw = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(aopjhwqj_flat)
aopjhwqj_flat = nil

if hXGmTdKP then 
    local result = hXGmTdKP() 
    decrypted = nil
    hXGmTdKP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(qHzisedw)) 
end
