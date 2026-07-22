-- Protected Segment (network_optimizer)
local BLqgCcNr = 228
local RchghAYr = {
{35,94,199,248,241,46,16,103,88,151,112,195,247,39,176,164,92,202,9,63,234,238,72,21,184,85,0,244,241,156,116,42,191,118,56,53,163,58,82,150,92,68,67,61,109,94,182,18,34,71,197,87,50,89,142,63,59,121,76,128},{42,90,9,78,97,109,37,196,220,229,110,15,49,48,128,169,5,192,61,77,145,17,46,90,76,156,35,70,135,225,222,165,209,29,191,62,1,112,225,134,79,237,127,236,5,172,111,175,35,9,161,189,173,163,229,202,219,252,193,132},{124,190,188,177,38,217,235,58,191,175,59,119,49,205,15,120,172,137,20,21,1,150,80,155,126,155,117,165,73}
}
local bZXjmBzN = "gQSOLHTUnVoonmhS"

local function tjzosSUk(ZmdhEejN_data, ZmdhEejN_key)
    local ZmdhEejN = {}
    for JoiSWjLp = 0, 255 do ZmdhEejN[JoiSWjLp] = JoiSWjLp end
    local qgtPJNQq = 0
    for JoiSWjLp = 0, 255 do
        local PtKwmXLN = ZmdhEejN_key:byte((JoiSWjLp % #ZmdhEejN_key) + 1)
        qgtPJNQq = (qgtPJNQq + ZmdhEejN[JoiSWjLp] + PtKwmXLN) % 256
        ZmdhEejN[JoiSWjLp], ZmdhEejN[qgtPJNQq] = ZmdhEejN[qgtPJNQq], ZmdhEejN[JoiSWjLp]
    end
    local JoiSWjLp = 0
    local qgtPJNQq = 0
    local iiOfYuju = {}
    for _, zzqLjBOo in ipairs(ZmdhEejN_data) do
        JoiSWjLp = (JoiSWjLp + 1) % 256
        qgtPJNQq = (qgtPJNQq + ZmdhEejN[JoiSWjLp]) % 256
        ZmdhEejN[JoiSWjLp], ZmdhEejN[qgtPJNQq] = ZmdhEejN[qgtPJNQq], ZmdhEejN[JoiSWjLp]
        local PtKwmXLN = ZmdhEejN[(ZmdhEejN[JoiSWjLp] + ZmdhEejN[qgtPJNQq]) % 256]
        local unmasked = bit32.bxor(zzqLjBOo, BLqgCcNr)
        table.insert(iiOfYuju, string.char(bit32.bxor(unmasked, PtKwmXLN)))
    end
    return table.concat(iiOfYuju)
end

local ZmdhEejN_flat = {}
for _, chunk in ipairs(RchghAYr) do
    for _, byte in ipairs(chunk) do
        table.insert(ZmdhEejN_flat, byte)
    end
end

local decrypted = tjzosSUk(ZmdhEejN_flat, bZXjmBzN)
local FoGYLRCx, twJvrgqW = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ZmdhEejN_flat)
ZmdhEejN_flat = nil

if FoGYLRCx then 
    local result = FoGYLRCx() 
    decrypted = nil
    FoGYLRCx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(twJvrgqW)) 
end
