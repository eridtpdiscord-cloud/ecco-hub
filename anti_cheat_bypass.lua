-- Protected Segment (anti_cheat_bypass)
local ZKmGbLmU = 36
local MDWyqAEl = {
{48,158,220,232,161,14,228,195,206,140,146,110,184,64,72,138,94,200,178,254,111,155,23,76,166,57,71,31,35,128,50,53,20,203,167,165,129,175,248,74,188,29,135,135,229,7,167,209,43,236,63,182,254,100,191,119,139,79,17,165},{78,217,202,10,26,234,168,241,46,93,111,76,148,132,130,243,89,176,167,225,168,4,178,131,17,97,243,215,121,47,40,148,32,4,194,33,136,127,82,41,195,35,48,192,119,140,205,54,126,149,230,6,203,25,0,55,238,6,242,144},{39,205,0,143,128,142,70,98,29,166,181,242,230,122,38,73,247,234,162,22,112,59,62,55,187,132,164,46,11}
}
local cfeVGNwb = "zOKDOldrVteZnBiY"

local function KHzwMdTM(GFthqLPG_data, GFthqLPG_key)
    if type(GFthqLPG_key) ~= "string" or #GFthqLPG_key == 0 then return "" end
    local GFthqLPG = {}
    for dODqebyA = 0, 255 do GFthqLPG[dODqebyA] = dODqebyA end
    local LWLfuhDY = 0
    for dODqebyA = 0, 255 do
        local MhLUjtyB = GFthqLPG_key:byte((dODqebyA % #GFthqLPG_key) + 1)
        LWLfuhDY = (LWLfuhDY + GFthqLPG[dODqebyA] + MhLUjtyB) % 256
        GFthqLPG[dODqebyA], GFthqLPG[LWLfuhDY] = GFthqLPG[LWLfuhDY], GFthqLPG[dODqebyA]
    end
    local dODqebyA = 0
    local LWLfuhDY = 0
    local hDKpFrjl = {}
    for _, SgBEOLQE in ipairs(GFthqLPG_data) do
        dODqebyA = (dODqebyA + 1) % 256
        LWLfuhDY = (LWLfuhDY + GFthqLPG[dODqebyA]) % 256
        GFthqLPG[dODqebyA], GFthqLPG[LWLfuhDY] = GFthqLPG[LWLfuhDY], GFthqLPG[dODqebyA]
        local MhLUjtyB = GFthqLPG[(GFthqLPG[dODqebyA] + GFthqLPG[LWLfuhDY]) % 256]
        local unmasked = bit32.bxor(SgBEOLQE, ZKmGbLmU)
        table.insert(hDKpFrjl, string.char(bit32.bxor(unmasked, MhLUjtyB)))
    end
    return table.concat(hDKpFrjl)
end

local GFthqLPG_flat = {}
for _, chunk in ipairs(MDWyqAEl) do
    for _, byte in ipairs(chunk) do
        table.insert(GFthqLPG_flat, byte)
    end
end

local decrypted = KHzwMdTM(GFthqLPG_flat, cfeVGNwb)
local GHvfgdLp, yZYvrglH = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(GFthqLPG_flat)
GFthqLPG_flat = nil

if GHvfgdLp then 
    local result = GHvfgdLp() 
    decrypted = nil
    GHvfgdLp = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(yZYvrglH)) 
end
