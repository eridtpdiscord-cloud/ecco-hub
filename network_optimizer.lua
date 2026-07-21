-- Compiled secure segment
local fvWqtPkw = {
{80,163,219,115,18,9,133,176,203,14,181,139,169,110,147,187,102,45,220,99,155,58,46,95,82,33,3,218,146,54,175,190,173,156,157,154,91,4,101,182,67,195,42,41,10,117,220,174,17,68,59,93,186,64,245,77,122,70,176,17},{237,136,144,3,6,135,65,49,90,194,204,128,51,85,245,108,87,172,39,71,168,33,175,23,96,28,0,124,131,108,16,250,152,124,102,108,218,45,218,67,146,62,200,171,162,26,50,93,214,208,124,92,189,212,64,135,252,212,74,176},{118,212,171,51,46,132,245,32,159,34,246,233,195,133,185,132,150,163,144,117,162,234,255,153,26,234,155,142,80}
}
local xTohKimK = "CXYuzzjHBdbCpyoh"

local function gRVAYQUG(vTDnUaDY_data, vTDnUaDY_key)
    local vTDnUaDY = {}
    for MObyLzvU = 0, 255 do vTDnUaDY[MObyLzvU] = MObyLzvU end
    local IxsIywqG = 0
    for MObyLzvU = 0, 255 do
        local pzcETojg = vTDnUaDY_key:byte((MObyLzvU % #vTDnUaDY_key) + 1)
        IxsIywqG = (IxsIywqG + vTDnUaDY[MObyLzvU] + pzcETojg) % 256
        vTDnUaDY[MObyLzvU], vTDnUaDY[IxsIywqG] = vTDnUaDY[IxsIywqG], vTDnUaDY[MObyLzvU]
    end
    local MObyLzvU = 0
    local IxsIywqG = 0
    local PBWPPYkg = {}
    for _, FLzHDOHJ in ipairs(vTDnUaDY_data) do
        MObyLzvU = (MObyLzvU + 1) % 256
        IxsIywqG = (IxsIywqG + vTDnUaDY[MObyLzvU]) % 256
        vTDnUaDY[MObyLzvU], vTDnUaDY[IxsIywqG] = vTDnUaDY[IxsIywqG], vTDnUaDY[MObyLzvU]
        local pzcETojg = vTDnUaDY[(vTDnUaDY[MObyLzvU] + vTDnUaDY[IxsIywqG]) % 256]
        table.insert(PBWPPYkg, string.char(bit32.bxor(FLzHDOHJ, pzcETojg)))
    end
    return table.concat(PBWPPYkg)
end

local vTDnUaDY_flat = {}
for _, chunk in ipairs(fvWqtPkw) do
    for _, byte in ipairs(chunk) do
        table.insert(vTDnUaDY_flat, byte)
    end
end

local decrypted = gRVAYQUG(vTDnUaDY_flat, xTohKimK)
local tPIsEyzX, ZWukMjSn = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(vTDnUaDY_flat)
vTDnUaDY_flat = nil

if tPIsEyzX then 
    local result = tPIsEyzX() 
    decrypted = nil
    tPIsEyzX = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(ZWukMjSn)) 
end
