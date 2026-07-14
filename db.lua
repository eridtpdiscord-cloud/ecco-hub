-- Compiled secure segment
local WSBWxmHI = {
{168,236,216,80,176,210,180,44,51,205,137,232,124,142,0,15,124,60,185,51,152,75,176,135,101,40,82,49,122,10,162,188,66,204,57,135,167,76,146,239,212,190,190,157,221,16,48,184,27,15,25,109,136,218,99,145,221,212,159,246},{166,202,20,125,23,116,130,127,60,108,107,33,99,50,239,55,192,138,141,2,207,160,246,11,111,217,242,235,178,32,110,251,160,77,46,128,202,147,122,0,46,15,190,144,30,114,109,203,204,69,101,222,72,190,114,71,63,43,152,225},{90,171,160,209,94,53,220,180,44,107,82,218,219,203,215,26,170,96,248,83,247,139,44,151,38,0,158,2,118,97,191,162,171,88,77,69,14,137,156,76,210,241,142,54,8,160,29,59,75,246,198,237,131,119,75,13,70,190,240,199},{176,111,186,48,165,205,208,136,73,74,28,153,252,235,145,178,111,158,175,180,61,186,146,36,190,60,201,204,136,104,20,177,132,153,163,160,192,113,181,105,64,135,29,244,237,81,195,46,3,78,234,104,25,148,255,199}
}
local ToANgmHQ = "fTUhnJzZELYnkvWD"

local function WLzHOjIw(PWPBsjPd_data, PWPBsjPd_key)
    local PWPBsjPd = {}
    for fvNlTWlg = 0, 255 do PWPBsjPd[fvNlTWlg] = fvNlTWlg end
    local GGyUdefi = 0
    for fvNlTWlg = 0, 255 do
        local QzTEEjTF = PWPBsjPd_key:byte((fvNlTWlg % #PWPBsjPd_key) + 1)
        GGyUdefi = (GGyUdefi + PWPBsjPd[fvNlTWlg] + QzTEEjTF) % 256
        PWPBsjPd[fvNlTWlg], PWPBsjPd[GGyUdefi] = PWPBsjPd[GGyUdefi], PWPBsjPd[fvNlTWlg]
    end
    local fvNlTWlg = 0
    local GGyUdefi = 0
    local UcJlrmKd = {}
    for _, njPGdLXF in ipairs(PWPBsjPd_data) do
        fvNlTWlg = (fvNlTWlg + 1) % 256
        GGyUdefi = (GGyUdefi + PWPBsjPd[fvNlTWlg]) % 256
        PWPBsjPd[fvNlTWlg], PWPBsjPd[GGyUdefi] = PWPBsjPd[GGyUdefi], PWPBsjPd[fvNlTWlg]
        local QzTEEjTF = PWPBsjPd[(PWPBsjPd[fvNlTWlg] + PWPBsjPd[GGyUdefi]) % 256]
        table.insert(UcJlrmKd, string.char(bit32.bxor(njPGdLXF, QzTEEjTF)))
    end
    return table.concat(UcJlrmKd)
end

local PWPBsjPd_flat = {}
for _, chunk in ipairs(WSBWxmHI) do
    for _, byte in ipairs(chunk) do
        table.insert(PWPBsjPd_flat, byte)
    end
end

local decrypted = WLzHOjIw(PWPBsjPd_flat, ToANgmHQ)
local XskKcFjj, HLQIZOGV = loadstring(decrypted)
if XskKcFjj then 
    XskKcFjj() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(HLQIZOGV)) 
end
