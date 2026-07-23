-- Protected Segment (db)
local mubJBvLZ = 238
local FbiiYeOW = {
{32,244,3,82,76,226,228,108,195,140,61,120,71,115,94,192,80,166,230,207,37,1,254,202,36,120,172,39,28,121,173,190,27,45,82,89,149,89,155,138,168,161,46,121,236,187,36,31,58,211,217,106,199,243,42,90,158,122,177,219},{194,68,119,126,250,23,160,228,106,47,131,235,216,254,193,33,176,20,79,97,137,110,3,222,229,44,169,176,183,18,137,3,188,218,203,139,167,101,80,194,139,190,82,130,38,210,69,8,152,130,110,140,54,5,133,32,95,160,187,37},{20,122,150,44,102,212,3,253,154,62,180,170,25,39,70,73,130,241,62,23,46,29,14,141,110,115,190,234,118,91,70,24,57,206,207,244,207,17,96,81,158,173,47,85,111,204,89,10,121,43,100,175,126,60,176,18,48,250,245,161},{90,151,73,210,44,225,249,16,197,131,238,111,65,153,86,96,196,171,208,193,65,136,112,229,249,220,84,135,55,32,233,4,14,58,181,6,18,175,129,63,109,196,210,56,106,49,190,41,173,133,82,12,214,245,205,192,198,176,76,46},{64,27,45,247,131,81,62,190,139,131,88,243,78,59,42,60,239,29,41,22,95,44,139,187,193,94,5,239,219,222,78,72,139,55,149,213,42,36,150,51,241,132,15,79,243,180,201,241,157,152,194,114,158,122,107,97,197,147,100,207},{62,189,48,17,109,224,172,51,240,114,100,248,124,75,81,137,249,103,212,252,107,39,102,58,78,153,117,196,38,20,25,132,164,211,132,247,219,9,15,138,237,255,221,137,198,208,66,98,179,213,83,60,197,94,131,245,88,206,161,235},{148,218,81,170,43,192,95,201,177,234,109,30,130,90,51,179,41,146,166,82,215,88,56,117,124,44,136,73,18,1,231,12,248,44,156,84,19,194,249,173,237,178,210,84,104,137,67,248,20,199,31,58,190,68,77,156,251,211,145,242},{9,217,95,225,48,138,219,206,103,255,102,67,37,32,14,75,41,201,13,112,110,135,155,217,160,153,144,113,4,17,3,225,188,82,119,142,171,47,36,170,0,68,85,223,154,6,76,172,175,19,198,206,127,47,216,121,217,247,48}
}
local gLooKUFm = "VHYiItUOqelhmCLM"

local function JUYRWEKU(bjRzJOLI_data, bjRzJOLI_key)
    if type(bjRzJOLI_key) ~= "string" or #bjRzJOLI_key == 0 then return "" end
    local bjRzJOLI = {}
    for vdsPXQTj = 0, 255 do bjRzJOLI[vdsPXQTj] = vdsPXQTj end
    local OGYCnhkj = 0
    for vdsPXQTj = 0, 255 do
        local DFVeIMAu = bjRzJOLI_key:byte((vdsPXQTj % #bjRzJOLI_key) + 1)
        OGYCnhkj = (OGYCnhkj + bjRzJOLI[vdsPXQTj] + DFVeIMAu) % 256
        bjRzJOLI[vdsPXQTj], bjRzJOLI[OGYCnhkj] = bjRzJOLI[OGYCnhkj], bjRzJOLI[vdsPXQTj]
    end
    local vdsPXQTj = 0
    local OGYCnhkj = 0
    local GEjNjSJr = {}
    for _, fOnGrCBz in ipairs(bjRzJOLI_data) do
        vdsPXQTj = (vdsPXQTj + 1) % 256
        OGYCnhkj = (OGYCnhkj + bjRzJOLI[vdsPXQTj]) % 256
        bjRzJOLI[vdsPXQTj], bjRzJOLI[OGYCnhkj] = bjRzJOLI[OGYCnhkj], bjRzJOLI[vdsPXQTj]
        local DFVeIMAu = bjRzJOLI[(bjRzJOLI[vdsPXQTj] + bjRzJOLI[OGYCnhkj]) % 256]
        local unmasked = bit32.bxor(fOnGrCBz, mubJBvLZ)
        table.insert(GEjNjSJr, string.char(bit32.bxor(unmasked, DFVeIMAu)))
    end
    return table.concat(GEjNjSJr)
end

local bjRzJOLI_flat = {}
for _, chunk in ipairs(FbiiYeOW) do
    for _, byte in ipairs(chunk) do
        table.insert(bjRzJOLI_flat, byte)
    end
end

local decrypted = JUYRWEKU(bjRzJOLI_flat, gLooKUFm)
local ZyGJWVes, GatoStHs = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(bjRzJOLI_flat)
bjRzJOLI_flat = nil

if ZyGJWVes then 
    local result = ZyGJWVes() 
    decrypted = nil
    ZyGJWVes = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(GatoStHs)) 
end
