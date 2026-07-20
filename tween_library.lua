-- Compiled secure segment
local iICWdKSz = {
{151,206,177,240,238,54,57,247,24,173,162,174,251,116,160,193,154,49,100,70,199,154,67,113,25,85,38,111,145,116,212,132,50,172,10,65,99,150,166,36,96,92,142,119,237,142,248,158,91,228,80,14,100,221,156,222,3,148,126,88},{30,186,156,20,255,62,119,225,12,162,22,92,64,56,34,240,15,239,191,208,72,64,10,33,180,62,196,192,48,223,43,222,89,152,110,176,135,254,248,93,190,156,79,219,178,239,5,135,62,123,141,23,8,87,238,2,83,189,202,246},{8,76,249,43,153,207,37,109,22,249,56,75,17,43,247,232,43,144,152,93,119,119,158,184,92}
}
local JShndYFO = "YnsSGJlQZfhAYWtZ"

local function JfeqVual(okMwEVYJ_data, okMwEVYJ_key)
    local okMwEVYJ = {}
    for lFzwAEsV = 0, 255 do okMwEVYJ[lFzwAEsV] = lFzwAEsV end
    local oxoZOlNm = 0
    for lFzwAEsV = 0, 255 do
        local eDmDCrUe = okMwEVYJ_key:byte((lFzwAEsV % #okMwEVYJ_key) + 1)
        oxoZOlNm = (oxoZOlNm + okMwEVYJ[lFzwAEsV] + eDmDCrUe) % 256
        okMwEVYJ[lFzwAEsV], okMwEVYJ[oxoZOlNm] = okMwEVYJ[oxoZOlNm], okMwEVYJ[lFzwAEsV]
    end
    local lFzwAEsV = 0
    local oxoZOlNm = 0
    local mkXnMHOB = {}
    for _, OoOrfzud in ipairs(okMwEVYJ_data) do
        lFzwAEsV = (lFzwAEsV + 1) % 256
        oxoZOlNm = (oxoZOlNm + okMwEVYJ[lFzwAEsV]) % 256
        okMwEVYJ[lFzwAEsV], okMwEVYJ[oxoZOlNm] = okMwEVYJ[oxoZOlNm], okMwEVYJ[lFzwAEsV]
        local eDmDCrUe = okMwEVYJ[(okMwEVYJ[lFzwAEsV] + okMwEVYJ[oxoZOlNm]) % 256]
        table.insert(mkXnMHOB, string.char(bit32.bxor(OoOrfzud, eDmDCrUe)))
    end
    return table.concat(mkXnMHOB)
end

local okMwEVYJ_flat = {}
for _, chunk in ipairs(iICWdKSz) do
    for _, byte in ipairs(chunk) do
        table.insert(okMwEVYJ_flat, byte)
    end
end

local decrypted = JfeqVual(okMwEVYJ_flat, JShndYFO)
local tuWkBQmf, BsRZLLBB = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(okMwEVYJ_flat)
okMwEVYJ_flat = nil

if tuWkBQmf then 
    local result = tuWkBQmf() 
    decrypted = nil
    tuWkBQmf = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(BsRZLLBB)) 
end
