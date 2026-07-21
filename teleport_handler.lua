-- Protected Segment (teleport_handler)
local ItiKVBoM = 135
local LzEazAdj = {
{194,129,68,122,56,214,86,143,225,81,87,246,67,153,180,151,45,71,191,179,248,199,72,122,83,235,213,177,238,17,115,164,111,130,217,162,206,47,36,22,115,157,27,60,197,162,22,69,246,18,191,55,50,17,17,69,244,20,89,14},{81,230,243,58,220,95,223,195,66,148,72,21,60,225,193,12,242,69,142,186,40,187,33,240,154,57,110,151,187,29,80,183,123,180,235,37,137,239,213,65,0,107,241,210,227,95,93,19,179,191,173,124,108,37,123,35,120,221,104,248},{20,160,198,76,197,0,24,140,238,196,68,39,45,186,46,122,67,116,216,174,11,232,48,151,158,95,132,88}
}
local DvthFQVZ = "mNDqlwigxzWyzwWr"

local function ZftzRySE(NUQLLwVe_data, NUQLLwVe_key)
    local NUQLLwVe = {}
    for nEJfsJEj = 0, 255 do NUQLLwVe[nEJfsJEj] = nEJfsJEj end
    local bQaCwEFv = 0
    for nEJfsJEj = 0, 255 do
        local TVZPJhgz = NUQLLwVe_key:byte((nEJfsJEj % #NUQLLwVe_key) + 1)
        bQaCwEFv = (bQaCwEFv + NUQLLwVe[nEJfsJEj] + TVZPJhgz) % 256
        NUQLLwVe[nEJfsJEj], NUQLLwVe[bQaCwEFv] = NUQLLwVe[bQaCwEFv], NUQLLwVe[nEJfsJEj]
    end
    local nEJfsJEj = 0
    local bQaCwEFv = 0
    local OPSyZsmW = {}
    for _, cynPIWyX in ipairs(NUQLLwVe_data) do
        nEJfsJEj = (nEJfsJEj + 1) % 256
        bQaCwEFv = (bQaCwEFv + NUQLLwVe[nEJfsJEj]) % 256
        NUQLLwVe[nEJfsJEj], NUQLLwVe[bQaCwEFv] = NUQLLwVe[bQaCwEFv], NUQLLwVe[nEJfsJEj]
        local TVZPJhgz = NUQLLwVe[(NUQLLwVe[nEJfsJEj] + NUQLLwVe[bQaCwEFv]) % 256]
        local unmasked = bit32.bxor(cynPIWyX, ItiKVBoM)
        table.insert(OPSyZsmW, string.char(bit32.bxor(unmasked, TVZPJhgz)))
    end
    return table.concat(OPSyZsmW)
end

local NUQLLwVe_flat = {}
for _, chunk in ipairs(LzEazAdj) do
    for _, byte in ipairs(chunk) do
        table.insert(NUQLLwVe_flat, byte)
    end
end

local decrypted = ZftzRySE(NUQLLwVe_flat, DvthFQVZ)
local ykGyBQju, mzhTXZTo = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(NUQLLwVe_flat)
NUQLLwVe_flat = nil

if ykGyBQju then 
    local result = ykGyBQju() 
    decrypted = nil
    ykGyBQju = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(mzhTXZTo)) 
end
