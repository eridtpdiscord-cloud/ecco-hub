-- Protected Segment (network_optimizer)
local xLHuDzpd = 233
local EDfiDmkU = {
{7,189,26,151,101,97,50,15,28,196,127,126,242,172,0,57,40,160,227,43,47,79,122,56,237,203,110,155,44,234,205,168,235,53,99,125,21,81,153,229,119,88,127,226,85,225,221,94,132,104,12,34,115,41,108,43,160,152,79,108},{190,108,82,223,137,14,21,122,21,47,177,245,171,11,25,92,109,221,214,166,122,16,130,244,14,37,140,24,59,160,22,53,1,101,210,20,130,8,141,138,230,96,179,20,215,136,160,190,167,37,143,105,35,195,242,12,167,82,80,14},{108,246,134,3,247,140,146,15,55,120,26,179,16,28,246,78,198,186,79,194,224,217,203,36,129,85,200,135,205}
}
local slVACUdf = "mAWIBHiksKQoFVlu"

local function RKfTYSqd(ukDrCxoK_data, ukDrCxoK_key)
    if type(ukDrCxoK_key) ~= "string" or #ukDrCxoK_key == 0 then return "" end
    local ukDrCxoK = {}
    for nwhAPOQs = 0, 255 do ukDrCxoK[nwhAPOQs] = nwhAPOQs end
    local JdlRZFiN = 0
    for nwhAPOQs = 0, 255 do
        local wICzxsvz = ukDrCxoK_key:byte((nwhAPOQs % #ukDrCxoK_key) + 1)
        JdlRZFiN = (JdlRZFiN + ukDrCxoK[nwhAPOQs] + wICzxsvz) % 256
        ukDrCxoK[nwhAPOQs], ukDrCxoK[JdlRZFiN] = ukDrCxoK[JdlRZFiN], ukDrCxoK[nwhAPOQs]
    end
    local nwhAPOQs = 0
    local JdlRZFiN = 0
    local oINNstzL = {}
    for _, YNTfWcjc in ipairs(ukDrCxoK_data) do
        nwhAPOQs = (nwhAPOQs + 1) % 256
        JdlRZFiN = (JdlRZFiN + ukDrCxoK[nwhAPOQs]) % 256
        ukDrCxoK[nwhAPOQs], ukDrCxoK[JdlRZFiN] = ukDrCxoK[JdlRZFiN], ukDrCxoK[nwhAPOQs]
        local wICzxsvz = ukDrCxoK[(ukDrCxoK[nwhAPOQs] + ukDrCxoK[JdlRZFiN]) % 256]
        local unmasked = bit32.bxor(YNTfWcjc, xLHuDzpd)
        table.insert(oINNstzL, string.char(bit32.bxor(unmasked, wICzxsvz)))
    end
    return table.concat(oINNstzL)
end

local ukDrCxoK_flat = {}
for _, chunk in ipairs(EDfiDmkU) do
    for _, byte in ipairs(chunk) do
        table.insert(ukDrCxoK_flat, byte)
    end
end

local decrypted = RKfTYSqd(ukDrCxoK_flat, slVACUdf)
local rwtjvAzO, FqDhcijq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(ukDrCxoK_flat)
ukDrCxoK_flat = nil

if rwtjvAzO then 
    local result = rwtjvAzO() 
    decrypted = nil
    rwtjvAzO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(FqDhcijq)) 
end
