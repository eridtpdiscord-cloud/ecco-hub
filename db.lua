-- Protected Segment (db)
local bzkatOkd = 87
local dttjrIhC = {
{98,70,63,68,252,147,106,252,174,195,111,144,47,114,43,123,135,37,44,103,170,208,137,50,228,90,45,31,134,236,167,253,72,16,215,72,215,182,48,20,47,153,86,195,60,5,37,180,111,116,55,141,147,166,36,161,6,22,254,149},{158,247,227,130,206,138,72,124,131,50,254,241,121,214,88,13,42,43,123,5,5,236,36,196,102,249,3,199,183,210,152,186,38,210,174,232,41,121,190,119,17,218,157,49,222,18,77,78,159,73,106,249,241,110,119,27,27,62,60,201},{250,30,160,131,139,171,93,169,65,171,42,111,94,188,182,10,241,170,228,40,2,224,121,200,21,187,63,77,207,202,89,255,71,232,230,2,224,190,227,8,244,161,5,211,238,13,21,109,13,26,158,80,250,221,38,84,26,171,255,215},{50,190,217,151,78,241,55,225,88,140,140,66,95,99,144,231,134,125,171,2,66,77,99,102,47,179,206,143,241,71,49,149,241,55,21,69,198,216,192,82,114,58,175,67,147,82,223,37,15,223,187,226,195,145,59,196,0,123,33,76},{169,204,163,18,18,4,129,15,61,72,253,151,157,155,232,85,60,16,147,180,63,82,18,55,171,194,52,223,160,229,211,180,170,102,76,210,219,10,246,121,16,148,112,15,146,71,190,75,119,75,194,230,138,161,218,167,217,174,191,111},{251,182,163,147,222,205,212,31,252,138,173,123,66,24,186,76,233,187,22,106,23,100,90,164,182,0,50,110,71,153,13,83,137,117,177,78,196,199,58,2,90,209,178,220,25,193,65,186,30,103,155,71,215,213,109,164,17,101,169,206},{92,198,77,122,92,57,193,233,28,241,104,148,84,209,71,75,110,187,200,141,70,187,24,41,168,0,183,88,52,186,50,187,167,122,102,44,109,68,99,5,188,22,253,164,120}
}
local hMxXRFCe = "TwUnuYhoMornNaTH"

local function eKYKCjke(BIIZgrnd_data, BIIZgrnd_key)
    local BIIZgrnd = {}
    for gEoRwGpt = 0, 255 do BIIZgrnd[gEoRwGpt] = gEoRwGpt end
    local JopPDHaP = 0
    for gEoRwGpt = 0, 255 do
        local JlGUPyOr = BIIZgrnd_key:byte((gEoRwGpt % #BIIZgrnd_key) + 1)
        JopPDHaP = (JopPDHaP + BIIZgrnd[gEoRwGpt] + JlGUPyOr) % 256
        BIIZgrnd[gEoRwGpt], BIIZgrnd[JopPDHaP] = BIIZgrnd[JopPDHaP], BIIZgrnd[gEoRwGpt]
    end
    local gEoRwGpt = 0
    local JopPDHaP = 0
    local LMZshpWN = {}
    for _, kdjoOoRs in ipairs(BIIZgrnd_data) do
        gEoRwGpt = (gEoRwGpt + 1) % 256
        JopPDHaP = (JopPDHaP + BIIZgrnd[gEoRwGpt]) % 256
        BIIZgrnd[gEoRwGpt], BIIZgrnd[JopPDHaP] = BIIZgrnd[JopPDHaP], BIIZgrnd[gEoRwGpt]
        local JlGUPyOr = BIIZgrnd[(BIIZgrnd[gEoRwGpt] + BIIZgrnd[JopPDHaP]) % 256]
        local unmasked = bit32.bxor(kdjoOoRs, bzkatOkd)
        table.insert(LMZshpWN, string.char(bit32.bxor(unmasked, JlGUPyOr)))
    end
    return table.concat(LMZshpWN)
end

local BIIZgrnd_flat = {}
for _, chunk in ipairs(dttjrIhC) do
    for _, byte in ipairs(chunk) do
        table.insert(BIIZgrnd_flat, byte)
    end
end

local decrypted = eKYKCjke(BIIZgrnd_flat, hMxXRFCe)
local awWskZpH, rWoWnoSx = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BIIZgrnd_flat)
BIIZgrnd_flat = nil

if awWskZpH then 
    local result = awWskZpH() 
    decrypted = nil
    awWskZpH = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(rWoWnoSx)) 
end
