-- Compiled secure segment
local mYEuMROJ = {
{97,5,220,50,97,4,182,136,149,175,55,117,122,129,113,237,171,72,128,83,29,240,26,111,76,30,109,153,232,17,152,86,201,225,172,204,248,98,244,118,91,172,83,14,105,42,91,191,210,120,177,20,159,16,64,205,14,225,42,100},{151,72,50,246,163,211,251,208,190,75,51,164,175,214,248,47,129,243,99,71,40,163,158,240,162,208,192,238,213,244,60,45,227,76,154,30,207,7,211,115,109,134,14,189,186,236,87,245,116,82,193,16,113,203,170,88,5,36,198,121},{24,112,28,240,19,147,158,99,193,142,209,101,171,139,32,137,95,91,63,196,8,180,205,131,153,176}
}
local FfopnFpB = "KlaVeZsyzCDZFufQ"

local function dowwhEoS(hWzbhpEG_data, hWzbhpEG_key)
    local hWzbhpEG = {}
    for ZgrkfggB = 0, 255 do hWzbhpEG[ZgrkfggB] = ZgrkfggB end
    local IovXWfBR = 0
    for ZgrkfggB = 0, 255 do
        local XQpLSYxQ = hWzbhpEG_key:byte((ZgrkfggB % #hWzbhpEG_key) + 1)
        IovXWfBR = (IovXWfBR + hWzbhpEG[ZgrkfggB] + XQpLSYxQ) % 256
        hWzbhpEG[ZgrkfggB], hWzbhpEG[IovXWfBR] = hWzbhpEG[IovXWfBR], hWzbhpEG[ZgrkfggB]
    end
    local ZgrkfggB = 0
    local IovXWfBR = 0
    local PgKqMRBd = {}
    for _, tynQGglr in ipairs(hWzbhpEG_data) do
        ZgrkfggB = (ZgrkfggB + 1) % 256
        IovXWfBR = (IovXWfBR + hWzbhpEG[ZgrkfggB]) % 256
        hWzbhpEG[ZgrkfggB], hWzbhpEG[IovXWfBR] = hWzbhpEG[IovXWfBR], hWzbhpEG[ZgrkfggB]
        local XQpLSYxQ = hWzbhpEG[(hWzbhpEG[ZgrkfggB] + hWzbhpEG[IovXWfBR]) % 256]
        table.insert(PgKqMRBd, string.char(bit32.bxor(tynQGglr, XQpLSYxQ)))
    end
    return table.concat(PgKqMRBd)
end

local hWzbhpEG_flat = {}
for _, chunk in ipairs(mYEuMROJ) do
    for _, byte in ipairs(chunk) do
        table.insert(hWzbhpEG_flat, byte)
    end
end

local decrypted = dowwhEoS(hWzbhpEG_flat, FfopnFpB)
local wYxQzcbw, WbYiGpbn = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(hWzbhpEG_flat)
hWzbhpEG_flat = nil

if wYxQzcbw then 
    local result = wYxQzcbw() 
    decrypted = nil
    wYxQzcbw = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(WbYiGpbn)) 
end
