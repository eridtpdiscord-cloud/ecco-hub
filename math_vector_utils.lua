-- Compiled secure segment
local fIWYdZes = {
{252,35,177,131,7,134,129,91,28,27,211,126,0,55,70,98,143,57,155,238,82,112,215,133,202,252,122,97,101,68,140,92,173,215,87,167,92,150,140,229,43,205,124,169,151,90,214,202,42,89,188,144,29,65,155,46,150,76,77,151},{240,36,194,207,91,212,107,191,68,34,98,95,224,225,208,88,86,64,116,83,156,128,200,113,240,113,71,174,213,200,221,163,234,28,143,117,63,80,101,123,249,179,59,82,129,221,253,202,135,29,125,248,178,244,23,91,18,81,156,74},{179,119,251,225,129,110,109,52,56,186,54,195,180,249,254,233,83,115,227,0,217,36,116,167,6,46,118,235,159}
}
local mDrowiir = "CZpTOrJfqJqqMHKZ"

local function ZreFZStM(iTnecCQB_data, iTnecCQB_key)
    local iTnecCQB = {}
    for SjzNqlSD = 0, 255 do iTnecCQB[SjzNqlSD] = SjzNqlSD end
    local gnctnVjC = 0
    for SjzNqlSD = 0, 255 do
        local nvkOxudJ = iTnecCQB_key:byte((SjzNqlSD % #iTnecCQB_key) + 1)
        gnctnVjC = (gnctnVjC + iTnecCQB[SjzNqlSD] + nvkOxudJ) % 256
        iTnecCQB[SjzNqlSD], iTnecCQB[gnctnVjC] = iTnecCQB[gnctnVjC], iTnecCQB[SjzNqlSD]
    end
    local SjzNqlSD = 0
    local gnctnVjC = 0
    local PBckXcCi = {}
    for _, zWLvNRnp in ipairs(iTnecCQB_data) do
        SjzNqlSD = (SjzNqlSD + 1) % 256
        gnctnVjC = (gnctnVjC + iTnecCQB[SjzNqlSD]) % 256
        iTnecCQB[SjzNqlSD], iTnecCQB[gnctnVjC] = iTnecCQB[gnctnVjC], iTnecCQB[SjzNqlSD]
        local nvkOxudJ = iTnecCQB[(iTnecCQB[SjzNqlSD] + iTnecCQB[gnctnVjC]) % 256]
        table.insert(PBckXcCi, string.char(bit32.bxor(zWLvNRnp, nvkOxudJ)))
    end
    return table.concat(PBckXcCi)
end

local iTnecCQB_flat = {}
for _, chunk in ipairs(fIWYdZes) do
    for _, byte in ipairs(chunk) do
        table.insert(iTnecCQB_flat, byte)
    end
end

local decrypted = ZreFZStM(iTnecCQB_flat, mDrowiir)
local DOrHxwjT, gjGXRgCB = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(iTnecCQB_flat)
iTnecCQB_flat = nil

if DOrHxwjT then 
    local result = DOrHxwjT() 
    decrypted = nil
    DOrHxwjT = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(gjGXRgCB)) 
end
