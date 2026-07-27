-- Protected Segment (cache_invalidation)
local zqqScFMj = 127
local NnlrFsAD = {
{128,122,171,100,73,65,175,210,148,87,148,2,249,224,75,182,189,95,130,31,57,87,177,74,163,209,136,232,220,37,216,222,35,195,69,194,8,167,240,241,193,23,12,44,195,83,158,119,165,33,141,73,152,219,41,126,163,76,123,136},{192,97,61,137,106,41,90,72,64,68,174,204,238,225,146,114,59,158,200,118,160,4,187,21,42,137,121,119,101,201,188,84,230,18,111,193,250,154,21,167,239,246,224,163,22,97,243,129,189,212,40,40,3,104,151,163,240,152,37,212},{17,21,198,107,154,135,168,244,84,110,244,119,21,208,210,4,77,168,199,171,231,146,109,149,133,31,23,48,188,238}
}
local GtxtawTX = "LDWTnSiyjNZaHFAw"

local function mthVGlUt(yXbrAMzt_data, yXbrAMzt_key)
    if type(yXbrAMzt_key) ~= "string" or #yXbrAMzt_key == 0 then return "" end
    local yXbrAMzt = {}
    for edSxshwB = 0, 255 do yXbrAMzt[edSxshwB] = edSxshwB end
    local DglNWutX = 0
    for edSxshwB = 0, 255 do
        local gkVtNXNH = yXbrAMzt_key:byte((edSxshwB % #yXbrAMzt_key) + 1)
        DglNWutX = (DglNWutX + yXbrAMzt[edSxshwB] + gkVtNXNH) % 256
        yXbrAMzt[edSxshwB], yXbrAMzt[DglNWutX] = yXbrAMzt[DglNWutX], yXbrAMzt[edSxshwB]
    end
    local edSxshwB = 0
    local DglNWutX = 0
    local nbIUrWCN = {}
    for _, iRYlIBCX in ipairs(yXbrAMzt_data) do
        edSxshwB = (edSxshwB + 1) % 256
        DglNWutX = (DglNWutX + yXbrAMzt[edSxshwB]) % 256
        yXbrAMzt[edSxshwB], yXbrAMzt[DglNWutX] = yXbrAMzt[DglNWutX], yXbrAMzt[edSxshwB]
        local gkVtNXNH = yXbrAMzt[(yXbrAMzt[edSxshwB] + yXbrAMzt[DglNWutX]) % 256]
        local unmasked = bit32.bxor(iRYlIBCX, zqqScFMj)
        table.insert(nbIUrWCN, string.char(bit32.bxor(unmasked, gkVtNXNH)))
    end
    return table.concat(nbIUrWCN)
end

local yXbrAMzt_flat = {}
for _, chunk in ipairs(NnlrFsAD) do
    for _, byte in ipairs(chunk) do
        table.insert(yXbrAMzt_flat, byte)
    end
end

local decrypted = mthVGlUt(yXbrAMzt_flat, GtxtawTX)
local NbxjlQhD, deboIvHq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(yXbrAMzt_flat)
yXbrAMzt_flat = nil

if NbxjlQhD then 
    local result = NbxjlQhD() 
    decrypted = nil
    NbxjlQhD = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "cache_invalidation" .. "): " .. tostring(deboIvHq)) 
end
