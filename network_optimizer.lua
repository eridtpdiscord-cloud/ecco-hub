-- Protected Segment (network_optimizer)
local MUNblLye = 225
local dNbAuWNQ = {
{66,112,89,183,167,251,225,97,115,154,59,100,226,210,99,70,84,131,214,149,232,219,100,59,150,60,185,253,153,89,38,145,207,22,93,170,215,227,128,55,0,224,246,145,151,100,127,75,117,31,239,48,55,113,78,131,91,208,219,148},{152,47,139,84,64,235,165,146,123,92,70,156,97,177,182,234,107,144,221,161,112,129,175,180,0,168,39,249,54,124,61,172,253,191,100,99,240,209,243,124,140,88,15,19,119,121,61,99,145,23,206,10,163,85,135,87,202,55,49,208},{115,153,43,31,12,1,219,101,153,42,32,2,215,55,134,73,205,85,217,145,36,166,94,147,249,176,107,127,30}
}
local bUzgepgY = "vCOjSzZkrdbDkaoi"

local function PsDVDOgn(aaHwujlK_data, aaHwujlK_key)
    if type(aaHwujlK_key) ~= "string" or #aaHwujlK_key == 0 then return "" end
    local aaHwujlK = {}
    for NqUQkNCo = 0, 255 do aaHwujlK[NqUQkNCo] = NqUQkNCo end
    local tfhRaZMa = 0
    for NqUQkNCo = 0, 255 do
        local OetjmxYm = aaHwujlK_key:byte((NqUQkNCo % #aaHwujlK_key) + 1)
        tfhRaZMa = (tfhRaZMa + aaHwujlK[NqUQkNCo] + OetjmxYm) % 256
        aaHwujlK[NqUQkNCo], aaHwujlK[tfhRaZMa] = aaHwujlK[tfhRaZMa], aaHwujlK[NqUQkNCo]
    end
    local NqUQkNCo = 0
    local tfhRaZMa = 0
    local IlUocHzT = {}
    for _, jjZHNvbU in ipairs(aaHwujlK_data) do
        NqUQkNCo = (NqUQkNCo + 1) % 256
        tfhRaZMa = (tfhRaZMa + aaHwujlK[NqUQkNCo]) % 256
        aaHwujlK[NqUQkNCo], aaHwujlK[tfhRaZMa] = aaHwujlK[tfhRaZMa], aaHwujlK[NqUQkNCo]
        local OetjmxYm = aaHwujlK[(aaHwujlK[NqUQkNCo] + aaHwujlK[tfhRaZMa]) % 256]
        local unmasked = bit32.bxor(jjZHNvbU, MUNblLye)
        table.insert(IlUocHzT, string.char(bit32.bxor(unmasked, OetjmxYm)))
    end
    return table.concat(IlUocHzT)
end

local aaHwujlK_flat = {}
for _, chunk in ipairs(dNbAuWNQ) do
    for _, byte in ipairs(chunk) do
        table.insert(aaHwujlK_flat, byte)
    end
end

local decrypted = PsDVDOgn(aaHwujlK_flat, bUzgepgY)
local TlyuYPUC, aOKrdrZj = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(aaHwujlK_flat)
aaHwujlK_flat = nil

if TlyuYPUC then 
    local result = TlyuYPUC() 
    decrypted = nil
    TlyuYPUC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(aOKrdrZj)) 
end
