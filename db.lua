-- Compiled secure segment
local IQQouAsw = {
{160,163,15,156,47,67,106,136,41,169,107,61,143,109,235,1,232,170,18,8,245,73,80,44,33,10,180,69,95,29,138,178,100,54,94,222,56,180,112,226,208,161,161,91,102,154,15,52,211,120,182,218,154,191,253,151,234,115,254,173},{84,78,198,104,203,177,143,182,23,204,18,233,2,240,117,78,74,188,210,90,197,196,185,191,170,119,174,152,236,60,173,191,190,176,227,136,165,237,140,225,204,221,234,135,252,194,17,19,167,144,29,21,224,231,35,125,92,201,100,217},{213,194,73,60,106,60,165,18,45,78,107,6,169,60,46,130,176,20,9,185,90,189,135,132,46,105,95,162,181,55,85,37,181,221,240,134,159,21,135,79,74,61,108,144,227,55,235,239,116,143,186,199,148,218,167,118,247,70,184,82},{246,27,243,68,11,39,59,212,97,56,115,251,219,211,3,112,86,239,184,114,81,107,31,238,20,134,86,116,204,51,128,176,215,251,26,170,120,131,254,97,241,53,50,200,3,233,38,11,216,4,84,200,235,175,99,54}
}
local kICsRkkE = "GLOaNUasfznqqIKM"

local function ckhUwRyo(CNPYQvLO_data, CNPYQvLO_key)
    local CNPYQvLO = {}
    for zmXiBrqt = 0, 255 do CNPYQvLO[zmXiBrqt] = zmXiBrqt end
    local bSCFpWOM = 0
    for zmXiBrqt = 0, 255 do
        local ghIiiVuK = CNPYQvLO_key:byte((zmXiBrqt % #CNPYQvLO_key) + 1)
        bSCFpWOM = (bSCFpWOM + CNPYQvLO[zmXiBrqt] + ghIiiVuK) % 256
        CNPYQvLO[zmXiBrqt], CNPYQvLO[bSCFpWOM] = CNPYQvLO[bSCFpWOM], CNPYQvLO[zmXiBrqt]
    end
    local zmXiBrqt = 0
    local bSCFpWOM = 0
    local frspANEr = {}
    for _, SQEMjMbD in ipairs(CNPYQvLO_data) do
        zmXiBrqt = (zmXiBrqt + 1) % 256
        bSCFpWOM = (bSCFpWOM + CNPYQvLO[zmXiBrqt]) % 256
        CNPYQvLO[zmXiBrqt], CNPYQvLO[bSCFpWOM] = CNPYQvLO[bSCFpWOM], CNPYQvLO[zmXiBrqt]
        local ghIiiVuK = CNPYQvLO[(CNPYQvLO[zmXiBrqt] + CNPYQvLO[bSCFpWOM]) % 256]
        table.insert(frspANEr, string.char(bit32.bxor(SQEMjMbD, ghIiiVuK)))
    end
    return table.concat(frspANEr)
end

local CNPYQvLO_flat = {}
for _, chunk in ipairs(IQQouAsw) do
    for _, byte in ipairs(chunk) do
        table.insert(CNPYQvLO_flat, byte)
    end
end

local decrypted = ckhUwRyo(CNPYQvLO_flat, kICsRkkE)
local vvHMRhSS, bbNiqLZr = loadstring(decrypted)
if vvHMRhSS then 
    return vvHMRhSS() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(bbNiqLZr)) 
end
