-- Compiled secure segment
local sOkDweQy = {
{38,236,159,167,58,230,111,157,197,23,93,161,65,247,65,56,112,213,125,142,160,26,171,240,205,191,34,151,138,68,37,95,140,193,254,30,174,247,166,12,224,96,144,54,222,123,247,177,90,128,123,144,243,27,178,77,120,5,166,151},{189,0,161,5,34,166,130,5,89,145,231,192,50,233,225,198,44,175,199,250,231,207,99,89,26,176,187,3,147,186,18,67,17,132,145,145,62,214,22,28,189,97,233,128,86,2,140,37,232,143,131,63,248,142,100,77,248,254,79,229},{92,73,119,158,39,234,157,45,75,106,19,57,58,207,232,4,155,70,181,154,104,183,221,162,4,116,65,101,223,40,148,27,79,127,170,86,2,89,27,165,6,157,8,219,181,134,16,23,229,86,91,157,19,12,15,118,231,102,109,184},{237,202,163,167,103,85,201,167,189,17,225,27,64,148,216,63,43,194,212,81,188,116,29,60,228,105,55,109,253,83,163,60,92,172,122,93,219,157,4,41,206,159,251,176,84,122,0,225,108,95,215,115,128,24,164,219,146,128,33,114},{240,178,117,10,65,87,85,68,195,155,191,159,117,206,126,197,183,243,76,191,181,45,217,242,226,13,146,253,129,43,216,160,198,127,184,116,97,172,113,197,243,155,42,228,244,163,81,201,233,225,3,208,19,14,113,101,42,143,150,13},{74,174,147,244,208,115,132,154,117,14,7,15,212,157,3,6,209,176,245,195,60,62,209,180,6,166,56,179,190,13,48,149,88,183,245,47,204,116,30,215,118,83,42,143,210,57,56,79,208,219,51,108,65,27,150,2,103,78,180,127},{158,158,157,71,135,243,5,132,7,249,252,205,138,187,229,160,223,255,149,222,204,56,185,60,162,44,172,204,245,22,47,169,161,61,243,249,121,138,37,119,93,1,191,224,27,64,108,43,72,110,83,34,80,117,91,132,180,255,78,250},{184,239,247,96,1,215,199,251,161,20,156,32,250,186,109,233,238,212,53,84,235,237,244,57,182}
}
local fyHoGUMC = "LtGERROqbpotuIFj"

local function GziaIulc(VDBFhMLE_data, VDBFhMLE_key)
    local VDBFhMLE = {}
    for nxCiEjkj = 0, 255 do VDBFhMLE[nxCiEjkj] = nxCiEjkj end
    local kBGdkCiH = 0
    for nxCiEjkj = 0, 255 do
        local nBZafiyJ = VDBFhMLE_key:byte((nxCiEjkj % #VDBFhMLE_key) + 1)
        kBGdkCiH = (kBGdkCiH + VDBFhMLE[nxCiEjkj] + nBZafiyJ) % 256
        VDBFhMLE[nxCiEjkj], VDBFhMLE[kBGdkCiH] = VDBFhMLE[kBGdkCiH], VDBFhMLE[nxCiEjkj]
    end
    local nxCiEjkj = 0
    local kBGdkCiH = 0
    local QMWdrnzh = {}
    for _, WajyxarW in ipairs(VDBFhMLE_data) do
        nxCiEjkj = (nxCiEjkj + 1) % 256
        kBGdkCiH = (kBGdkCiH + VDBFhMLE[nxCiEjkj]) % 256
        VDBFhMLE[nxCiEjkj], VDBFhMLE[kBGdkCiH] = VDBFhMLE[kBGdkCiH], VDBFhMLE[nxCiEjkj]
        local nBZafiyJ = VDBFhMLE[(VDBFhMLE[nxCiEjkj] + VDBFhMLE[kBGdkCiH]) % 256]
        table.insert(QMWdrnzh, string.char(bit32.bxor(WajyxarW, nBZafiyJ)))
    end
    return table.concat(QMWdrnzh)
end

local VDBFhMLE_flat = {}
for _, chunk in ipairs(sOkDweQy) do
    for _, byte in ipairs(chunk) do
        table.insert(VDBFhMLE_flat, byte)
    end
end

local decrypted = GziaIulc(VDBFhMLE_flat, fyHoGUMC)
local TzZiJZGo, KMPLapqd = loadstring(decrypted)
if TzZiJZGo then 
    return TzZiJZGo() 
else 
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(KMPLapqd)) 
end
