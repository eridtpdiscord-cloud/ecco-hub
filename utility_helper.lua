-- Protected Segment (utility_helper)
local VpoLoGZk = 74
local gDSMFnlz = {
{12,254,181,13,147,154,187,254,5,134,141,65,168,249,218,29,115,20,57,234,8,214,36,219,162,90,204,85,40,83,130,67,255,159,126,19,109,211,102,67,75,48,57,121,69,176,110,252,46,141,52,34,148,169,104,220,89,233,147,53},{43,95,3,39,0,30,161,218,165,162,125,98,248,95,186,132,201,14,55,222,142,22,135,249,87,28,92,180,21,171,8,46,231,29,235,163,173,167,129,165,180,238,77,237,94,140,147,108,189,88,50,219,125,27,68,184,87,95,218,119},{208,117,135,83,27,113,56,195,222,115,32,19,127,119,243,39,148,163,33,14,71,198,145,109,41,40}
}
local onajjnTJ = "HfrDLXLSlxPumdyp"

local function KnnAwEtm(JtvNmXLU_data, JtvNmXLU_key)
    local JtvNmXLU = {}
    for ZHpXWfPn = 0, 255 do JtvNmXLU[ZHpXWfPn] = ZHpXWfPn end
    local NNXhXIpn = 0
    for ZHpXWfPn = 0, 255 do
        local fQRyrvoR = JtvNmXLU_key:byte((ZHpXWfPn % #JtvNmXLU_key) + 1)
        NNXhXIpn = (NNXhXIpn + JtvNmXLU[ZHpXWfPn] + fQRyrvoR) % 256
        JtvNmXLU[ZHpXWfPn], JtvNmXLU[NNXhXIpn] = JtvNmXLU[NNXhXIpn], JtvNmXLU[ZHpXWfPn]
    end
    local ZHpXWfPn = 0
    local NNXhXIpn = 0
    local jYyHkKdf = {}
    for _, JdsHfftH in ipairs(JtvNmXLU_data) do
        ZHpXWfPn = (ZHpXWfPn + 1) % 256
        NNXhXIpn = (NNXhXIpn + JtvNmXLU[ZHpXWfPn]) % 256
        JtvNmXLU[ZHpXWfPn], JtvNmXLU[NNXhXIpn] = JtvNmXLU[NNXhXIpn], JtvNmXLU[ZHpXWfPn]
        local fQRyrvoR = JtvNmXLU[(JtvNmXLU[ZHpXWfPn] + JtvNmXLU[NNXhXIpn]) % 256]
        local unmasked = bit32.bxor(JdsHfftH, VpoLoGZk)
        table.insert(jYyHkKdf, string.char(bit32.bxor(unmasked, fQRyrvoR)))
    end
    return table.concat(jYyHkKdf)
end

local JtvNmXLU_flat = {}
for _, chunk in ipairs(gDSMFnlz) do
    for _, byte in ipairs(chunk) do
        table.insert(JtvNmXLU_flat, byte)
    end
end

local decrypted = KnnAwEtm(JtvNmXLU_flat, onajjnTJ)
local KcHtaqDW, trxEeaqS = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JtvNmXLU_flat)
JtvNmXLU_flat = nil

if KcHtaqDW then 
    local result = KcHtaqDW() 
    decrypted = nil
    KcHtaqDW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(trxEeaqS)) 
end
