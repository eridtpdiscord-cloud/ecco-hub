-- Protected Segment (network_optimizer)
local jVWHfdwE = 38
local CrGdRrBL = {
{229,60,149,34,7,145,223,139,16,104,65,103,80,22,29,244,44,142,239,100,250,11,167,23,2,176,31,132,191,105,233,111,25,83,89,111,204,102,250,122,111,76,136,196,243,255,193,139,192,153,242,242,54,183,231,22,0,0,232,91},{79,240,136,140,175,1,62,214,250,129,249,213,215,166,157,73,254,195,99,94,131,226,162,148,2,55,200,235,202,116,128,241,216,152,95,60,122,143,195,247,182,201,49,83,222,167,133,73,197,240,163,233,160,243,80,157,203,49,33,231},{55,243,51,14,232,212,52,122,52,146,189,133,236,224,120,162,209,57,56,194,104,172,52,237,163,59,208,85,178}
}
local pxJzaYWx = "VaYcNwfWrBqhsfXc"

local function uIqvwgtV(XTinSpms_data, XTinSpms_key)
    local XTinSpms = {}
    for xWhgDTrq = 0, 255 do XTinSpms[xWhgDTrq] = xWhgDTrq end
    local eyHPgltv = 0
    for xWhgDTrq = 0, 255 do
        local voNesSkt = XTinSpms_key:byte((xWhgDTrq % #XTinSpms_key) + 1)
        eyHPgltv = (eyHPgltv + XTinSpms[xWhgDTrq] + voNesSkt) % 256
        XTinSpms[xWhgDTrq], XTinSpms[eyHPgltv] = XTinSpms[eyHPgltv], XTinSpms[xWhgDTrq]
    end
    local xWhgDTrq = 0
    local eyHPgltv = 0
    local ZguhDyYc = {}
    for _, DoMsZzhF in ipairs(XTinSpms_data) do
        xWhgDTrq = (xWhgDTrq + 1) % 256
        eyHPgltv = (eyHPgltv + XTinSpms[xWhgDTrq]) % 256
        XTinSpms[xWhgDTrq], XTinSpms[eyHPgltv] = XTinSpms[eyHPgltv], XTinSpms[xWhgDTrq]
        local voNesSkt = XTinSpms[(XTinSpms[xWhgDTrq] + XTinSpms[eyHPgltv]) % 256]
        local unmasked = bit32.bxor(DoMsZzhF, jVWHfdwE)
        table.insert(ZguhDyYc, string.char(bit32.bxor(unmasked, voNesSkt)))
    end
    return table.concat(ZguhDyYc)
end

local XTinSpms_flat = {}
for _, chunk in ipairs(CrGdRrBL) do
    for _, byte in ipairs(chunk) do
        table.insert(XTinSpms_flat, byte)
    end
end

local decrypted = uIqvwgtV(XTinSpms_flat, pxJzaYWx)
local lNzNDlUW, fBCegEvE = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(XTinSpms_flat)
XTinSpms_flat = nil

if lNzNDlUW then 
    local result = lNzNDlUW() 
    decrypted = nil
    lNzNDlUW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(fBCegEvE)) 
end
