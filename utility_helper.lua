-- Protected Segment (utility_helper)
local NfRTsfOx = 38
local JsRzHUYO = {
{137,10,221,95,51,27,75,187,225,22,252,100,111,64,249,114,48,164,207,198,50,193,151,30,11,153,176,115,154,102,171,40,25,205,173,111,14,173,63,184,182,115,54,171,158,96,211,42,138,27,143,51,71,126,32,109,30,129,179,132},{198,13,35,127,234,11,83,196,82,109,77,30,192,207,108,118,36,117,113,52,113,200,146,179,239,192,22,129,159,229,186,192,126,146,197,18,154,147,0,192,172,155,212,98,60,217,100,17,143,130,142,59,142,182,38,47,183,55,233,197},{66,38,65,52,128,238,106,107,107,52,171,242,78,156,179,177,205,61,182,27,186,229,9,101,155,86}
}
local uzpgEPyd = "ROnljrWvIUpJIBqj"

local function AmNVJbhK(UCxFNIPi_data, UCxFNIPi_key)
    local UCxFNIPi = {}
    for zmMPlgSE = 0, 255 do UCxFNIPi[zmMPlgSE] = zmMPlgSE end
    local DlHMmWWR = 0
    for zmMPlgSE = 0, 255 do
        local bRGLtTVv = UCxFNIPi_key:byte((zmMPlgSE % #UCxFNIPi_key) + 1)
        DlHMmWWR = (DlHMmWWR + UCxFNIPi[zmMPlgSE] + bRGLtTVv) % 256
        UCxFNIPi[zmMPlgSE], UCxFNIPi[DlHMmWWR] = UCxFNIPi[DlHMmWWR], UCxFNIPi[zmMPlgSE]
    end
    local zmMPlgSE = 0
    local DlHMmWWR = 0
    local EeWTAWUw = {}
    for _, qjeWeEwl in ipairs(UCxFNIPi_data) do
        zmMPlgSE = (zmMPlgSE + 1) % 256
        DlHMmWWR = (DlHMmWWR + UCxFNIPi[zmMPlgSE]) % 256
        UCxFNIPi[zmMPlgSE], UCxFNIPi[DlHMmWWR] = UCxFNIPi[DlHMmWWR], UCxFNIPi[zmMPlgSE]
        local bRGLtTVv = UCxFNIPi[(UCxFNIPi[zmMPlgSE] + UCxFNIPi[DlHMmWWR]) % 256]
        local unmasked = bit32.bxor(qjeWeEwl, NfRTsfOx)
        table.insert(EeWTAWUw, string.char(bit32.bxor(unmasked, bRGLtTVv)))
    end
    return table.concat(EeWTAWUw)
end

local UCxFNIPi_flat = {}
for _, chunk in ipairs(JsRzHUYO) do
    for _, byte in ipairs(chunk) do
        table.insert(UCxFNIPi_flat, byte)
    end
end

local decrypted = AmNVJbhK(UCxFNIPi_flat, uzpgEPyd)
local zSNyUJIC, zHARitSF = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(UCxFNIPi_flat)
UCxFNIPi_flat = nil

if zSNyUJIC then 
    local result = zSNyUJIC() 
    decrypted = nil
    zSNyUJIC = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(zHARitSF)) 
end
