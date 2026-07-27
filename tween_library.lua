-- Protected Segment (tween_library)
local jifmNasG = 60
local ZKkKcpZI = {
{246,162,102,178,220,225,40,99,139,64,96,9,151,211,74,71,80,212,233,15,189,16,197,36,57,189,3,222,47,88,169,55,13,31,238,48,55,21,166,112,244,187,30,26,201,194,29,86,220,79,190,9,47,129,219,44,246,138,177,112},{150,39,148,75,96,191,238,75,200,163,192,126,9,48,21,54,204,36,44,189,21,17,48,189,177,86,242,201,118,253,205,55,28,101,21,25,200,7,84,54,103,222,173,29,187,30,119,27,31,103,97,248,38,145,208,96,118,215,241,216},{48,76,165,187,53,167,66,249,173,209,213,16,130,77,253,208,201,214,148,219,27,22,68,181,97}
}
local rLQujPYP = "sJiTpUSfwnKAnIzB"

local function NwJOjGMI(envmvJQn_data, envmvJQn_key)
    if type(envmvJQn_key) ~= "string" or #envmvJQn_key == 0 then return "" end
    local envmvJQn = {}
    for imSmdEQK = 0, 255 do envmvJQn[imSmdEQK] = imSmdEQK end
    local NVuHcyPD = 0
    for imSmdEQK = 0, 255 do
        local zlZBfUte = envmvJQn_key:byte((imSmdEQK % #envmvJQn_key) + 1)
        NVuHcyPD = (NVuHcyPD + envmvJQn[imSmdEQK] + zlZBfUte) % 256
        envmvJQn[imSmdEQK], envmvJQn[NVuHcyPD] = envmvJQn[NVuHcyPD], envmvJQn[imSmdEQK]
    end
    local imSmdEQK = 0
    local NVuHcyPD = 0
    local pwuFuHkv = {}
    for _, fXtxLYKa in ipairs(envmvJQn_data) do
        imSmdEQK = (imSmdEQK + 1) % 256
        NVuHcyPD = (NVuHcyPD + envmvJQn[imSmdEQK]) % 256
        envmvJQn[imSmdEQK], envmvJQn[NVuHcyPD] = envmvJQn[NVuHcyPD], envmvJQn[imSmdEQK]
        local zlZBfUte = envmvJQn[(envmvJQn[imSmdEQK] + envmvJQn[NVuHcyPD]) % 256]
        local unmasked = bit32.bxor(fXtxLYKa, jifmNasG)
        table.insert(pwuFuHkv, string.char(bit32.bxor(unmasked, zlZBfUte)))
    end
    return table.concat(pwuFuHkv)
end

local envmvJQn_flat = {}
for _, chunk in ipairs(ZKkKcpZI) do
    for _, byte in ipairs(chunk) do
        table.insert(envmvJQn_flat, byte)
    end
end

local decrypted = NwJOjGMI(envmvJQn_flat, rLQujPYP)
local WRvyMcPF, BQVuOiuN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(envmvJQn_flat)
envmvJQn_flat = nil

if WRvyMcPF then 
    local result = WRvyMcPF() 
    decrypted = nil
    WRvyMcPF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(BQVuOiuN)) 
end
