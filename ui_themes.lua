-- Protected Segment (ui_themes)
local QKpePfCC = 185
local klQeHjWS = {
{117,165,91,233,184,209,219,202,90,185,10,125,145,6,206,112,215,150,100,182,40,197,63,203,74,120,83,48,144,125,2,245,197,211,197,95,89,110,249,56,80,236,47,196,19,13,106,49,21,203,215,69,185,36,220,161,149,25,223,17},{2,39,20,216,32,205,193,156,76,249,7,124,48,236,108,153,53,89,149,134,59,128,163,91,194,194,156,121,188,91,116,205,211,124,27,156,20,107,230,239,186,9,117,140,175,241,161,11,84,117,46,71,204,108,222,153,136,94,177,61},{87,244,58,161,207,148,61,40,50,166,137,21,112,76,129,100,148,159,200,32,175}
}
local bEQZYAOg = "UaRnBhsZkZWgJICt"

local function lGCHfViS(xFGLZClP_data, xFGLZClP_key)
    if type(xFGLZClP_key) ~= "string" or #xFGLZClP_key == 0 then return "" end
    local xFGLZClP = {}
    for TvnqOwKn = 0, 255 do xFGLZClP[TvnqOwKn] = TvnqOwKn end
    local zMrLTISt = 0
    for TvnqOwKn = 0, 255 do
        local HmNgbjUw = xFGLZClP_key:byte((TvnqOwKn % #xFGLZClP_key) + 1)
        zMrLTISt = (zMrLTISt + xFGLZClP[TvnqOwKn] + HmNgbjUw) % 256
        xFGLZClP[TvnqOwKn], xFGLZClP[zMrLTISt] = xFGLZClP[zMrLTISt], xFGLZClP[TvnqOwKn]
    end
    local TvnqOwKn = 0
    local zMrLTISt = 0
    local ndAJjTko = {}
    for _, wRNhRqiX in ipairs(xFGLZClP_data) do
        TvnqOwKn = (TvnqOwKn + 1) % 256
        zMrLTISt = (zMrLTISt + xFGLZClP[TvnqOwKn]) % 256
        xFGLZClP[TvnqOwKn], xFGLZClP[zMrLTISt] = xFGLZClP[zMrLTISt], xFGLZClP[TvnqOwKn]
        local HmNgbjUw = xFGLZClP[(xFGLZClP[TvnqOwKn] + xFGLZClP[zMrLTISt]) % 256]
        local unmasked = bit32.bxor(wRNhRqiX, QKpePfCC)
        table.insert(ndAJjTko, string.char(bit32.bxor(unmasked, HmNgbjUw)))
    end
    return table.concat(ndAJjTko)
end

local xFGLZClP_flat = {}
for _, chunk in ipairs(klQeHjWS) do
    for _, byte in ipairs(chunk) do
        table.insert(xFGLZClP_flat, byte)
    end
end

local decrypted = lGCHfViS(xFGLZClP_flat, bEQZYAOg)
local wrLHYDqo, RFajoEuK = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xFGLZClP_flat)
xFGLZClP_flat = nil

if wrLHYDqo then 
    local result = wrLHYDqo() 
    decrypted = nil
    wrLHYDqo = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(RFajoEuK)) 
end
