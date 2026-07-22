-- Protected Segment (network_optimizer)
local ZUTvUHkh = 144
local ttUfdtjW = {
{43,39,87,141,91,187,43,157,227,29,94,119,129,217,55,233,230,145,5,164,175,15,26,146,54,100,73,86,51,77,69,187,120,224,1,244,17,96,172,218,207,64,71,45,109,100,103,78,17,246,160,8,58,85,199,51,194,30,101,190},{107,208,50,189,236,208,249,16,236,182,66,23,197,95,138,213,107,204,77,24,162,43,250,139,227,135,112,162,77,188,202,203,22,107,94,57,59,202,195,169,165,179,179,216,243,224,27,186,18,105,107,74,210,215,162,221,4,117,143,154},{215,109,201,252,137,32,65,121,227,83,224,75,117,236,201,136,214,126,50,28,45,47,103,164,214,224,100,40,152}
}
local tTRGMkKu = "PysOIvbyScBCjbDw"

local function vXRvKgYA(coTpobxK_data, coTpobxK_key)
    local coTpobxK = {}
    for dSYudmRD = 0, 255 do coTpobxK[dSYudmRD] = dSYudmRD end
    local lqxwHVjJ = 0
    for dSYudmRD = 0, 255 do
        local biglZTti = coTpobxK_key:byte((dSYudmRD % #coTpobxK_key) + 1)
        lqxwHVjJ = (lqxwHVjJ + coTpobxK[dSYudmRD] + biglZTti) % 256
        coTpobxK[dSYudmRD], coTpobxK[lqxwHVjJ] = coTpobxK[lqxwHVjJ], coTpobxK[dSYudmRD]
    end
    local dSYudmRD = 0
    local lqxwHVjJ = 0
    local EIGXWxKp = {}
    for _, AGHtkGtO in ipairs(coTpobxK_data) do
        dSYudmRD = (dSYudmRD + 1) % 256
        lqxwHVjJ = (lqxwHVjJ + coTpobxK[dSYudmRD]) % 256
        coTpobxK[dSYudmRD], coTpobxK[lqxwHVjJ] = coTpobxK[lqxwHVjJ], coTpobxK[dSYudmRD]
        local biglZTti = coTpobxK[(coTpobxK[dSYudmRD] + coTpobxK[lqxwHVjJ]) % 256]
        local unmasked = bit32.bxor(AGHtkGtO, ZUTvUHkh)
        table.insert(EIGXWxKp, string.char(bit32.bxor(unmasked, biglZTti)))
    end
    return table.concat(EIGXWxKp)
end

local coTpobxK_flat = {}
for _, chunk in ipairs(ttUfdtjW) do
    for _, byte in ipairs(chunk) do
        table.insert(coTpobxK_flat, byte)
    end
end

local decrypted = vXRvKgYA(coTpobxK_flat, tTRGMkKu)
local rdKHQrSk, mpZVfdSR = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(coTpobxK_flat)
coTpobxK_flat = nil

if rdKHQrSk then 
    local result = rdKHQrSk() 
    decrypted = nil
    rdKHQrSk = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(mpZVfdSR)) 
end
