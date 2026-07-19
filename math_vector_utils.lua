-- Compiled secure segment
local fzUYbCcq = {
{223,250,31,119,67,194,128,126,12,65,227,234,195,75,128,216,142,235,96,68,139,165,119,198,250,233,195,4,71,127,135,179,247,150,210,122,216,27,105,175,91,154,251,112,159,55,129,123,191,138,216,12,50,25,28,81,16,158,140,204},{234,34,38,94,21,170,128,33,205,113,113,71,143,181,114,40,87,96,165,29,184,204,33,31,205,64,236,202,47,180,110,33,90,189,203,37,155,179,146,3,216,114,172,9,228,81,235,128,220,115,108,236,239,207,198,63,143,159,83,166},{66,191,177,233,227,66,172,206,193,197,88,95,222,146,203,7,135,209,111,255,8,20,248,85,89,113,249,171,217}
}
local eqErXjkg = "jiPvdPPbXuefOidk"

local function emLRGTLl(RIMRTJOe_data, RIMRTJOe_key)
    local RIMRTJOe = {}
    for vqbhnnNC = 0, 255 do RIMRTJOe[vqbhnnNC] = vqbhnnNC end
    local EIWFSjVn = 0
    for vqbhnnNC = 0, 255 do
        local QKPYsqNs = RIMRTJOe_key:byte((vqbhnnNC % #RIMRTJOe_key) + 1)
        EIWFSjVn = (EIWFSjVn + RIMRTJOe[vqbhnnNC] + QKPYsqNs) % 256
        RIMRTJOe[vqbhnnNC], RIMRTJOe[EIWFSjVn] = RIMRTJOe[EIWFSjVn], RIMRTJOe[vqbhnnNC]
    end
    local vqbhnnNC = 0
    local EIWFSjVn = 0
    local iJISTbPA = {}
    for _, znGZqRua in ipairs(RIMRTJOe_data) do
        vqbhnnNC = (vqbhnnNC + 1) % 256
        EIWFSjVn = (EIWFSjVn + RIMRTJOe[vqbhnnNC]) % 256
        RIMRTJOe[vqbhnnNC], RIMRTJOe[EIWFSjVn] = RIMRTJOe[EIWFSjVn], RIMRTJOe[vqbhnnNC]
        local QKPYsqNs = RIMRTJOe[(RIMRTJOe[vqbhnnNC] + RIMRTJOe[EIWFSjVn]) % 256]
        table.insert(iJISTbPA, string.char(bit32.bxor(znGZqRua, QKPYsqNs)))
    end
    return table.concat(iJISTbPA)
end

local RIMRTJOe_flat = {}
for _, chunk in ipairs(fzUYbCcq) do
    for _, byte in ipairs(chunk) do
        table.insert(RIMRTJOe_flat, byte)
    end
end

local decrypted = emLRGTLl(RIMRTJOe_flat, eqErXjkg)
local GhfvGJat, GFMVAYCn = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(RIMRTJOe_flat)
RIMRTJOe_flat = nil

if GhfvGJat then 
    local result = GhfvGJat() 
    decrypted = nil
    GhfvGJat = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(GFMVAYCn)) 
end
