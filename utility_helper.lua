-- Protected Segment (utility_helper)
local jVVIwFcf = 68
local XODlDGGz = {
{198,22,219,33,223,192,59,16,237,168,246,149,211,54,85,154,80,128,40,103,198,149,206,57,58,105,101,220,169,221,99,151,148,64,81,249,170,30,78,13,236,13,3,246,227,122,188,91,197,90,242,157,195,226,29,78,78,71,87,254},{234,125,125,119,37,42,234,215,139,105,33,34,208,179,234,142,239,201,68,178,201,217,234,114,221,23,135,181,68,53,15,209,12,83,30,113,45,144,9,138,132,173,189,15,178,152,169,149,198,123,42,64,26,81,16,242,71,223,208,127},{140,94,172,1,173,82,123,83,124,70,229,214,216,191,141,135,208,64,48,187,140,111,54,249,195,173}
}
local jfkZGMpL = "dIfDCuDufAQpafQc"

local function tMXXLTqx(AGeCMCWH_data, AGeCMCWH_key)
    if type(AGeCMCWH_key) ~= "string" or #AGeCMCWH_key == 0 then return "" end
    local AGeCMCWH = {}
    for bJEEwbFl = 0, 255 do AGeCMCWH[bJEEwbFl] = bJEEwbFl end
    local qDqRIoSL = 0
    for bJEEwbFl = 0, 255 do
        local fIaAjMda = AGeCMCWH_key:byte((bJEEwbFl % #AGeCMCWH_key) + 1)
        qDqRIoSL = (qDqRIoSL + AGeCMCWH[bJEEwbFl] + fIaAjMda) % 256
        AGeCMCWH[bJEEwbFl], AGeCMCWH[qDqRIoSL] = AGeCMCWH[qDqRIoSL], AGeCMCWH[bJEEwbFl]
    end
    local bJEEwbFl = 0
    local qDqRIoSL = 0
    local ozBFNxws = {}
    for _, refSIcGX in ipairs(AGeCMCWH_data) do
        bJEEwbFl = (bJEEwbFl + 1) % 256
        qDqRIoSL = (qDqRIoSL + AGeCMCWH[bJEEwbFl]) % 256
        AGeCMCWH[bJEEwbFl], AGeCMCWH[qDqRIoSL] = AGeCMCWH[qDqRIoSL], AGeCMCWH[bJEEwbFl]
        local fIaAjMda = AGeCMCWH[(AGeCMCWH[bJEEwbFl] + AGeCMCWH[qDqRIoSL]) % 256]
        local unmasked = bit32.bxor(refSIcGX, jVVIwFcf)
        table.insert(ozBFNxws, string.char(bit32.bxor(unmasked, fIaAjMda)))
    end
    return table.concat(ozBFNxws)
end

local AGeCMCWH_flat = {}
for _, chunk in ipairs(XODlDGGz) do
    for _, byte in ipairs(chunk) do
        table.insert(AGeCMCWH_flat, byte)
    end
end

local decrypted = tMXXLTqx(AGeCMCWH_flat, jfkZGMpL)
local BQGPkRwA, SRqsfSDX = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(AGeCMCWH_flat)
AGeCMCWH_flat = nil

if BQGPkRwA then 
    local result = BQGPkRwA() 
    decrypted = nil
    BQGPkRwA = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(SRqsfSDX)) 
end
