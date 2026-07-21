-- Protected Segment (db)
local pPVxtvEM = 96
local emUulfCA = {
{52,74,116,99,52,101,121,221,146,16,59,33,16,127,79,96,138,172,165,221,213,68,57,128,108,171,161,110,113,20,2,59,140,31,88,76,224,158,84,117,243,116,3,22,93,250,96,39,129,63,138,205,203,41,67,0,236,60,131,240},{218,88,93,16,140,205,5,122,78,51,209,118,249,37,160,203,232,53,77,19,179,45,178,214,182,203,126,120,97,103,49,3,194,116,252,137,85,158,116,242,154,26,157,74,89,34,79,91,25,141,4,89,42,80,150,195,141,4,54,28},{178,214,172,198,233,1,115,127,65,138,185,141,80,141,132,0,20,40,169,218,139,161,85,57,136,138,126,238,107,27,16,182,104,123,254,53,87,32,17,22,64,223,61,85,119,68,142,39,8,174,62,12,234,23,149,86,105,66,80,241},{93,177,163,73,36,107,219,130,248,252,254,113,201,205,75,56,55,254,77,23,134,29,98,122,63,239,37,48,173,2,143,226,100,227,43,200,58,11,90,168,169,230,204,20,239,43,233,8,209,46,159,153,66,68,86,101,128,6,34,228},{104,70,147,207,246,135,146,201,232,225,189,35,86,217,131,176,83,233,59,122,109,69,145,164,114,91,131,236,32,58,67,187,127,197,145,29,121,164,155,215,49,37,190,139,69,97,110,121,225,219,222,124,20,120,13,246,211,222,38,33},{84,23,146,198,105,231,234,37,157,245,169,45,26,32,28,199,1,236,246,137,73,125,254,60,52,181,179,229,198,147,246,42,40,165,49,221,131,237,187,114,138,100,98,83,196,76,146,215,230,122,60,188,132,157,59,173,151,9,230,19},{240,254,234,240,213,238,17,43,30,162,133,140,21,59,137,103,30,123,87,139,79,199,216,39,222,26,229,129,5,68,116,64,167,116,71,210,143,226,183,220,143,88,211,219,18}
}
local DYHUHRxB = "eggFivuQNajdsjWf"

local function TuGzkiIr(SgtfufGk_data, SgtfufGk_key)
    local SgtfufGk = {}
    for UuGxTktJ = 0, 255 do SgtfufGk[UuGxTktJ] = UuGxTktJ end
    local skydyyeg = 0
    for UuGxTktJ = 0, 255 do
        local MkrJoSft = SgtfufGk_key:byte((UuGxTktJ % #SgtfufGk_key) + 1)
        skydyyeg = (skydyyeg + SgtfufGk[UuGxTktJ] + MkrJoSft) % 256
        SgtfufGk[UuGxTktJ], SgtfufGk[skydyyeg] = SgtfufGk[skydyyeg], SgtfufGk[UuGxTktJ]
    end
    local UuGxTktJ = 0
    local skydyyeg = 0
    local SlFBlZJg = {}
    for _, GecuEZgn in ipairs(SgtfufGk_data) do
        UuGxTktJ = (UuGxTktJ + 1) % 256
        skydyyeg = (skydyyeg + SgtfufGk[UuGxTktJ]) % 256
        SgtfufGk[UuGxTktJ], SgtfufGk[skydyyeg] = SgtfufGk[skydyyeg], SgtfufGk[UuGxTktJ]
        local MkrJoSft = SgtfufGk[(SgtfufGk[UuGxTktJ] + SgtfufGk[skydyyeg]) % 256]
        local unmasked = bit32.bxor(GecuEZgn, pPVxtvEM)
        table.insert(SlFBlZJg, string.char(bit32.bxor(unmasked, MkrJoSft)))
    end
    return table.concat(SlFBlZJg)
end

local SgtfufGk_flat = {}
for _, chunk in ipairs(emUulfCA) do
    for _, byte in ipairs(chunk) do
        table.insert(SgtfufGk_flat, byte)
    end
end

local decrypted = TuGzkiIr(SgtfufGk_flat, DYHUHRxB)
local PoHSAWqF, GkBxnFlN = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(SgtfufGk_flat)
SgtfufGk_flat = nil

if PoHSAWqF then 
    local result = PoHSAWqF() 
    decrypted = nil
    PoHSAWqF = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "db" .. "): " .. tostring(GkBxnFlN)) 
end
