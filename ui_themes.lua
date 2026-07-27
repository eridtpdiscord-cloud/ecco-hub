-- Protected Segment (ui_themes)
local hThloBCz = 66
local nniJuumD = {
{207,139,44,110,215,161,248,224,50,8,9,237,115,26,222,71,93,174,213,151,100,11,70,166,201,76,165,180,93,209,94,229,235,130,175,235,66,173,85,255,47,5,159,9,163,62,127,251,169,205,56,77,241,135,115,56,165,200,65,66},{209,7,121,34,243,160,58,165,27,204,103,158,155,217,200,153,102,19,107,21,128,201,233,203,114,117,224,70,69,71,12,32,29,96,248,26,229,92,145,4,76,120,231,22,118,27,13,160,251,41,170,228,218,237,17,245,104,155,174,111},{119,100,175,37,55,209,44,253,156,38,206,160,92,49,175,241,18,209,254,19,238}
}
local NrKrGWbr = "RFjYYCcWVHitIaHd"

local function FrmhclqN(PzQhzjGa_data, PzQhzjGa_key)
    if type(PzQhzjGa_key) ~= "string" or #PzQhzjGa_key == 0 then return "" end
    local PzQhzjGa = {}
    for CoXCKqeF = 0, 255 do PzQhzjGa[CoXCKqeF] = CoXCKqeF end
    local fNEFgEOh = 0
    for CoXCKqeF = 0, 255 do
        local XjWpiNxF = PzQhzjGa_key:byte((CoXCKqeF % #PzQhzjGa_key) + 1)
        fNEFgEOh = (fNEFgEOh + PzQhzjGa[CoXCKqeF] + XjWpiNxF) % 256
        PzQhzjGa[CoXCKqeF], PzQhzjGa[fNEFgEOh] = PzQhzjGa[fNEFgEOh], PzQhzjGa[CoXCKqeF]
    end
    local CoXCKqeF = 0
    local fNEFgEOh = 0
    local svminktW = {}
    for _, faoXWhiD in ipairs(PzQhzjGa_data) do
        CoXCKqeF = (CoXCKqeF + 1) % 256
        fNEFgEOh = (fNEFgEOh + PzQhzjGa[CoXCKqeF]) % 256
        PzQhzjGa[CoXCKqeF], PzQhzjGa[fNEFgEOh] = PzQhzjGa[fNEFgEOh], PzQhzjGa[CoXCKqeF]
        local XjWpiNxF = PzQhzjGa[(PzQhzjGa[CoXCKqeF] + PzQhzjGa[fNEFgEOh]) % 256]
        local unmasked = bit32.bxor(faoXWhiD, hThloBCz)
        table.insert(svminktW, string.char(bit32.bxor(unmasked, XjWpiNxF)))
    end
    return table.concat(svminktW)
end

local PzQhzjGa_flat = {}
for _, chunk in ipairs(nniJuumD) do
    for _, byte in ipairs(chunk) do
        table.insert(PzQhzjGa_flat, byte)
    end
end

local decrypted = FrmhclqN(PzQhzjGa_flat, NrKrGWbr)
local GjUqcaDm, ZNsyydYE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(PzQhzjGa_flat)
PzQhzjGa_flat = nil

if GjUqcaDm then 
    local result = GjUqcaDm() 
    decrypted = nil
    GjUqcaDm = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(ZNsyydYE)) 
end
