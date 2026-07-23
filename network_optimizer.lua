-- Protected Segment (network_optimizer)
local oCLAMABM = 119
local ZULSvojR = {
{78,94,255,38,168,176,47,142,126,160,196,157,236,102,79,55,50,193,90,158,146,123,255,136,70,132,80,177,217,3,16,167,40,102,187,180,101,142,56,234,138,168,127,154,105,97,108,5,91,93,133,94,93,120,46,146,4,55,48,112},{125,255,236,243,138,185,216,5,124,90,139,165,80,77,23,148,83,84,170,212,86,123,229,101,3,88,7,226,44,85,147,64,138,3,132,120,254,60,9,164,217,175,119,172,103,244,201,32,180,225,32,110,50,1,203,92,155,188,24,27},{71,224,228,202,62,139,217,48,102,135,172,165,32,245,192,226,188,242,211,0,195,236,0,97,124,8,198,218,204}
}
local KwKhAXyT = "oWxnNwbZHncdKDtF"

local function aHCmainw(vQgiIPmb_data, vQgiIPmb_key)
    if type(vQgiIPmb_key) ~= "string" or #vQgiIPmb_key == 0 then return "" end
    local vQgiIPmb = {}
    for tbMqVmBy = 0, 255 do vQgiIPmb[tbMqVmBy] = tbMqVmBy end
    local wbeXBdCy = 0
    for tbMqVmBy = 0, 255 do
        local nfktZZCP = vQgiIPmb_key:byte((tbMqVmBy % #vQgiIPmb_key) + 1)
        wbeXBdCy = (wbeXBdCy + vQgiIPmb[tbMqVmBy] + nfktZZCP) % 256
        vQgiIPmb[tbMqVmBy], vQgiIPmb[wbeXBdCy] = vQgiIPmb[wbeXBdCy], vQgiIPmb[tbMqVmBy]
    end
    local tbMqVmBy = 0
    local wbeXBdCy = 0
    local MaoSLYjo = {}
    for _, mmZwPFlJ in ipairs(vQgiIPmb_data) do
        tbMqVmBy = (tbMqVmBy + 1) % 256
        wbeXBdCy = (wbeXBdCy + vQgiIPmb[tbMqVmBy]) % 256
        vQgiIPmb[tbMqVmBy], vQgiIPmb[wbeXBdCy] = vQgiIPmb[wbeXBdCy], vQgiIPmb[tbMqVmBy]
        local nfktZZCP = vQgiIPmb[(vQgiIPmb[tbMqVmBy] + vQgiIPmb[wbeXBdCy]) % 256]
        local unmasked = bit32.bxor(mmZwPFlJ, oCLAMABM)
        table.insert(MaoSLYjo, string.char(bit32.bxor(unmasked, nfktZZCP)))
    end
    return table.concat(MaoSLYjo)
end

local vQgiIPmb_flat = {}
for _, chunk in ipairs(ZULSvojR) do
    for _, byte in ipairs(chunk) do
        table.insert(vQgiIPmb_flat, byte)
    end
end

local decrypted = aHCmainw(vQgiIPmb_flat, KwKhAXyT)
local eXMXdOqR, ovoSerEr = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(vQgiIPmb_flat)
vQgiIPmb_flat = nil

if eXMXdOqR then 
    local result = eXMXdOqR() 
    decrypted = nil
    eXMXdOqR = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(ovoSerEr)) 
end
