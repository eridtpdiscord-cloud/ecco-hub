-- Compiled secure segment
local ooKBgeqg = {
{212,222,83,26,105,88,252,129,127,36,232,69,11,101,215,156,158,31,170,46,10,71,176,40,81,20,175,217,161,14,65,236,141,57,141,233,229,181,85,192,178,34,18,239,144,84,183,139,185,169,141,161,104,72,80,204,82,40,10,213},{98,240,111,72,121,196,227,54,241,69,185,204,99,119,79,108,115,239,163,145,47,80,209,28,85,60,76,107,93,239,125,125,124,221,162,128,177,169,219,4,31,68,2,120,112,109,144,165,52,164,206,177,105,93,169,183,0,45,128,29},{245,124,4,40,153,151,82,112,249,232,240,156,2,101,18,240,211,205,19,35,36,183,69,135,197,144,18,11,95}
}
local giRZpBjF = "yadupoeuiIskFiJX"

local function eGpuuDED(dJsdVtnt_data, dJsdVtnt_key)
    local dJsdVtnt = {}
    for RbtwJzZm = 0, 255 do dJsdVtnt[RbtwJzZm] = RbtwJzZm end
    local yHxNKTpU = 0
    for RbtwJzZm = 0, 255 do
        local LJwYzOAx = dJsdVtnt_key:byte((RbtwJzZm % #dJsdVtnt_key) + 1)
        yHxNKTpU = (yHxNKTpU + dJsdVtnt[RbtwJzZm] + LJwYzOAx) % 256
        dJsdVtnt[RbtwJzZm], dJsdVtnt[yHxNKTpU] = dJsdVtnt[yHxNKTpU], dJsdVtnt[RbtwJzZm]
    end
    local RbtwJzZm = 0
    local yHxNKTpU = 0
    local RxuaIeOp = {}
    for _, QlzkaQRs in ipairs(dJsdVtnt_data) do
        RbtwJzZm = (RbtwJzZm + 1) % 256
        yHxNKTpU = (yHxNKTpU + dJsdVtnt[RbtwJzZm]) % 256
        dJsdVtnt[RbtwJzZm], dJsdVtnt[yHxNKTpU] = dJsdVtnt[yHxNKTpU], dJsdVtnt[RbtwJzZm]
        local LJwYzOAx = dJsdVtnt[(dJsdVtnt[RbtwJzZm] + dJsdVtnt[yHxNKTpU]) % 256]
        table.insert(RxuaIeOp, string.char(bit32.bxor(QlzkaQRs, LJwYzOAx)))
    end
    return table.concat(RxuaIeOp)
end

local dJsdVtnt_flat = {}
for _, chunk in ipairs(ooKBgeqg) do
    for _, byte in ipairs(chunk) do
        table.insert(dJsdVtnt_flat, byte)
    end
end

local decrypted = eGpuuDED(dJsdVtnt_flat, giRZpBjF)
local pZSYbdue, IJBqZKlR = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(dJsdVtnt_flat)
dJsdVtnt_flat = nil

if pZSYbdue then 
    local result = pZSYbdue() 
    decrypted = nil
    pZSYbdue = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(IJBqZKlR)) 
end
