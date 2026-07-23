-- Protected Segment (teleport_handler)
local ugnXpBPy = 234
local TzNlrEDQ = {
{139,164,255,85,190,39,99,67,236,84,78,133,222,26,245,8,8,30,134,205,114,7,218,186,172,25,148,155,80,106,166,174,73,169,24,91,244,209,202,93,158,175,106,235,76,78,140,152,72,226,169,127,173,127,43,153,42,108,210,217},{43,219,54,174,71,222,80,27,82,108,24,215,74,74,225,196,46,42,109,17,135,232,229,111,160,154,155,105,213,167,183,44,216,56,211,197,131,125,65,225,231,159,133,28,25,209,147,235,206,152,241,72,109,249,136,162,19,251,103,68},{230,219,229,119,7,45,37,0,18,15,24,115,147,214,29,2,238,103,217,122,250,149,3,247,127,179,113,186}
}
local ZmVaiwEr = "MueXFgaJHPjVBecW"

local function ZUpAVSuQ(QcmRrkTw_data, QcmRrkTw_key)
    if type(QcmRrkTw_key) ~= "string" or #QcmRrkTw_key == 0 then return "" end
    local QcmRrkTw = {}
    for CAUhCskN = 0, 255 do QcmRrkTw[CAUhCskN] = CAUhCskN end
    local ptOmklEG = 0
    for CAUhCskN = 0, 255 do
        local klSVvdCF = QcmRrkTw_key:byte((CAUhCskN % #QcmRrkTw_key) + 1)
        ptOmklEG = (ptOmklEG + QcmRrkTw[CAUhCskN] + klSVvdCF) % 256
        QcmRrkTw[CAUhCskN], QcmRrkTw[ptOmklEG] = QcmRrkTw[ptOmklEG], QcmRrkTw[CAUhCskN]
    end
    local CAUhCskN = 0
    local ptOmklEG = 0
    local gMcanYrN = {}
    for _, WXIBmFuf in ipairs(QcmRrkTw_data) do
        CAUhCskN = (CAUhCskN + 1) % 256
        ptOmklEG = (ptOmklEG + QcmRrkTw[CAUhCskN]) % 256
        QcmRrkTw[CAUhCskN], QcmRrkTw[ptOmklEG] = QcmRrkTw[ptOmklEG], QcmRrkTw[CAUhCskN]
        local klSVvdCF = QcmRrkTw[(QcmRrkTw[CAUhCskN] + QcmRrkTw[ptOmklEG]) % 256]
        local unmasked = bit32.bxor(WXIBmFuf, ugnXpBPy)
        table.insert(gMcanYrN, string.char(bit32.bxor(unmasked, klSVvdCF)))
    end
    return table.concat(gMcanYrN)
end

local QcmRrkTw_flat = {}
for _, chunk in ipairs(TzNlrEDQ) do
    for _, byte in ipairs(chunk) do
        table.insert(QcmRrkTw_flat, byte)
    end
end

local decrypted = ZUpAVSuQ(QcmRrkTw_flat, ZmVaiwEr)
local BaoIFmbM, BBBNrHGh = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(QcmRrkTw_flat)
QcmRrkTw_flat = nil

if BaoIFmbM then 
    local result = BaoIFmbM() 
    decrypted = nil
    BaoIFmbM = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "teleport_handler" .. "): " .. tostring(BBBNrHGh)) 
end
