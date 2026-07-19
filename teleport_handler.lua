-- Compiled secure segment
local QgPzrjby = {
{193,196,170,191,96,77,79,129,152,16,246,122,253,79,178,169,190,74,233,95,82,213,220,26,101,222,62,36,36,67,64,154,24,158,142,35,128,100,223,57,161,146,67,56,204,9,185,186,106,227,125,78,17,105,176,0,186,89,50,173},{50,160,141,157,251,6,215,109,117,205,145,217,28,212,251,133,82,23,193,198,116,151,97,69,153,164,216,116,89,98,236,52,44,221,112,223,236,205,54,201,215,38,106,216,74,40,4,54,35,135,255,213,163,149,125,97,133,250,206,113},{141,151,119,145,148,195,202,237,97,231,27,228,41,119,47,108,130,167,155,250,44,59,215,200,67,36,107,52}
}
local jCpKlqyV = "kHHeAzoQzsIEVRbr"

local function McAUfIiO(YfGwQnQN_data, YfGwQnQN_key)
    local YfGwQnQN = {}
    for ydxnNtlR = 0, 255 do YfGwQnQN[ydxnNtlR] = ydxnNtlR end
    local sqpQDegT = 0
    for ydxnNtlR = 0, 255 do
        local wxgZdnzj = YfGwQnQN_key:byte((ydxnNtlR % #YfGwQnQN_key) + 1)
        sqpQDegT = (sqpQDegT + YfGwQnQN[ydxnNtlR] + wxgZdnzj) % 256
        YfGwQnQN[ydxnNtlR], YfGwQnQN[sqpQDegT] = YfGwQnQN[sqpQDegT], YfGwQnQN[ydxnNtlR]
    end
    local ydxnNtlR = 0
    local sqpQDegT = 0
    local cAbLoixt = {}
    for _, NDroQGRd in ipairs(YfGwQnQN_data) do
        ydxnNtlR = (ydxnNtlR + 1) % 256
        sqpQDegT = (sqpQDegT + YfGwQnQN[ydxnNtlR]) % 256
        YfGwQnQN[ydxnNtlR], YfGwQnQN[sqpQDegT] = YfGwQnQN[sqpQDegT], YfGwQnQN[ydxnNtlR]
        local wxgZdnzj = YfGwQnQN[(YfGwQnQN[ydxnNtlR] + YfGwQnQN[sqpQDegT]) % 256]
        table.insert(cAbLoixt, string.char(bit32.bxor(NDroQGRd, wxgZdnzj)))
    end
    return table.concat(cAbLoixt)
end

local YfGwQnQN_flat = {}
for _, chunk in ipairs(QgPzrjby) do
    for _, byte in ipairs(chunk) do
        table.insert(YfGwQnQN_flat, byte)
    end
end

local decrypted = McAUfIiO(YfGwQnQN_flat, jCpKlqyV)
local YBrDLGjb, taaaEiLW = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(YfGwQnQN_flat)
YfGwQnQN_flat = nil

if YBrDLGjb then 
    local result = YBrDLGjb() 
    decrypted = nil
    YBrDLGjb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(taaaEiLW)) 
end
