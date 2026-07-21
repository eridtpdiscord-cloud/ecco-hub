-- Compiled secure segment
local DnIFdlKC = {
{59,9,223,117,202,250,247,66,59,124,247,255,251,150,52,216,169,184,163,4,37,83,126,129,118,117,244,125,74,0,43,178,155,196,184,191,169,50,196,188,78,215,12,156,31,158,210,80,100,61,5,58,102,64,144,204,154,92,47,117},{172,191,130,211,24,58,240,251,139,55,1,31,58,247,126,200,57,37,171,6,29,131,100,119,18,110,138,79,82,165,118,213,37,238,51,228,121,201,159,235,32,54,178,222,106,199,13,54,51,67,74,8,218,239,71,159,157,184,196,223},{211,237,243,25,89,40,85,183,12,255,133,176,0,163,14,57,13,67,243,230,56,104,217,25,48}
}
local CIkhZeUX = "ZeUDOGXaLSGIIEyB"

local function cceDOIHU(JFgPmlFP_data, JFgPmlFP_key)
    local JFgPmlFP = {}
    for lmkDIEkP = 0, 255 do JFgPmlFP[lmkDIEkP] = lmkDIEkP end
    local HNUQozoA = 0
    for lmkDIEkP = 0, 255 do
        local gUnuZKui = JFgPmlFP_key:byte((lmkDIEkP % #JFgPmlFP_key) + 1)
        HNUQozoA = (HNUQozoA + JFgPmlFP[lmkDIEkP] + gUnuZKui) % 256
        JFgPmlFP[lmkDIEkP], JFgPmlFP[HNUQozoA] = JFgPmlFP[HNUQozoA], JFgPmlFP[lmkDIEkP]
    end
    local lmkDIEkP = 0
    local HNUQozoA = 0
    local xqPusbSr = {}
    for _, TznzFDPr in ipairs(JFgPmlFP_data) do
        lmkDIEkP = (lmkDIEkP + 1) % 256
        HNUQozoA = (HNUQozoA + JFgPmlFP[lmkDIEkP]) % 256
        JFgPmlFP[lmkDIEkP], JFgPmlFP[HNUQozoA] = JFgPmlFP[HNUQozoA], JFgPmlFP[lmkDIEkP]
        local gUnuZKui = JFgPmlFP[(JFgPmlFP[lmkDIEkP] + JFgPmlFP[HNUQozoA]) % 256]
        table.insert(xqPusbSr, string.char(bit32.bxor(TznzFDPr, gUnuZKui)))
    end
    return table.concat(xqPusbSr)
end

local JFgPmlFP_flat = {}
for _, chunk in ipairs(DnIFdlKC) do
    for _, byte in ipairs(chunk) do
        table.insert(JFgPmlFP_flat, byte)
    end
end

local decrypted = cceDOIHU(JFgPmlFP_flat, CIkhZeUX)
local ApzluBVG, uZnfOsrd = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(JFgPmlFP_flat)
JFgPmlFP_flat = nil

if ApzluBVG then 
    local result = ApzluBVG() 
    decrypted = nil
    ApzluBVG = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "tween_library" .. "): " .. tostring(uZnfOsrd)) 
end
