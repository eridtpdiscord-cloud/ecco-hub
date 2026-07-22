-- Protected Segment (db)
local opzuMBEo = 62
local sHSoRppM = {
{164,30,206,93,197,240,12,92,50,143,47,197,17,128,4,170,167,198,97,171,188,172,94,77,98,187,114,97,178,21,15,213,10,9,159,130,74,5,148,80,68,65,152,93,4,165,210,39,46,176,51,173,217,9,192,223,70,207,182,77},{255,127,88,119,9,216,254,86,190,170,220,1,220,87,58,252,139,114,179,2,170,179,195,195,196,104,156,52,93,81,41,66,108,54,202,255,16,172,47,242,233,207,145,231,153,149,89,249,88,87,211,33,102,240,142,164,55,183,218,99},{236,24,20,101,193,199,104,91,78,242,1,174,199,71,245,211,17,116,4,209,167,119,12,45,50,181,205,42,99,250,145,209,92,73,42,183,6,231,220,220,202,134,232,112,97,118,60,253,241,3,202,58,38,254,196,133,183,131,139,157},{116,15,217,225,180,132,66,178,213,134,64,25,204,154,150,88,146,7,163,72,50,85,44,7,145,167,17,197,248,95,34,37,40,165,6,10,128,143,57,129,34,122,54,80,66,96,36,11,100,92,115,190,240,59,23,132,131,17,141,90},{235,151,160,198,217,232,60,80,77,186,80,238,48,167,255,107,106,244,179,134,23,72,154,117,12,120,201,212,72,197,251,84,171,12,186,248,200,183,5,252,51,69,12,79,135,230,153,151,177,143,33,137,221,210,153,109,77,59,198,226},{169,141,132,213,20,144,133,68,239,17,52,36,173,2,118,62,165,220,60,63,67,7,140,39,231,239,220,109,66,234,248,31,204,64,239,185,136,241,23,192,84,190,128,168,160,253,34,44,49,208,59,116,10,175,103,95,201,250,136,16},{13,58,250,109,145,188,125,242,146,106,238,183,63,61,34,195,215,39,157,239,232,130,174,126,60,55,255,209,23,116,212,64,83,125,89,118,172,148,105,158,253,66,177,251,166,92,236,3,142}
}
local uEZtwbkU = "tZYuyHmglyvofqcb"

local function VVVRChHq(xMaYqHRx_data, xMaYqHRx_key)
    local xMaYqHRx = {}
    for essAIBwX = 0, 255 do xMaYqHRx[essAIBwX] = essAIBwX end
    local tkYVMWDC = 0
    for essAIBwX = 0, 255 do
        local qbTxcUCt = xMaYqHRx_key:byte((essAIBwX % #xMaYqHRx_key) + 1)
        tkYVMWDC = (tkYVMWDC + xMaYqHRx[essAIBwX] + qbTxcUCt) % 256
        xMaYqHRx[essAIBwX], xMaYqHRx[tkYVMWDC] = xMaYqHRx[tkYVMWDC], xMaYqHRx[essAIBwX]
    end
    local essAIBwX = 0
    local tkYVMWDC = 0
    local jjGscxnA = {}
    for _, qFfUNoMw in ipairs(xMaYqHRx_data) do
        essAIBwX = (essAIBwX + 1) % 256
        tkYVMWDC = (tkYVMWDC + xMaYqHRx[essAIBwX]) % 256
        xMaYqHRx[essAIBwX], xMaYqHRx[tkYVMWDC] = xMaYqHRx[tkYVMWDC], xMaYqHRx[essAIBwX]
        local qbTxcUCt = xMaYqHRx[(xMaYqHRx[essAIBwX] + xMaYqHRx[tkYVMWDC]) % 256]
        local unmasked = bit32.bxor(qFfUNoMw, opzuMBEo)
        table.insert(jjGscxnA, string.char(bit32.bxor(unmasked, qbTxcUCt)))
    end
    return table.concat(jjGscxnA)
end

local xMaYqHRx_flat = {}
for _, chunk in ipairs(sHSoRppM) do
    for _, byte in ipairs(chunk) do
        table.insert(xMaYqHRx_flat, byte)
    end
end

local decrypted = VVVRChHq(xMaYqHRx_flat, uEZtwbkU)
local JIyMFcUP, TjdiIevH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(xMaYqHRx_flat)
xMaYqHRx_flat = nil

if JIyMFcUP then 
    local result = JIyMFcUP() 
    decrypted = nil
    JIyMFcUP = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(TjdiIevH)) 
end
