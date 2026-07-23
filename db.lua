-- Protected Segment (db)
local nFQbypNq = 199
local WAJHUXdM = {
{147,177,115,61,95,224,126,176,247,133,245,39,97,92,12,64,152,140,36,12,254,161,253,151,32,89,219,82,243,217,128,8,2,175,128,160,59,70,229,163,103,104,22,60,22,211,68,23,126,87,172,197,114,2,78,22,231,169,44,181},{45,236,145,209,219,136,81,221,177,208,247,230,231,101,55,79,33,53,103,32,65,167,187,219,60,189,63,242,170,252,165,126,254,55,68,111,179,162,69,229,91,46,39,157,239,10,217,0,196,107,195,33,209,43,107,34,65,176,190,122},{105,95,94,162,27,241,32,255,220,33,116,225,221,134,4,109,55,80,123,194,163,183,101,64,39,48,212,184,106,150,5,81,42,61,197,100,253,105,52,171,210,67,158,217,32,86,213,201,17,179,66,39,5,189,100,136,86,216,93,145},{131,96,233,211,96,125,126,29,46,200,141,70,203,130,164,32,73,108,159,162,122,187,244,121,154,168,8,241,9,221,3,100,187,25,183,92,236,26,191,151,21,100,221,57,238,136,216,184,24,55,138,143,251,213,156,133,142,65,37,112},{95,37,117,17,244,28,2,29,92,152,151,247,79,59,236,82,25,232,171,124,11,53,207,235,211,52,49,110,88,249,52,183,173,81,193,127,10,113,113,6,156,204,85,48,13,141,105,5,178,169,188,109,111,238,223,42,91,96,37,165},{154,132,12,155,152,137,182,167,113,27,198,92,120,127,201,243,53,141,150,106,240,239,146,218,67,78,177,16,79,125,3,192,38,35,101,185,48,212,228,14,30,200,29,250,99,109,168,13,254,185,37,168,206,60,16,207,173,48,240,122},{119,121,101,172,126,126,132,82,27,139,192,146,75,181,93,51,181,217,95,54,56,40,143,173,14,47,241,39,37,47,120,113,78,42,50,158,126,43,187,171,237,190,230,21,185,78,191,145,142,115,94,223,67,26,98,32,72,126,170,106},{18,71,25,138,87,232,229,154,11,248,212,131,8,208,128,83,4,128,82,229,197,196,16,75,205,82,34,11,132,47,131,123,81,91,48,100,219,196,206,51,200,189,4,205,241,98,202,254,195,60,26,11,29,209,26,87,0,83,219}
}
local hCkFfPpb = "AnQPlopklcyGnWLI"

local function bzkEtvkW(pAANVzyB_data, pAANVzyB_key)
    if type(pAANVzyB_key) ~= "string" or #pAANVzyB_key == 0 then return "" end
    local pAANVzyB = {}
    for mHXfKgMP = 0, 255 do pAANVzyB[mHXfKgMP] = mHXfKgMP end
    local DyQPyJqv = 0
    for mHXfKgMP = 0, 255 do
        local hJkZQWCj = pAANVzyB_key:byte((mHXfKgMP % #pAANVzyB_key) + 1)
        DyQPyJqv = (DyQPyJqv + pAANVzyB[mHXfKgMP] + hJkZQWCj) % 256
        pAANVzyB[mHXfKgMP], pAANVzyB[DyQPyJqv] = pAANVzyB[DyQPyJqv], pAANVzyB[mHXfKgMP]
    end
    local mHXfKgMP = 0
    local DyQPyJqv = 0
    local qvOCAFBz = {}
    for _, kikxPHUO in ipairs(pAANVzyB_data) do
        mHXfKgMP = (mHXfKgMP + 1) % 256
        DyQPyJqv = (DyQPyJqv + pAANVzyB[mHXfKgMP]) % 256
        pAANVzyB[mHXfKgMP], pAANVzyB[DyQPyJqv] = pAANVzyB[DyQPyJqv], pAANVzyB[mHXfKgMP]
        local hJkZQWCj = pAANVzyB[(pAANVzyB[mHXfKgMP] + pAANVzyB[DyQPyJqv]) % 256]
        local unmasked = bit32.bxor(kikxPHUO, nFQbypNq)
        table.insert(qvOCAFBz, string.char(bit32.bxor(unmasked, hJkZQWCj)))
    end
    return table.concat(qvOCAFBz)
end

local pAANVzyB_flat = {}
for _, chunk in ipairs(WAJHUXdM) do
    for _, byte in ipairs(chunk) do
        table.insert(pAANVzyB_flat, byte)
    end
end

local decrypted = bzkEtvkW(pAANVzyB_flat, hCkFfPpb)
local OqjDjShS, gvMZKBdM = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(pAANVzyB_flat)
pAANVzyB_flat = nil

if OqjDjShS then 
    local result = OqjDjShS() 
    decrypted = nil
    OqjDjShS = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(gvMZKBdM)) 
end
