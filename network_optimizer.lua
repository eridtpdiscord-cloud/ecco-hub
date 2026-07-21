-- Compiled secure segment
local vUkoKGzO = {
{8,246,219,117,141,163,173,39,37,192,158,95,44,68,45,13,107,166,235,216,70,114,124,93,103,42,52,127,106,31,5,161,23,34,196,73,186,170,180,43,188,89,98,34,16,172,183,234,86,83,83,152,12,207,29,141,72,98,214,222},{246,26,225,250,197,46,116,156,2,45,195,229,127,158,68,12,221,32,188,19,98,249,69,168,209,38,98,147,241,41,25,155,20,227,255,172,165,186,122,130,189,121,20,235,16,243,189,66,9,146,179,72,206,77,37,143,29,242,56,19},{231,248,40,10,21,10,17,108,191,65,205,46,35,8,193,48,220,59,139,136,238,181,57,255,250,43,223,47,219}
}
local uXnGvUMF = "uGZwgSTMexIHEZvb"

local function mrckferC(lkOTfpwt_data, lkOTfpwt_key)
    local lkOTfpwt = {}
    for nyTxOlFi = 0, 255 do lkOTfpwt[nyTxOlFi] = nyTxOlFi end
    local lnaMdWvQ = 0
    for nyTxOlFi = 0, 255 do
        local sijNqpeU = lkOTfpwt_key:byte((nyTxOlFi % #lkOTfpwt_key) + 1)
        lnaMdWvQ = (lnaMdWvQ + lkOTfpwt[nyTxOlFi] + sijNqpeU) % 256
        lkOTfpwt[nyTxOlFi], lkOTfpwt[lnaMdWvQ] = lkOTfpwt[lnaMdWvQ], lkOTfpwt[nyTxOlFi]
    end
    local nyTxOlFi = 0
    local lnaMdWvQ = 0
    local RLmOBwDe = {}
    for _, ZaUPdgRB in ipairs(lkOTfpwt_data) do
        nyTxOlFi = (nyTxOlFi + 1) % 256
        lnaMdWvQ = (lnaMdWvQ + lkOTfpwt[nyTxOlFi]) % 256
        lkOTfpwt[nyTxOlFi], lkOTfpwt[lnaMdWvQ] = lkOTfpwt[lnaMdWvQ], lkOTfpwt[nyTxOlFi]
        local sijNqpeU = lkOTfpwt[(lkOTfpwt[nyTxOlFi] + lkOTfpwt[lnaMdWvQ]) % 256]
        table.insert(RLmOBwDe, string.char(bit32.bxor(ZaUPdgRB, sijNqpeU)))
    end
    return table.concat(RLmOBwDe)
end

local lkOTfpwt_flat = {}
for _, chunk in ipairs(vUkoKGzO) do
    for _, byte in ipairs(chunk) do
        table.insert(lkOTfpwt_flat, byte)
    end
end

local decrypted = mrckferC(lkOTfpwt_flat, uXnGvUMF)
local pwuUSDej, pFKkrkyD = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(lkOTfpwt_flat)
lkOTfpwt_flat = nil

if pwuUSDej then 
    local result = pwuUSDej() 
    decrypted = nil
    pwuUSDej = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(pFKkrkyD)) 
end
