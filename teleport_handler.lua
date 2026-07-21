-- Compiled secure segment
local gISdAALv = {
{131,188,0,219,23,117,180,230,201,182,61,39,83,77,28,199,159,248,14,100,159,244,99,131,79,74,139,18,124,118,97,195,232,159,41,235,133,195,243,150,39,122,189,87,55,193,177,102,243,241,171,85,113,58,53,142,143,56,86,192},{7,25,58,152,183,170,2,129,186,242,180,130,7,197,45,22,143,224,24,166,122,48,9,181,86,225,112,220,88,88,85,250,95,31,205,202,78,178,190,175,10,121,145,127,202,74,37,103,30,74,67,84,190,249,72,189,43,255,42,203},{214,244,60,224,173,140,174,169,189,89,114,76,248,87,87,212,137,30,178,219,34,187,150,8,127,208,149,13}
}
local iaTeMiUF = "SFrizfOQPbhHvOPW"

local function dNkdTspj(TalRQhet_data, TalRQhet_key)
    local TalRQhet = {}
    for uPqsROOi = 0, 255 do TalRQhet[uPqsROOi] = uPqsROOi end
    local LTMRbMpY = 0
    for uPqsROOi = 0, 255 do
        local uPgvCLyW = TalRQhet_key:byte((uPqsROOi % #TalRQhet_key) + 1)
        LTMRbMpY = (LTMRbMpY + TalRQhet[uPqsROOi] + uPgvCLyW) % 256
        TalRQhet[uPqsROOi], TalRQhet[LTMRbMpY] = TalRQhet[LTMRbMpY], TalRQhet[uPqsROOi]
    end
    local uPqsROOi = 0
    local LTMRbMpY = 0
    local bYyiBtGh = {}
    for _, EBVFvITu in ipairs(TalRQhet_data) do
        uPqsROOi = (uPqsROOi + 1) % 256
        LTMRbMpY = (LTMRbMpY + TalRQhet[uPqsROOi]) % 256
        TalRQhet[uPqsROOi], TalRQhet[LTMRbMpY] = TalRQhet[LTMRbMpY], TalRQhet[uPqsROOi]
        local uPgvCLyW = TalRQhet[(TalRQhet[uPqsROOi] + TalRQhet[LTMRbMpY]) % 256]
        table.insert(bYyiBtGh, string.char(bit32.bxor(EBVFvITu, uPgvCLyW)))
    end
    return table.concat(bYyiBtGh)
end

local TalRQhet_flat = {}
for _, chunk in ipairs(gISdAALv) do
    for _, byte in ipairs(chunk) do
        table.insert(TalRQhet_flat, byte)
    end
end

local decrypted = dNkdTspj(TalRQhet_flat, iaTeMiUF)
local wmQrEbgQ, jrvXHfNs = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(TalRQhet_flat)
TalRQhet_flat = nil

if wmQrEbgQ then 
    local result = wmQrEbgQ() 
    decrypted = nil
    wmQrEbgQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(jrvXHfNs)) 
end
