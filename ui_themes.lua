-- Compiled secure segment
local cuNLTFgB = {
{48,184,232,213,160,121,5,248,25,220,124,213,223,141,227,154,144,72,46,215,60,49,166,222,162,33,14,87,222,162,7,130,106,139,44,141,146,150,131,185,203,50,13,217,7,130,157,39,163,213,39,126,93,27,158,94,168,42,28,87},{177,116,162,89,15,115,42,142,51,199,147,64,142,14,23,143,230,158,64,248,124,239,20,92,174,247,137,133,83,227,84,122,16,82,22,171,219,73,215,20,252,201,240,72,208,149,81,147,224,119,218,212,215,150,63,134,19,116,244,28},{115,191,218,37,213,71,40,116,126,95,32,37,42,43,143,141,236,91,43,9,103}
}
local aNNHTHGL = "ZhPHzWzybwIviXCr"

local function cfUijqiM(udTURtDd_data, udTURtDd_key)
    local udTURtDd = {}
    for jYUkUanD = 0, 255 do udTURtDd[jYUkUanD] = jYUkUanD end
    local RJTyzWyt = 0
    for jYUkUanD = 0, 255 do
        local UizDvqjF = udTURtDd_key:byte((jYUkUanD % #udTURtDd_key) + 1)
        RJTyzWyt = (RJTyzWyt + udTURtDd[jYUkUanD] + UizDvqjF) % 256
        udTURtDd[jYUkUanD], udTURtDd[RJTyzWyt] = udTURtDd[RJTyzWyt], udTURtDd[jYUkUanD]
    end
    local jYUkUanD = 0
    local RJTyzWyt = 0
    local txWbtcUG = {}
    for _, ORNtERPR in ipairs(udTURtDd_data) do
        jYUkUanD = (jYUkUanD + 1) % 256
        RJTyzWyt = (RJTyzWyt + udTURtDd[jYUkUanD]) % 256
        udTURtDd[jYUkUanD], udTURtDd[RJTyzWyt] = udTURtDd[RJTyzWyt], udTURtDd[jYUkUanD]
        local UizDvqjF = udTURtDd[(udTURtDd[jYUkUanD] + udTURtDd[RJTyzWyt]) % 256]
        table.insert(txWbtcUG, string.char(bit32.bxor(ORNtERPR, UizDvqjF)))
    end
    return table.concat(txWbtcUG)
end

local udTURtDd_flat = {}
for _, chunk in ipairs(cuNLTFgB) do
    for _, byte in ipairs(chunk) do
        table.insert(udTURtDd_flat, byte)
    end
end

local decrypted = cfUijqiM(udTURtDd_flat, aNNHTHGL)
local rDYfAXjO, StXoHzdd = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(udTURtDd_flat)
udTURtDd_flat = nil

if rDYfAXjO then 
    local result = rDYfAXjO() 
    decrypted = nil
    rDYfAXjO = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(StXoHzdd)) 
end
