-- Protected Segment (utility_helper)
local gPCtfPCm = 229
local zsKEWihq = {
{11,230,76,47,41,8,91,154,196,129,198,158,138,3,223,91,84,242,253,254,226,26,198,120,95,60,12,210,155,14,149,66,15,200,129,208,195,20,49,75,161,157,251,106,130,205,124,150,86,52,218,142,193,249,97,206,221,90,254,60},{216,104,183,202,103,68,7,13,22,175,25,184,147,160,221,5,202,226,224,246,156,46,90,145,80,173,199,88,5,207,37,179,202,233,229,169,149,200,58,99,55,194,248,101,197,26,178,161,9,52,131,187,68,32,206,224,87,72,82,32},{65,74,221,242,206,247,85,42,203,39,130,127,19,48,115,82,31,162,192,118,199,75,142,46,242,186}
}
local SeNHNVuc = "bhfrSInOOoUKXtXb"

local function wFdrrVsM(sHuhtfNA_data, sHuhtfNA_key)
    local sHuhtfNA = {}
    for FCxcGHca = 0, 255 do sHuhtfNA[FCxcGHca] = FCxcGHca end
    local yVdjKnPf = 0
    for FCxcGHca = 0, 255 do
        local flTjxndN = sHuhtfNA_key:byte((FCxcGHca % #sHuhtfNA_key) + 1)
        yVdjKnPf = (yVdjKnPf + sHuhtfNA[FCxcGHca] + flTjxndN) % 256
        sHuhtfNA[FCxcGHca], sHuhtfNA[yVdjKnPf] = sHuhtfNA[yVdjKnPf], sHuhtfNA[FCxcGHca]
    end
    local FCxcGHca = 0
    local yVdjKnPf = 0
    local cWlGznEo = {}
    for _, sVggfmNc in ipairs(sHuhtfNA_data) do
        FCxcGHca = (FCxcGHca + 1) % 256
        yVdjKnPf = (yVdjKnPf + sHuhtfNA[FCxcGHca]) % 256
        sHuhtfNA[FCxcGHca], sHuhtfNA[yVdjKnPf] = sHuhtfNA[yVdjKnPf], sHuhtfNA[FCxcGHca]
        local flTjxndN = sHuhtfNA[(sHuhtfNA[FCxcGHca] + sHuhtfNA[yVdjKnPf]) % 256]
        local unmasked = bit32.bxor(sVggfmNc, gPCtfPCm)
        table.insert(cWlGznEo, string.char(bit32.bxor(unmasked, flTjxndN)))
    end
    return table.concat(cWlGznEo)
end

local sHuhtfNA_flat = {}
for _, chunk in ipairs(zsKEWihq) do
    for _, byte in ipairs(chunk) do
        table.insert(sHuhtfNA_flat, byte)
    end
end

local decrypted = wFdrrVsM(sHuhtfNA_flat, SeNHNVuc)
local cStMaTzV, GPsulUNq = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(sHuhtfNA_flat)
sHuhtfNA_flat = nil

if cStMaTzV then 
    local result = cStMaTzV() 
    decrypted = nil
    cStMaTzV = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(GPsulUNq)) 
end
