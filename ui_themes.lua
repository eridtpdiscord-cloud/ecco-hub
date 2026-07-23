-- Protected Segment (ui_themes)
local nUkDxOQr = 103
local VAaEpeAu = {
{126,96,214,107,241,144,250,34,146,132,234,3,164,202,155,228,11,173,37,109,165,70,31,212,223,80,183,139,75,49,10,47,129,212,15,71,126,108,59,136,216,66,7,158,167,19,27,48,87,76,228,168,202,223,204,2,177,147,214,61},{179,109,66,78,70,170,93,243,249,55,113,243,101,192,136,203,192,250,122,60,229,185,9,125,238,200,252,56,245,22,103,189,17,210,90,12,237,252,177,74,49,159,221,159,178,19,169,174,195,128,234,110,133,174,198,122,135,11,242,20},{202,240,53,87,58,125,81,167,109,27,111,19,137,245,51,253,214,157,28,81,154}
}
local klKbantD = "mwTqXPWwuGzfhbFf"

local function TAufVBJy(igvZdkIH_data, igvZdkIH_key)
    if type(igvZdkIH_key) ~= "string" or #igvZdkIH_key == 0 then return "" end
    local igvZdkIH = {}
    for HmlDlYaJ = 0, 255 do igvZdkIH[HmlDlYaJ] = HmlDlYaJ end
    local dXvMdkdT = 0
    for HmlDlYaJ = 0, 255 do
        local XvGvxtOd = igvZdkIH_key:byte((HmlDlYaJ % #igvZdkIH_key) + 1)
        dXvMdkdT = (dXvMdkdT + igvZdkIH[HmlDlYaJ] + XvGvxtOd) % 256
        igvZdkIH[HmlDlYaJ], igvZdkIH[dXvMdkdT] = igvZdkIH[dXvMdkdT], igvZdkIH[HmlDlYaJ]
    end
    local HmlDlYaJ = 0
    local dXvMdkdT = 0
    local FFajdAvK = {}
    for _, NpiCIrjq in ipairs(igvZdkIH_data) do
        HmlDlYaJ = (HmlDlYaJ + 1) % 256
        dXvMdkdT = (dXvMdkdT + igvZdkIH[HmlDlYaJ]) % 256
        igvZdkIH[HmlDlYaJ], igvZdkIH[dXvMdkdT] = igvZdkIH[dXvMdkdT], igvZdkIH[HmlDlYaJ]
        local XvGvxtOd = igvZdkIH[(igvZdkIH[HmlDlYaJ] + igvZdkIH[dXvMdkdT]) % 256]
        local unmasked = bit32.bxor(NpiCIrjq, nUkDxOQr)
        table.insert(FFajdAvK, string.char(bit32.bxor(unmasked, XvGvxtOd)))
    end
    return table.concat(FFajdAvK)
end

local igvZdkIH_flat = {}
for _, chunk in ipairs(VAaEpeAu) do
    for _, byte in ipairs(chunk) do
        table.insert(igvZdkIH_flat, byte)
    end
end

local decrypted = TAufVBJy(igvZdkIH_flat, klKbantD)
local HoVNPJoq, jCPCOwni = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(igvZdkIH_flat)
igvZdkIH_flat = nil

if HoVNPJoq then 
    local result = HoVNPJoq() 
    decrypted = nil
    HoVNPJoq = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(jCPCOwni)) 
end
