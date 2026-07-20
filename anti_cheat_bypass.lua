-- Compiled secure segment
local nhYZCWNv = {
{54,4,228,53,223,239,202,66,203,204,179,201,235,87,38,208,128,26,37,222,13,62,173,9,91,163,80,148,223,227,154,228,46,40,165,247,161,94,211,127,26,5,144,201,160,242,92,219,43,141,18,173,98,105,135,80,209,201,198,129},{10,177,13,222,252,32,54,25,205,1,163,57,155,130,165,90,60,47,80,55,245,66,76,39,108,98,246,49,103,104,227,232,4,232,67,6,102,155,63,50,30,116,163,167,62,24,155,203,144,254,14,75,52,51,95,219,126,72,138,123},{105,12,21,123,118,151,233,176,196,200,12,75,38,172,124,110,231,160,174,160,81,71,59,198,128,239,133,240,23}
}
local WxWrxKLs = "nUdYRKaiacXobouv"

local function nlGcwtaA(swaBLDnU_data, swaBLDnU_key)
    local swaBLDnU = {}
    for MgATTOjg = 0, 255 do swaBLDnU[MgATTOjg] = MgATTOjg end
    local aXMbNNpb = 0
    for MgATTOjg = 0, 255 do
        local IPIhlfII = swaBLDnU_key:byte((MgATTOjg % #swaBLDnU_key) + 1)
        aXMbNNpb = (aXMbNNpb + swaBLDnU[MgATTOjg] + IPIhlfII) % 256
        swaBLDnU[MgATTOjg], swaBLDnU[aXMbNNpb] = swaBLDnU[aXMbNNpb], swaBLDnU[MgATTOjg]
    end
    local MgATTOjg = 0
    local aXMbNNpb = 0
    local mTFMcjdl = {}
    for _, KlTGymEh in ipairs(swaBLDnU_data) do
        MgATTOjg = (MgATTOjg + 1) % 256
        aXMbNNpb = (aXMbNNpb + swaBLDnU[MgATTOjg]) % 256
        swaBLDnU[MgATTOjg], swaBLDnU[aXMbNNpb] = swaBLDnU[aXMbNNpb], swaBLDnU[MgATTOjg]
        local IPIhlfII = swaBLDnU[(swaBLDnU[MgATTOjg] + swaBLDnU[aXMbNNpb]) % 256]
        table.insert(mTFMcjdl, string.char(bit32.bxor(KlTGymEh, IPIhlfII)))
    end
    return table.concat(mTFMcjdl)
end

local swaBLDnU_flat = {}
for _, chunk in ipairs(nhYZCWNv) do
    for _, byte in ipairs(chunk) do
        table.insert(swaBLDnU_flat, byte)
    end
end

local decrypted = nlGcwtaA(swaBLDnU_flat, WxWrxKLs)
local azbiXUGt, KahiCXxO = loadstring(decrypted)

-- Memory Sanitation: Overwrite decrypted variables to block RAM scan extraction
table.clear(swaBLDnU_flat)
swaBLDnU_flat = nil

if azbiXUGt then 
    local result = azbiXUGt() 
    decrypted = nil
    azbiXUGt = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "anti_cheat_bypass" .. "): " .. tostring(KahiCXxO)) 
end
