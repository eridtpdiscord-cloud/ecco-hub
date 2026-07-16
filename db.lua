-- Compiled secure segment
local zRgZrcAg = {
{45,145,9,115,225,146,155,41,87,20,126,122,41,97,141,32,228,90,126,250,97,2,158,234,6,100,176,180,128,226,142,77,173,227,71,189,92,143,223,209,57,62,14,73,190,181,178,77,68,71,145,73,63,182,248,51,19,74,6,63},{225,105,223,39,124,84,60,107,34,204,185,29,176,240,37,134,21,232,77,125,107,125,63,134,147,97,146,88,153,10,189,130,103,113,198,247,236,75,248,88,228,166,14,158,33,66,120,68,242,210,238,185,45,4,162,81,167,112,118,148},{212,158,12,138,99,220,244,154,105,252,71,44,126,236,203,88,171,246,31,44,230,61,152,81,32,220,177,136,110,47,229,3,37,234,2,205,231,203,255,171,23,66,163,56,171,149,231,154,222,200,210,123,1,183,195,46,33,199,61,44},{227,1,141,109,98,5,180,47,67,124,38,204,116,119,112,126,245,172,252,209,32,252,215,247,79,223,69,230,24,170,1,163,202,251,55,79,140,81,43,132,201,116,239,100,141,206,220,91,222,200,27,190,116,235,227,55,82,43,79,86},{196,252,104,45,253,187,183,151,241,121,54,202,170,46,203,235,40,112,225,197,52,130,63,159,0,93,72,10,208,245,234,196,150,245,248,177,50,40,221,27,169,147,9,36,36,197,27,76,165,27,3,130,200,101,130,236,120,89,88,233},{227,234,253,229,16,15,83,152,64,129,143,97,77,127,88,23,158,203,182,86,15,160,88,62,242,25,128,142,251,71,133,49,65,25,12,171,137,147,169,194,92,238,106,184,170,204,244,65,213,91,70,186,126,5,170,144,153,47,199,31},{38,138,62,172,39,70,227,240,26,112,252,45,42,199,156,248,105,146,252,62,73,39,184,117,195,189,96,188,68,2,154,172,19,28,96,16,63,201,94,31,175,85,216,180,69,168,97,52,134,16,244,152,196,81,150,113,46,94,222,70},{96,58,192,31,222,71,225,73,186,18,75,77,78,47,3,104,150,6,67,11,126}
}
local hXEIwblX = "nAapquFhivdiwzQd"

local function sLumeWcI(nnsthYIF_data, nnsthYIF_key)
    local nnsthYIF = {}
    for rBbTvuVU = 0, 255 do nnsthYIF[rBbTvuVU] = rBbTvuVU end
    local GMYEJqoq = 0
    for rBbTvuVU = 0, 255 do
        local zKxQOTcM = nnsthYIF_key:byte((rBbTvuVU % #nnsthYIF_key) + 1)
        GMYEJqoq = (GMYEJqoq + nnsthYIF[rBbTvuVU] + zKxQOTcM) % 256
        nnsthYIF[rBbTvuVU], nnsthYIF[GMYEJqoq] = nnsthYIF[GMYEJqoq], nnsthYIF[rBbTvuVU]
    end
    local rBbTvuVU = 0
    local GMYEJqoq = 0
    local SajLGQVE = {}
    for _, TfkatgRt in ipairs(nnsthYIF_data) do
        rBbTvuVU = (rBbTvuVU + 1) % 256
        GMYEJqoq = (GMYEJqoq + nnsthYIF[rBbTvuVU]) % 256
        nnsthYIF[rBbTvuVU], nnsthYIF[GMYEJqoq] = nnsthYIF[GMYEJqoq], nnsthYIF[rBbTvuVU]
        local zKxQOTcM = nnsthYIF[(nnsthYIF[rBbTvuVU] + nnsthYIF[GMYEJqoq]) % 256]
        table.insert(SajLGQVE, string.char(bit32.bxor(TfkatgRt, zKxQOTcM)))
    end
    return table.concat(SajLGQVE)
end

local nnsthYIF_flat = {}
for _, chunk in ipairs(zRgZrcAg) do
    for _, byte in ipairs(chunk) do
        table.insert(nnsthYIF_flat, byte)
    end
end

local decrypted = sLumeWcI(nnsthYIF_flat, hXEIwblX)
local jaZZcRhq, ubohpsER = loadstring(decrypted)
if jaZZcRhq then 
    return jaZZcRhq() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(ubohpsER)) 
end
