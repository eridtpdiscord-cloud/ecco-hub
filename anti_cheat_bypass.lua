-- Compiled secure segment
local cIIDMwsj = {
{62,5,97,99,17,250,190,3,50,170,219,169,121,14,213,107,53,156,211,127,101,28,81,240,239,217,124,136,98,120,98,240,23,251,238,68,37,3,191,254,138,160,13,183,91,175,217,133,46,137,145,9,126,54,221,144,2,92,190,103},{245,182,240,166,214,48,116,194,190,76,20,38,149,92,86,83,133,127,139,29,133,30,153,161,5,112,137,56,104,227,220,165,195,176,159,77,218,254,19,8,53,199,119,151,171,36,191,115,83,202,56,2,0,255,92,53,11,193,199,157},{2,138,184,64,96,220,71,16,193,131,219,39,255,26,126,54,51,251,143,135,190,198,206,222,76,82,59,40,0}
}
local DUNaOTxY = "xHpCmfrKOEkSVRDO"

local function LfVTbPUF(wHHbbIhO_data, wHHbbIhO_key)
    local wHHbbIhO = {}
    for lGGJBClb = 0, 255 do wHHbbIhO[lGGJBClb] = lGGJBClb end
    local ZKCFzdqt = 0
    for lGGJBClb = 0, 255 do
        local ZNDkeWAl = wHHbbIhO_key:byte((lGGJBClb % #wHHbbIhO_key) + 1)
        ZKCFzdqt = (ZKCFzdqt + wHHbbIhO[lGGJBClb] + ZNDkeWAl) % 256
        wHHbbIhO[lGGJBClb], wHHbbIhO[ZKCFzdqt] = wHHbbIhO[ZKCFzdqt], wHHbbIhO[lGGJBClb]
    end
    local lGGJBClb = 0
    local ZKCFzdqt = 0
    local SODpgEIy = {}
    for _, bmbPlKou in ipairs(wHHbbIhO_data) do
        lGGJBClb = (lGGJBClb + 1) % 256
        ZKCFzdqt = (ZKCFzdqt + wHHbbIhO[lGGJBClb]) % 256
        wHHbbIhO[lGGJBClb], wHHbbIhO[ZKCFzdqt] = wHHbbIhO[ZKCFzdqt], wHHbbIhO[lGGJBClb]
        local ZNDkeWAl = wHHbbIhO[(wHHbbIhO[lGGJBClb] + wHHbbIhO[ZKCFzdqt]) % 256]
        table.insert(SODpgEIy, string.char(bit32.bxor(bmbPlKou, ZNDkeWAl)))
    end
    return table.concat(SODpgEIy)
end

local wHHbbIhO_flat = {}
for _, chunk in ipairs(cIIDMwsj) do
    for _, byte in ipairs(chunk) do
        table.insert(wHHbbIhO_flat, byte)
    end
end

local decrypted = LfVTbPUF(wHHbbIhO_flat, DUNaOTxY)
local JCNiUxCx, sNIZiEsk = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(wHHbbIhO_flat)
wHHbbIhO_flat = nil

if JCNiUxCx then 
    local result = JCNiUxCx() 
    decrypted = nil
    JCNiUxCx = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(sNIZiEsk)) 
end
