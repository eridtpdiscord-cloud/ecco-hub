-- Compiled secure segment
local KJcGmJXv = {
{126,242,173,250,208,141,86,190,13,170,40,232,98,210,148,19,34,124,184,179,230,157,160,128,37,205,213,26,244,67,63,224,226,26,204,7,43,38,5,230,158,237,179,71,32,179,82,14,216,235,53,248,144,50,165,151,153,34,15,4},{150,169,74,210,70,195,219,110,117,123,122,85,64,213,212,180,88,197,247,142,193,117,116,180,156,61,60,29,26,96,75,60,55,45,20,97,230,113,104,49,143,249,198,150,212,65,169,252,138,209,225,94,195,57,68,156,42,233,37,229},{193,227,173,208,117,151,154,43,245,149,53,154,62,35,0,225,147,253,119,174,135,44,149,127,188,171,190,191,42,22,17,45,45,89,46,124,153,243,6,115,251,224,185,99,177,1,127,26,208,123,247,242,180,44,121,173,80,100,14,57},{245,236,69,164,71,88,16,223,135,135,236,227,52,134,116,82,34,213,169,26,242,100,196,122,230,188,31,60,65,27,242,115,200,136,136,102,86,16,122,234,239,16,26,254,190,169,8,2,166,140,41,167,18,47,153,68,47,124,157,121},{53,175,12,158,69,135,18,86,184,248,210,250,91,136,2,69,232,156,65,64,75,61,19,231,80,32,12,109,70,238,148,85,176,248,235,235,202,235,58,11,208,24,173,40,160,172,94,182,223,206,37,161,31,66,162,18,24,133,160,209},{133,247,173,41,242,195,160,46,133,28,81,128,62,184,18,14,182,155,196,138,140,249,47,248,97,34,92,224,153,107,124,41,156,72,123,113,116,166,240,87,215,140,54,90,150,194,101,135,12,179,71,82,69,29,32,74,82,119,34,95},{44,212,159,200,234,205,4,201,18,229,169,219,49,165,139,77,88,165,56,57,177,39,73,193,195,66,169,58,125,208,180,251,127,189,53,128,128,37,239,56,174,235,125,116,94,52}
}
local XOciFffr = "dmkUHWSaYrAUzRcH"

local function zJnUgdHM(cejVFXdO_data, cejVFXdO_key)
    local cejVFXdO = {}
    for GeikyKXR = 0, 255 do cejVFXdO[GeikyKXR] = GeikyKXR end
    local TKZLLVaL = 0
    for GeikyKXR = 0, 255 do
        local dqQUtuSh = cejVFXdO_key:byte((GeikyKXR % #cejVFXdO_key) + 1)
        TKZLLVaL = (TKZLLVaL + cejVFXdO[GeikyKXR] + dqQUtuSh) % 256
        cejVFXdO[GeikyKXR], cejVFXdO[TKZLLVaL] = cejVFXdO[TKZLLVaL], cejVFXdO[GeikyKXR]
    end
    local GeikyKXR = 0
    local TKZLLVaL = 0
    local hdFuPNSi = {}
    for _, vATWvpeu in ipairs(cejVFXdO_data) do
        GeikyKXR = (GeikyKXR + 1) % 256
        TKZLLVaL = (TKZLLVaL + cejVFXdO[GeikyKXR]) % 256
        cejVFXdO[GeikyKXR], cejVFXdO[TKZLLVaL] = cejVFXdO[TKZLLVaL], cejVFXdO[GeikyKXR]
        local dqQUtuSh = cejVFXdO[(cejVFXdO[GeikyKXR] + cejVFXdO[TKZLLVaL]) % 256]
        table.insert(hdFuPNSi, string.char(bit32.bxor(vATWvpeu, dqQUtuSh)))
    end
    return table.concat(hdFuPNSi)
end

local cejVFXdO_flat = {}
for _, chunk in ipairs(KJcGmJXv) do
    for _, byte in ipairs(chunk) do
        table.insert(cejVFXdO_flat, byte)
    end
end

local decrypted = zJnUgdHM(cejVFXdO_flat, XOciFffr)
local KjfQKYRb, YHtXdERE = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(cejVFXdO_flat)
cejVFXdO_flat = nil

if KjfQKYRb then 
    local result = KjfQKYRb() 
    decrypted = nil
    KjfQKYRb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(YHtXdERE)) 
end
