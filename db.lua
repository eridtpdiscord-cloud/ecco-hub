-- Protected Segment (db)
local IWXTbmwE = 179
local jgPRbYqo = {
{71,136,55,197,239,149,129,62,116,164,79,159,189,200,217,187,91,192,131,179,122,230,170,40,159,127,57,15,165,113,19,184,100,255,157,69,245,154,58,211,245,19,26,62,190,127,40,120,50,231,247,207,173,3,56,111,158,49,97,52},{237,189,196,167,1,141,244,7,138,127,55,192,15,61,12,97,24,189,251,46,124,154,68,41,254,110,7,102,238,36,60,47,216,149,211,209,114,78,119,68,125,167,14,18,195,6,31,210,73,16,242,197,142,49,244,74,125,57,44,62},{182,204,127,76,202,16,208,195,22,28,237,61,127,151,214,161,38,240,27,189,123,220,143,196,109,197,68,103,44,31,50,127,236,231,53,130,178,233,248,109,3,134,67,170,39,216,69,182,91,164,189,24,6,180,233,15,239,150,23,9},{134,176,175,186,134,199,121,8,192,72,106,6,115,254,216,114,184,178,81,249,123,207,68,223,125,177,204,238,15,226,175,234,206,52,138,209,83,87,34,10,208,61,218,85,114,207,116,39,89,91,238,194,95,114,185,22,152,65,86,37},{87,60,136,39,72,6,162,255,255,228,154,189,85,21,61,28,116,233,126,142,113,119,189,177,139,208,5,59,219,196,112,203,154,142,170,85,56,105,235,28,26,253,202,149,120,97,231,88,7,101,81,242,106,95,86,55,140,71,163,151},{107,14,152,249,230,197,122,35,196,113,38,46,228,127,247,8,173,178,166,228,221,123,159,29,118,121,13,68,115,217,29,141,30,132,254,53,36,144,193,43,252,91,231,118,233,57,62,18,179,42,108,187,140,123,66,239,69,53,180,64},{212,177,123,36,54,102,200,63,158,206,202,33,60,232,109,194,104,210,98,50,249,123,239,24,75,10,66,164,234,45,164,157,213,187,99,229,74,124,201,55,113,34,245,213,135,144,27}
}
local pUAntxvu = "wlYGTrNJzXDuVWsC"

local function zCQHBrYO(eikULzJZ_data, eikULzJZ_key)
    local eikULzJZ = {}
    for bxXDfhgV = 0, 255 do eikULzJZ[bxXDfhgV] = bxXDfhgV end
    local OlbAUnhS = 0
    for bxXDfhgV = 0, 255 do
        local fmWUzPjY = eikULzJZ_key:byte((bxXDfhgV % #eikULzJZ_key) + 1)
        OlbAUnhS = (OlbAUnhS + eikULzJZ[bxXDfhgV] + fmWUzPjY) % 256
        eikULzJZ[bxXDfhgV], eikULzJZ[OlbAUnhS] = eikULzJZ[OlbAUnhS], eikULzJZ[bxXDfhgV]
    end
    local bxXDfhgV = 0
    local OlbAUnhS = 0
    local eCMsTicL = {}
    for _, tYkpmiYv in ipairs(eikULzJZ_data) do
        bxXDfhgV = (bxXDfhgV + 1) % 256
        OlbAUnhS = (OlbAUnhS + eikULzJZ[bxXDfhgV]) % 256
        eikULzJZ[bxXDfhgV], eikULzJZ[OlbAUnhS] = eikULzJZ[OlbAUnhS], eikULzJZ[bxXDfhgV]
        local fmWUzPjY = eikULzJZ[(eikULzJZ[bxXDfhgV] + eikULzJZ[OlbAUnhS]) % 256]
        local unmasked = bit32.bxor(tYkpmiYv, IWXTbmwE)
        table.insert(eCMsTicL, string.char(bit32.bxor(unmasked, fmWUzPjY)))
    end
    return table.concat(eCMsTicL)
end

local eikULzJZ_flat = {}
for _, chunk in ipairs(jgPRbYqo) do
    for _, byte in ipairs(chunk) do
        table.insert(eikULzJZ_flat, byte)
    end
end

local decrypted = zCQHBrYO(eikULzJZ_flat, pUAntxvu)
local HKsaFiEw, vIDqfdmE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(eikULzJZ_flat)
eikULzJZ_flat = nil

if HKsaFiEw then 
    local result = HKsaFiEw() 
    decrypted = nil
    HKsaFiEw = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(vIDqfdmE)) 
end
