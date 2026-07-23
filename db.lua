-- Protected Segment (db)
local dDaEmWMl = 118
local VlXSOvsc = {
{0,59,42,229,49,83,10,141,94,244,192,172,121,255,172,168,121,117,197,77,97,240,231,148,80,164,10,180,191,106,189,34,52,125,186,218,31,184,46,170,36,125,230,104,179,110,199,82,76,160,53,167,104,183,111,108,216,11,111,245},{252,13,112,197,192,95,135,7,219,53,213,91,54,123,210,58,131,233,236,197,20,79,236,41,231,65,67,246,254,92,114,195,175,230,202,222,25,253,118,33,139,163,56,3,196,228,39,142,131,255,157,145,75,129,223,126,223,136,136,221},{12,157,109,140,129,169,72,220,209,5,85,47,122,86,77,116,169,169,197,19,81,2,5,51,44,226,145,152,193,207,62,20,148,140,223,71,23,20,247,217,81,185,200,40,173,80,219,82,43,31,154,193,135,171,184,174,110,240,70,124},{78,105,3,236,78,30,131,239,211,219,84,219,26,247,5,51,53,99,21,213,118,254,82,178,48,135,213,156,98,217,51,105,54,89,14,181,248,219,48,90,230,38,207,50,121,121,31,224,98,243,63,255,49,72,130,105,108,166,163,200},{76,39,184,220,177,218,28,240,160,170,68,89,87,199,209,26,60,57,50,250,160,96,69,245,191,173,5,92,38,213,15,1,30,200,142,213,152,14,242,63,133,186,11,3,17,132,219,173,103,198,134,2,100,235,202,85,129,73,20,209},{221,72,92,171,77,125,59,36,105,216,46,42,100,53,98,204,190,203,7,32,138,233,75,59,145,94,129,242,136,214,2,160,155,74,57,205,143,11,176,202,170,232,25,25,220,135,96,167,78,119,74,221,54,195,75,227,94,75,209,229},{205,78,225,200,250,25,221,103,158,240,174,148,32,83,36,151,150,71,85,219,218,254,205,76,88,120,252,231,147,116,241,147,58,88,241,0,223,33,152,146,127,183,7,81,229,61,151,64,153,27,183,27,44,93,185,11,208,41,76,115},{133,13,42,103,207,159,36,192,196,54,213,145,196,166,85,198,159,174,218,163,161,68,113,210,42,134,52,1,57,81,2,68,141,74,209,149,48,221,199,46,86,23,250,43,199,93,239,98,38,171,154,97,134,132,46,97,163,20,163}
}
local wLtJzXnc = "lsfwisVSPzjNXOfu"

local function GHhDCYKG(JPmHkHVf_data, JPmHkHVf_key)
    if type(JPmHkHVf_key) ~= "string" or #JPmHkHVf_key == 0 then return "" end
    local JPmHkHVf = {}
    for bWByutLs = 0, 255 do JPmHkHVf[bWByutLs] = bWByutLs end
    local mlMLGdUO = 0
    for bWByutLs = 0, 255 do
        local DPyUMOmZ = JPmHkHVf_key:byte((bWByutLs % #JPmHkHVf_key) + 1)
        mlMLGdUO = (mlMLGdUO + JPmHkHVf[bWByutLs] + DPyUMOmZ) % 256
        JPmHkHVf[bWByutLs], JPmHkHVf[mlMLGdUO] = JPmHkHVf[mlMLGdUO], JPmHkHVf[bWByutLs]
    end
    local bWByutLs = 0
    local mlMLGdUO = 0
    local kuEJBwkv = {}
    for _, wguTcsCj in ipairs(JPmHkHVf_data) do
        bWByutLs = (bWByutLs + 1) % 256
        mlMLGdUO = (mlMLGdUO + JPmHkHVf[bWByutLs]) % 256
        JPmHkHVf[bWByutLs], JPmHkHVf[mlMLGdUO] = JPmHkHVf[mlMLGdUO], JPmHkHVf[bWByutLs]
        local DPyUMOmZ = JPmHkHVf[(JPmHkHVf[bWByutLs] + JPmHkHVf[mlMLGdUO]) % 256]
        local unmasked = bit32.bxor(wguTcsCj, dDaEmWMl)
        table.insert(kuEJBwkv, string.char(bit32.bxor(unmasked, DPyUMOmZ)))
    end
    return table.concat(kuEJBwkv)
end

local JPmHkHVf_flat = {}
for _, chunk in ipairs(VlXSOvsc) do
    for _, byte in ipairs(chunk) do
        table.insert(JPmHkHVf_flat, byte)
    end
end

local decrypted = GHhDCYKG(JPmHkHVf_flat, wLtJzXnc)
local rJXQbISi, DEzBtblZ = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JPmHkHVf_flat)
JPmHkHVf_flat = nil

if rJXQbISi then 
    local result = rJXQbISi() 
    decrypted = nil
    rJXQbISi = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(DEzBtblZ)) 
end
