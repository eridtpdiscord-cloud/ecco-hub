-- Protected Segment (db)
local eInKlOyY = 72
local VpgnRNgQ = {
{139,133,175,88,182,17,2,255,84,93,25,149,67,33,219,22,44,121,60,145,208,88,168,89,99,190,81,162,231,88,94,26,29,236,95,197,101,202,97,226,40,56,111,18,144,47,217,57,246,231,169,179,108,255,84,21,70,80,128,150},{80,180,255,137,196,71,176,40,198,32,156,104,64,57,202,199,219,173,239,150,38,169,6,102,189,120,160,99,104,192,88,237,146,3,30,181,72,174,181,199,41,132,198,116,45,99,135,50,100,188,157,163,182,8,25,46,11,71,103,65},{177,167,208,147,208,57,243,112,29,127,162,253,183,111,40,183,133,254,30,77,168,18,6,162,152,153,216,175,39,58,77,128,161,159,82,40,64,86,53,91,150,177,196,205,88,171,142,42,231,177,177,200,169,180,157,16,134,28,100,201},{42,172,229,132,154,164,196,168,131,211,53,142,7,58,205,38,85,180,168,32,216,184,126,42,27,61,106,144,155,115,255,14,158,142,185,225,217,121,185,249,180,228,142,225,12,89,83,247,105,9,96,183,191,23,205,228,149,69,200,40},{16,34,245,250,249,144,84,64,183,242,24,106,91,52,241,25,10,134,98,72,68,171,126,56,227,220,207,89,96,218,233,10,38,252,127,181,166,102,147,29,36,48,0,246,24,75,63,210,135,74,245,7,153,193,95,51,63,52,229,194},{78,168,227,11,250,188,135,12,32,219,217,34,106,82,229,147,184,80,119,217,149,50,39,192,182,2,98,244,111,8,52,206,52,234,168,14,121,242,249,232,123,171,90,13,131,54,180,66,2,107,158,101,29,6,145,62,54,120,147,115},{13,10,245,239,24,180,35,28,67,185,82,66,221,166,67,102,144,66,5,187,82,229,157,66,136,167,137,190,91,55,177,78,170,172,16,90,117,20,130,103,14,169,45,62,25,158,204,244,254,226,48,2,32,209,152,115,179,77,71,11},{81,225,57,67,199,1,29,159,71,60,192,154,117,250,44,81,102,47,177,89,59,49,65,213,83,4,193,182,216,158,112,19,33,72,254,216,34,88,37,250,3,14,103,80,60,61,191,228,144,42,94,75,171,46,236,99,90,80,139}
}
local ONFfajgJ = "HfVxqaOMpToAwBRH"

local function pxSYalCg(CapoMJia_data, CapoMJia_key)
    if type(CapoMJia_key) ~= "string" or #CapoMJia_key == 0 then return "" end
    local CapoMJia = {}
    for lDvDEIjf = 0, 255 do CapoMJia[lDvDEIjf] = lDvDEIjf end
    local epzMdvwM = 0
    for lDvDEIjf = 0, 255 do
        local ULbxkPDV = CapoMJia_key:byte((lDvDEIjf % #CapoMJia_key) + 1)
        epzMdvwM = (epzMdvwM + CapoMJia[lDvDEIjf] + ULbxkPDV) % 256
        CapoMJia[lDvDEIjf], CapoMJia[epzMdvwM] = CapoMJia[epzMdvwM], CapoMJia[lDvDEIjf]
    end
    local lDvDEIjf = 0
    local epzMdvwM = 0
    local VGHgQxxO = {}
    for _, pTwSwfDe in ipairs(CapoMJia_data) do
        lDvDEIjf = (lDvDEIjf + 1) % 256
        epzMdvwM = (epzMdvwM + CapoMJia[lDvDEIjf]) % 256
        CapoMJia[lDvDEIjf], CapoMJia[epzMdvwM] = CapoMJia[epzMdvwM], CapoMJia[lDvDEIjf]
        local ULbxkPDV = CapoMJia[(CapoMJia[lDvDEIjf] + CapoMJia[epzMdvwM]) % 256]
        local unmasked = bit32.bxor(pTwSwfDe, eInKlOyY)
        table.insert(VGHgQxxO, string.char(bit32.bxor(unmasked, ULbxkPDV)))
    end
    return table.concat(VGHgQxxO)
end

local CapoMJia_flat = {}
for _, chunk in ipairs(VpgnRNgQ) do
    for _, byte in ipairs(chunk) do
        table.insert(CapoMJia_flat, byte)
    end
end

local decrypted = pxSYalCg(CapoMJia_flat, ONFfajgJ)
local TVvetZNb, bqDxRflv = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(CapoMJia_flat)
CapoMJia_flat = nil

if TVvetZNb then 
    local result = TVvetZNb() 
    decrypted = nil
    TVvetZNb = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(bqDxRflv)) 
end
