-- Compiled secure segment
local vwzurRbk = {
{85,127,248,122,173,41,56,42,186,47,46,89,253,217,244,16,178,248,79,52,220,131,171,144,83,28,179,34,60,243,210,236,157,168,111,238,219,237,131,111,223,150,60,235,220,228,192,216,158,124,146,115,119,153,130,39,43,101,138,246},{39,168,122,234,123,87,59,99,181,149,103,248,134,208,99,140,201,107,222,55,202,154,6,198,39,232,99,2,151,207,254,185,194,239,179,81,20,79,139,128,78,151,225,148,171,35,254,1,185,210,136,83,127,190,221,99,117,231,226,187},{68,10,250,135,69,219,142,178,123,100,13,119,224,170,54,144,191,36,27,140,151,1,239,116,89,26,128,64}
}
local PAYURMwG = "btVPxWdVWwupvRje"

local function RshSyNDS(fvKTkeGZ_data, fvKTkeGZ_key)
    local fvKTkeGZ = {}
    for pNdPidPb = 0, 255 do fvKTkeGZ[pNdPidPb] = pNdPidPb end
    local kIldieBx = 0
    for pNdPidPb = 0, 255 do
        local zUFvtwfc = fvKTkeGZ_key:byte((pNdPidPb % #fvKTkeGZ_key) + 1)
        kIldieBx = (kIldieBx + fvKTkeGZ[pNdPidPb] + zUFvtwfc) % 256
        fvKTkeGZ[pNdPidPb], fvKTkeGZ[kIldieBx] = fvKTkeGZ[kIldieBx], fvKTkeGZ[pNdPidPb]
    end
    local pNdPidPb = 0
    local kIldieBx = 0
    local BzXGDWOt = {}
    for _, CPLrrRrS in ipairs(fvKTkeGZ_data) do
        pNdPidPb = (pNdPidPb + 1) % 256
        kIldieBx = (kIldieBx + fvKTkeGZ[pNdPidPb]) % 256
        fvKTkeGZ[pNdPidPb], fvKTkeGZ[kIldieBx] = fvKTkeGZ[kIldieBx], fvKTkeGZ[pNdPidPb]
        local zUFvtwfc = fvKTkeGZ[(fvKTkeGZ[pNdPidPb] + fvKTkeGZ[kIldieBx]) % 256]
        table.insert(BzXGDWOt, string.char(bit32.bxor(CPLrrRrS, zUFvtwfc)))
    end
    return table.concat(BzXGDWOt)
end

local fvKTkeGZ_flat = {}
for _, chunk in ipairs(vwzurRbk) do
    for _, byte in ipairs(chunk) do
        table.insert(fvKTkeGZ_flat, byte)
    end
end

local decrypted = RshSyNDS(fvKTkeGZ_flat, PAYURMwG)
local tEEzUnzC, VAHjykaK = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(fvKTkeGZ_flat)
fvKTkeGZ_flat = nil

if tEEzUnzC then 
    local result = tEEzUnzC() 
    decrypted = nil
    tEEzUnzC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(VAHjykaK)) 
end
