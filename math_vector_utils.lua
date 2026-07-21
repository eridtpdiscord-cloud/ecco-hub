-- Protected Segment (math_vector_utils)
local NFRHsNTs = 27
local YYSesWms = {
{125,221,155,147,89,168,227,228,219,136,53,116,97,185,63,73,36,110,202,154,194,192,42,147,207,8,219,144,10,177,254,225,226,75,234,180,245,214,248,11,190,17,1,68,169,144,135,229,201,129,140,61,119,104,184,182,207,203,6,250},{200,238,54,245,110,202,120,45,43,80,74,159,97,37,169,160,105,235,24,206,191,147,146,137,156,100,186,12,176,39,46,221,174,52,178,208,138,133,87,141,74,140,44,193,41,201,159,206,223,99,80,54,132,8,199,60,217,223,92,122},{162,95,36,248,88,5,5,31,198,42,157,2,198,41,209,101,235,149,96,68,163,184,4,124,109,176,37,57,85}
}
local igjclbJA = "nuSGfrAIxXyBbAmS"

local function yZXOfsuQ(uBmRfUDd_data, uBmRfUDd_key)
    local uBmRfUDd = {}
    for hNfvkMHj = 0, 255 do uBmRfUDd[hNfvkMHj] = hNfvkMHj end
    local RIINDdaZ = 0
    for hNfvkMHj = 0, 255 do
        local cOBviLfX = uBmRfUDd_key:byte((hNfvkMHj % #uBmRfUDd_key) + 1)
        RIINDdaZ = (RIINDdaZ + uBmRfUDd[hNfvkMHj] + cOBviLfX) % 256
        uBmRfUDd[hNfvkMHj], uBmRfUDd[RIINDdaZ] = uBmRfUDd[RIINDdaZ], uBmRfUDd[hNfvkMHj]
    end
    local hNfvkMHj = 0
    local RIINDdaZ = 0
    local FtOtMrXk = {}
    for _, adrkfLsQ in ipairs(uBmRfUDd_data) do
        hNfvkMHj = (hNfvkMHj + 1) % 256
        RIINDdaZ = (RIINDdaZ + uBmRfUDd[hNfvkMHj]) % 256
        uBmRfUDd[hNfvkMHj], uBmRfUDd[RIINDdaZ] = uBmRfUDd[RIINDdaZ], uBmRfUDd[hNfvkMHj]
        local cOBviLfX = uBmRfUDd[(uBmRfUDd[hNfvkMHj] + uBmRfUDd[RIINDdaZ]) % 256]
        local unmasked = bit32.bxor(adrkfLsQ, NFRHsNTs)
        table.insert(FtOtMrXk, string.char(bit32.bxor(unmasked, cOBviLfX)))
    end
    return table.concat(FtOtMrXk)
end

local uBmRfUDd_flat = {}
for _, chunk in ipairs(YYSesWms) do
    for _, byte in ipairs(chunk) do
        table.insert(uBmRfUDd_flat, byte)
    end
end

local decrypted = yZXOfsuQ(uBmRfUDd_flat, igjclbJA)
local giDqqdYQ, TPjxQrLn = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(uBmRfUDd_flat)
uBmRfUDd_flat = nil

if giDqqdYQ then 
    local result = giDqqdYQ() 
    decrypted = nil
    giDqqdYQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(TPjxQrLn)) 
end
