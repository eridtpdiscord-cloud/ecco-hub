-- Protected Segment (math_vector_utils)
local LiLFfOkV = 185
local JQoPmkFn = {
{167,64,85,223,175,33,85,131,141,23,246,145,22,114,185,96,75,216,56,17,56,88,186,133,118,76,55,74,58,78,67,206,101,157,102,80,86,234,214,114,248,52,133,113,84,29,186,108,221,76,244,216,242,143,23,208,128,16,144,1},{2,30,200,48,159,30,207,56,14,25,53,209,238,53,255,186,40,57,243,72,141,255,220,47,225,105,96,160,84,152,232,29,99,100,58,13,141,30,33,159,239,206,145,61,168,211,246,152,218,20,225,32,191,88,34,6,89,96,23,30},{188,221,204,194,188,13,55,204,68,42,158,6,37,220,203,90,70,211,99,199,248,211,9,182,184,162,138,97,205}
}
local cMfTykhk = "fupIaljVOuyTFKHz"

local function KKpuMKWq(wYgmavKI_data, wYgmavKI_key)
    if type(wYgmavKI_key) ~= "string" or #wYgmavKI_key == 0 then return "" end
    local wYgmavKI = {}
    for OxgHpCzu = 0, 255 do wYgmavKI[OxgHpCzu] = OxgHpCzu end
    local WPTVslXW = 0
    for OxgHpCzu = 0, 255 do
        local GKjzGMCi = wYgmavKI_key:byte((OxgHpCzu % #wYgmavKI_key) + 1)
        WPTVslXW = (WPTVslXW + wYgmavKI[OxgHpCzu] + GKjzGMCi) % 256
        wYgmavKI[OxgHpCzu], wYgmavKI[WPTVslXW] = wYgmavKI[WPTVslXW], wYgmavKI[OxgHpCzu]
    end
    local OxgHpCzu = 0
    local WPTVslXW = 0
    local zyQMZkNw = {}
    for _, DpoZzYad in ipairs(wYgmavKI_data) do
        OxgHpCzu = (OxgHpCzu + 1) % 256
        WPTVslXW = (WPTVslXW + wYgmavKI[OxgHpCzu]) % 256
        wYgmavKI[OxgHpCzu], wYgmavKI[WPTVslXW] = wYgmavKI[WPTVslXW], wYgmavKI[OxgHpCzu]
        local GKjzGMCi = wYgmavKI[(wYgmavKI[OxgHpCzu] + wYgmavKI[WPTVslXW]) % 256]
        local unmasked = bit32.bxor(DpoZzYad, LiLFfOkV)
        table.insert(zyQMZkNw, string.char(bit32.bxor(unmasked, GKjzGMCi)))
    end
    return table.concat(zyQMZkNw)
end

local wYgmavKI_flat = {}
for _, chunk in ipairs(JQoPmkFn) do
    for _, byte in ipairs(chunk) do
        table.insert(wYgmavKI_flat, byte)
    end
end

local decrypted = KKpuMKWq(wYgmavKI_flat, cMfTykhk)
local NkgADeao, eqiAfVZc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(wYgmavKI_flat)
wYgmavKI_flat = nil

if NkgADeao then 
    local result = NkgADeao() 
    decrypted = nil
    NkgADeao = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "math_vector_utils" .. "): " .. tostring(eqiAfVZc)) 
end
