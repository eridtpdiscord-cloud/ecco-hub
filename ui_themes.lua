-- Protected Segment (ui_themes)
local aHJUaGsc = 169
local OmnRiPQb = {
{77,143,161,213,91,224,201,172,198,76,114,231,26,27,5,160,187,178,44,107,33,228,117,205,242,15,41,141,67,207,17,17,126,55,96,173,255,250,188,42,96,107,108,103,165,186,242,44,251,178,108,148,20,233,86,94,140,50,59,147},{0,112,158,53,119,18,7,67,9,60,168,211,166,32,245,134,214,39,175,66,47,138,55,14,175,81,125,25,26,77,182,252,187,208,220,36,104,232,113,164,177,45,93,31,56,49,46,140,75,128,55,124,60,84,134,154,167,122,194,171},{63,151,148,70,243,205,62,5,81,119,110,94,115,168,85,191,203,140,151,239,165}
}
local vArdCfpM = "qOpjvofZYKfnqNEV"

local function fCfpZKER(GRvszKmN_data, GRvszKmN_key)
    if type(GRvszKmN_key) ~= "string" or #GRvszKmN_key == 0 then return "" end
    local GRvszKmN = {}
    for ZQbSscyg = 0, 255 do GRvszKmN[ZQbSscyg] = ZQbSscyg end
    local WLMbydsQ = 0
    for ZQbSscyg = 0, 255 do
        local LLvYkgzF = GRvszKmN_key:byte((ZQbSscyg % #GRvszKmN_key) + 1)
        WLMbydsQ = (WLMbydsQ + GRvszKmN[ZQbSscyg] + LLvYkgzF) % 256
        GRvszKmN[ZQbSscyg], GRvszKmN[WLMbydsQ] = GRvszKmN[WLMbydsQ], GRvszKmN[ZQbSscyg]
    end
    local ZQbSscyg = 0
    local WLMbydsQ = 0
    local FHqFDOuy = {}
    for _, nAjIEgEV in ipairs(GRvszKmN_data) do
        ZQbSscyg = (ZQbSscyg + 1) % 256
        WLMbydsQ = (WLMbydsQ + GRvszKmN[ZQbSscyg]) % 256
        GRvszKmN[ZQbSscyg], GRvszKmN[WLMbydsQ] = GRvszKmN[WLMbydsQ], GRvszKmN[ZQbSscyg]
        local LLvYkgzF = GRvszKmN[(GRvszKmN[ZQbSscyg] + GRvszKmN[WLMbydsQ]) % 256]
        local unmasked = bit32.bxor(nAjIEgEV, aHJUaGsc)
        table.insert(FHqFDOuy, string.char(bit32.bxor(unmasked, LLvYkgzF)))
    end
    return table.concat(FHqFDOuy)
end

local GRvszKmN_flat = {}
for _, chunk in ipairs(OmnRiPQb) do
    for _, byte in ipairs(chunk) do
        table.insert(GRvszKmN_flat, byte)
    end
end

local decrypted = fCfpZKER(GRvszKmN_flat, vArdCfpM)
local hlFkvMxK, NJWoEeNc = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GRvszKmN_flat)
GRvszKmN_flat = nil

if hlFkvMxK then 
    local result = hlFkvMxK() 
    decrypted = nil
    hlFkvMxK = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(NJWoEeNc)) 
end
