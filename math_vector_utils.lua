-- Protected Segment (math_vector_utils)
local Bqroueoe = 111
local XsUUbzFr = {
{180,136,196,255,213,134,180,47,13,94,244,166,92,106,11,210,226,48,204,128,154,58,92,237,119,174,200,200,237,83,111,116,184,96,22,245,165,233,119,133,40,119,24,133,244,26,233,177,54,11,201,38,51,166,88,64,232,220,232,89},{201,91,92,212,67,232,216,214,59,188,139,234,127,94,178,212,206,254,194,108,240,115,198,118,238,56,23,187,46,121,98,138,29,56,29,179,158,162,203,104,135,126,65,32,197,160,23,23,153,195,59,9,3,248,222,183,9,5,21,29},{53,67,28,14,199,185,163,49,79,105,239,33,22,76,217,77,82,228,150,140,135,247,36,248,178,26,156,163,179}
}
local tnWuWqCM = "zPlKwUDjHYtwweUL"

local function yBCtyHtG(xhWIiDKM_data, xhWIiDKM_key)
    if type(xhWIiDKM_key) ~= "string" or #xhWIiDKM_key == 0 then return "" end
    local xhWIiDKM = {}
    for vqbAYHOB = 0, 255 do xhWIiDKM[vqbAYHOB] = vqbAYHOB end
    local aXPVfaju = 0
    for vqbAYHOB = 0, 255 do
        local LnAqiGfY = xhWIiDKM_key:byte((vqbAYHOB % #xhWIiDKM_key) + 1)
        aXPVfaju = (aXPVfaju + xhWIiDKM[vqbAYHOB] + LnAqiGfY) % 256
        xhWIiDKM[vqbAYHOB], xhWIiDKM[aXPVfaju] = xhWIiDKM[aXPVfaju], xhWIiDKM[vqbAYHOB]
    end
    local vqbAYHOB = 0
    local aXPVfaju = 0
    local MqRMiwjM = {}
    for _, onZlfJQO in ipairs(xhWIiDKM_data) do
        vqbAYHOB = (vqbAYHOB + 1) % 256
        aXPVfaju = (aXPVfaju + xhWIiDKM[vqbAYHOB]) % 256
        xhWIiDKM[vqbAYHOB], xhWIiDKM[aXPVfaju] = xhWIiDKM[aXPVfaju], xhWIiDKM[vqbAYHOB]
        local LnAqiGfY = xhWIiDKM[(xhWIiDKM[vqbAYHOB] + xhWIiDKM[aXPVfaju]) % 256]
        local unmasked = bit32.bxor(onZlfJQO, Bqroueoe)
        table.insert(MqRMiwjM, string.char(bit32.bxor(unmasked, LnAqiGfY)))
    end
    return table.concat(MqRMiwjM)
end

local xhWIiDKM_flat = {}
for _, chunk in ipairs(XsUUbzFr) do
    for _, byte in ipairs(chunk) do
        table.insert(xhWIiDKM_flat, byte)
    end
end

local decrypted = yBCtyHtG(xhWIiDKM_flat, tnWuWqCM)
local siBQZCxW, paRAYYeI = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xhWIiDKM_flat)
xhWIiDKM_flat = nil

if siBQZCxW then 
    local result = siBQZCxW() 
    decrypted = nil
    siBQZCxW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(paRAYYeI)) 
end
