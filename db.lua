-- Protected Segment (db)
local DdJWcNuB = 67
local mqQFEsKc = {
{59,2,80,39,104,176,184,30,65,52,163,65,98,159,197,110,60,205,32,103,117,201,201,214,45,176,141,250,151,169,147,131,58,107,196,140,192,181,112,103,71,51,93,149,61,66,59,201,22,232,168,174,19,106,66,84,138,209,97,79},{33,89,14,182,86,0,215,142,251,1,104,65,237,166,12,210,224,215,159,232,9,192,7,55,98,95,43,5,72,213,79,176,70,223,222,206,116,26,147,216,152,116,192,95,83,84,146,202,71,20,89,139,166,242,145,24,187,46,36,72},{21,66,116,239,82,228,68,161,10,194,199,2,124,28,169,82,195,156,254,142,37,169,6,226,16,109,197,159,198,126,226,241,251,38,200,147,230,149,112,139,110,141,113,132,222,44,110,35,50,205,38,126,253,43,210,243,226,99,185,178},{40,123,130,195,103,23,143,157,194,71,162,129,118,223,155,188,27,106,75,43,227,50,211,73,128,47,46,129,46,155,240,30,4,217,124,222,41,88,218,63,210,249,194,45,39,128,17,162,245,85,36,231,18,187,99,179,163,35,181,87},{100,28,153,167,49,12,82,1,116,134,149,229,237,136,114,116,3,255,187,247,144,76,235,57,20,144,247,173,227,231,27,127,194,210,254,50,24,123,27,234,193,1,253,76,168,20,228,149,182,30,252,68,101,115,235,21,23,205,147,215},{217,255,32,198,150,177,1,82,140,154,86,253,151,142,67,76,221,116,250,109,221,214,227,104,188,152,120,229,128,230,31,128,246,191,237,184,243,178,149,107,64,12,116,37,238,116,115,190,57,92,48,101,34,98,43,58,91,205,30,43},{172,180,115,7,113,34,58,4,57,177,118,157,209,254,215,111,32,135,45,164,50,22,223,15,66,24,96,25,173,112,40,175,230,82,34,10,216,178,195,155,136,69,67}
}
local RFzqLYGW = "fIFdUSwSWEXuiKGN"

local function iRbMXAtf(xCRObbLn_data, xCRObbLn_key)
    local xCRObbLn = {}
    for JOUhJYaD = 0, 255 do xCRObbLn[JOUhJYaD] = JOUhJYaD end
    local wGcnNrVm = 0
    for JOUhJYaD = 0, 255 do
        local FeAGqSXH = xCRObbLn_key:byte((JOUhJYaD % #xCRObbLn_key) + 1)
        wGcnNrVm = (wGcnNrVm + xCRObbLn[JOUhJYaD] + FeAGqSXH) % 256
        xCRObbLn[JOUhJYaD], xCRObbLn[wGcnNrVm] = xCRObbLn[wGcnNrVm], xCRObbLn[JOUhJYaD]
    end
    local JOUhJYaD = 0
    local wGcnNrVm = 0
    local TZhcuvJD = {}
    for _, YtZVdWSx in ipairs(xCRObbLn_data) do
        JOUhJYaD = (JOUhJYaD + 1) % 256
        wGcnNrVm = (wGcnNrVm + xCRObbLn[JOUhJYaD]) % 256
        xCRObbLn[JOUhJYaD], xCRObbLn[wGcnNrVm] = xCRObbLn[wGcnNrVm], xCRObbLn[JOUhJYaD]
        local FeAGqSXH = xCRObbLn[(xCRObbLn[JOUhJYaD] + xCRObbLn[wGcnNrVm]) % 256]
        local unmasked = bit32.bxor(YtZVdWSx, DdJWcNuB)
        table.insert(TZhcuvJD, string.char(bit32.bxor(unmasked, FeAGqSXH)))
    end
    return table.concat(TZhcuvJD)
end

local xCRObbLn_flat = {}
for _, chunk in ipairs(mqQFEsKc) do
    for _, byte in ipairs(chunk) do
        table.insert(xCRObbLn_flat, byte)
    end
end

local decrypted = iRbMXAtf(xCRObbLn_flat, RFzqLYGW)
local hxFkdUjj, DcMCySLv = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xCRObbLn_flat)
xCRObbLn_flat = nil

if hxFkdUjj then 
    local result = hxFkdUjj() 
    decrypted = nil
    hxFkdUjj = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(DcMCySLv)) 
end
