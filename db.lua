-- Protected Segment (db)
local fDAiaYUp = 244
local ApDnJZkm = {
{171,247,182,196,203,92,62,118,187,228,86,159,69,202,108,239,182,113,59,248,95,212,70,108,14,121,149,234,62,242,208,88,247,42,90,51,120,198,118,72,174,35,252,17,90,31,161,73,81,212,161,68,104,24,32,215,108,194,126,165},{210,122,43,17,131,113,212,207,245,50,192,189,56,3,165,247,184,40,46,23,36,157,179,247,201,244,215,206,102,247,30,26,99,49,41,45,115,211,49,220,201,230,56,197,217,50,3,158,1,245,7,87,246,179,147,227,136,36,239,248},{130,108,128,43,226,234,13,248,77,180,239,65,236,188,52,39,36,26,230,76,19,223,99,127,41,116,23,179,178,15,143,129,150,246,166,175,35,237,191,123,225,174,246,114,214,127,38,215,10,71,4,100,169,38,143,207,39,61,3,226},{158,50,113,99,113,188,230,194,187,8,106,223,5,175,202,27,87,74,73,238,41,204,232,158,19,229,120,222,246,202,108,178,75,33,19,236,32,175,106,98,246,230,56,138,206,20,41,178,217,241,179,152,85,47,14,124,54,232,9,135},{92,107,52,1,152,129,0,118,134,118,245,248,205,245,37,16,36,219,210,49,115,91,194,115,164,70,30,183,135,254,64,9,148,227,143,183,80,233,182,56,50,190,150,37,68,211,93,38,200,64,16,106,174,22,78,26,222,35,228,29},{244,118,58,83,81,167,219,178,112,113,25,128,241,136,153,9,248,197,51,96,133,75,196,15,59,54,113,133,177,66,135,91,254,26,161,184,215,11,52,134,84,168,80,181,227,38,176,12,167,77,121,5,201,76,243,129,99,177,30,218},{173,152,35,115,211,62,232,253,173,168,28,140,50,136,37,229,6,246,181,92,62,64,30,168,209,207,123,144,106,160,119,249,77,50,126,234,38,70,122,231,57,232,151,73}
}
local vVCIUwmI = "ACJViUDsUTiQGPvQ"

local function LdxcPxaY(EKZFcZxc_data, EKZFcZxc_key)
    local EKZFcZxc = {}
    for nyPLknSc = 0, 255 do EKZFcZxc[nyPLknSc] = nyPLknSc end
    local myDYfmXJ = 0
    for nyPLknSc = 0, 255 do
        local LqKBBwTf = EKZFcZxc_key:byte((nyPLknSc % #EKZFcZxc_key) + 1)
        myDYfmXJ = (myDYfmXJ + EKZFcZxc[nyPLknSc] + LqKBBwTf) % 256
        EKZFcZxc[nyPLknSc], EKZFcZxc[myDYfmXJ] = EKZFcZxc[myDYfmXJ], EKZFcZxc[nyPLknSc]
    end
    local nyPLknSc = 0
    local myDYfmXJ = 0
    local lZkahrcj = {}
    for _, uARdBytd in ipairs(EKZFcZxc_data) do
        nyPLknSc = (nyPLknSc + 1) % 256
        myDYfmXJ = (myDYfmXJ + EKZFcZxc[nyPLknSc]) % 256
        EKZFcZxc[nyPLknSc], EKZFcZxc[myDYfmXJ] = EKZFcZxc[myDYfmXJ], EKZFcZxc[nyPLknSc]
        local LqKBBwTf = EKZFcZxc[(EKZFcZxc[nyPLknSc] + EKZFcZxc[myDYfmXJ]) % 256]
        local unmasked = bit32.bxor(uARdBytd, fDAiaYUp)
        table.insert(lZkahrcj, string.char(bit32.bxor(unmasked, LqKBBwTf)))
    end
    return table.concat(lZkahrcj)
end

local EKZFcZxc_flat = {}
for _, chunk in ipairs(ApDnJZkm) do
    for _, byte in ipairs(chunk) do
        table.insert(EKZFcZxc_flat, byte)
    end
end

local decrypted = LdxcPxaY(EKZFcZxc_flat, vVCIUwmI)
local DvIlIcay, upzcKmYC = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(EKZFcZxc_flat)
EKZFcZxc_flat = nil

if DvIlIcay then 
    local result = DvIlIcay() 
    decrypted = nil
    DvIlIcay = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(upzcKmYC)) 
end
