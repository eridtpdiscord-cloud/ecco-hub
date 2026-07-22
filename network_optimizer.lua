-- Protected Segment (network_optimizer)
local UgzbXxNs = 220
local JyFXGRba = {
{87,24,179,143,31,209,225,151,217,52,130,132,223,186,18,46,88,41,41,58,148,194,152,17,147,136,216,41,121,57,249,55,3,147,206,174,188,142,11,16,151,108,117,128,160,56,83,150,5,212,43,181,87,225,242,101,175,131,173,23},{211,167,159,67,214,22,187,250,167,209,240,7,155,186,189,226,218,199,16,171,92,21,19,24,23,254,58,115,161,124,91,250,179,126,180,255,88,94,53,200,242,82,126,27,3,7,222,235,87,148,17,128,54,195,55,252,201,202,45,12},{73,23,174,212,86,64,143,34,3,64,254,149,20,153,255,235,67,64,201,0,167,149,203,20,216,76,102,191,153}
}
local EuhXOIqY = "BHhduzaZWcVHqdTq"

local function MbeGMXsR(BThMNdlB_data, BThMNdlB_key)
    local BThMNdlB = {}
    for UTFIIbKR = 0, 255 do BThMNdlB[UTFIIbKR] = UTFIIbKR end
    local IwPrrUXI = 0
    for UTFIIbKR = 0, 255 do
        local IiYMXZAF = BThMNdlB_key:byte((UTFIIbKR % #BThMNdlB_key) + 1)
        IwPrrUXI = (IwPrrUXI + BThMNdlB[UTFIIbKR] + IiYMXZAF) % 256
        BThMNdlB[UTFIIbKR], BThMNdlB[IwPrrUXI] = BThMNdlB[IwPrrUXI], BThMNdlB[UTFIIbKR]
    end
    local UTFIIbKR = 0
    local IwPrrUXI = 0
    local VzsizTRy = {}
    for _, kswreAja in ipairs(BThMNdlB_data) do
        UTFIIbKR = (UTFIIbKR + 1) % 256
        IwPrrUXI = (IwPrrUXI + BThMNdlB[UTFIIbKR]) % 256
        BThMNdlB[UTFIIbKR], BThMNdlB[IwPrrUXI] = BThMNdlB[IwPrrUXI], BThMNdlB[UTFIIbKR]
        local IiYMXZAF = BThMNdlB[(BThMNdlB[UTFIIbKR] + BThMNdlB[IwPrrUXI]) % 256]
        local unmasked = bit32.bxor(kswreAja, UgzbXxNs)
        table.insert(VzsizTRy, string.char(bit32.bxor(unmasked, IiYMXZAF)))
    end
    return table.concat(VzsizTRy)
end

local BThMNdlB_flat = {}
for _, chunk in ipairs(JyFXGRba) do
    for _, byte in ipairs(chunk) do
        table.insert(BThMNdlB_flat, byte)
    end
end

local decrypted = MbeGMXsR(BThMNdlB_flat, EuhXOIqY)
local zjyKYLfQ, Uegesqck = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BThMNdlB_flat)
BThMNdlB_flat = nil

if zjyKYLfQ then 
    local result = zjyKYLfQ() 
    decrypted = nil
    zjyKYLfQ = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "network_optimizer" .. "): " .. tostring(Uegesqck)) 
end
