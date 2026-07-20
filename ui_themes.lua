-- Compiled secure segment
local KTcMMwaC = {
{74,40,88,15,62,15,237,239,33,182,40,121,174,19,129,178,30,252,160,87,118,186,213,74,218,248,238,85,52,234,131,152,1,47,99,160,104,236,64,185,32,73,169,100,192,44,167,66,86,61,16,36,187,185,83,5,178,96,78,209},{182,229,84,1,73,35,204,73,86,85,87,171,117,36,95,222,100,151,236,39,205,238,198,225,24,17,220,98,36,180,0,202,83,158,165,65,38,218,168,72,6,216,53,176,78,95,20,187,106,25,187,105,68,231,161,230,238,249,6,209},{68,24,90,131,38,217,68,13,200,237,191,60,2,159,105,108,177,184,48,52,59}
}
local mynwJKdk = "yMGeCAPrGrEUaoSE"

local function bwtdsyVO(IprtAuGD_data, IprtAuGD_key)
    local IprtAuGD = {}
    for SADlvVAu = 0, 255 do IprtAuGD[SADlvVAu] = SADlvVAu end
    local cyymCoId = 0
    for SADlvVAu = 0, 255 do
        local VEgmYuDI = IprtAuGD_key:byte((SADlvVAu % #IprtAuGD_key) + 1)
        cyymCoId = (cyymCoId + IprtAuGD[SADlvVAu] + VEgmYuDI) % 256
        IprtAuGD[SADlvVAu], IprtAuGD[cyymCoId] = IprtAuGD[cyymCoId], IprtAuGD[SADlvVAu]
    end
    local SADlvVAu = 0
    local cyymCoId = 0
    local CQmtkvpI = {}
    for _, CEtZpYoC in ipairs(IprtAuGD_data) do
        SADlvVAu = (SADlvVAu + 1) % 256
        cyymCoId = (cyymCoId + IprtAuGD[SADlvVAu]) % 256
        IprtAuGD[SADlvVAu], IprtAuGD[cyymCoId] = IprtAuGD[cyymCoId], IprtAuGD[SADlvVAu]
        local VEgmYuDI = IprtAuGD[(IprtAuGD[SADlvVAu] + IprtAuGD[cyymCoId]) % 256]
        table.insert(CQmtkvpI, string.char(bit32.bxor(CEtZpYoC, VEgmYuDI)))
    end
    return table.concat(CQmtkvpI)
end

local IprtAuGD_flat = {}
for _, chunk in ipairs(KTcMMwaC) do
    for _, byte in ipairs(chunk) do
        table.insert(IprtAuGD_flat, byte)
    end
end

local decrypted = bwtdsyVO(IprtAuGD_flat, mynwJKdk)
local FiVccNia, vRxhzuBv = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(IprtAuGD_flat)
IprtAuGD_flat = nil

if FiVccNia then 
    local result = FiVccNia() 
    decrypted = nil
    FiVccNia = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(vRxhzuBv)) 
end
