-- Protected Segment (utility_helper)
local nEbuoGfM = 75
local IpFOktkf = {
{174,149,168,249,82,196,134,196,140,78,244,45,106,202,170,117,27,33,69,96,136,173,11,222,127,201,152,51,247,80,67,187,2,38,98,225,212,14,138,39,168,31,23,109,244,173,163,190,191,72,149,198,8,59,145,89,18,206,73,195},{184,168,46,30,181,102,236,214,195,241,197,154,12,239,81,164,154,173,250,83,94,185,8,246,53,133,110,45,233,50,72,69,132,82,189,180,220,121,60,206,253,206,124,27,141,164,123,47,14,51,110,9,35,207,255,181,38,111,171,177},{12,231,175,29,202,72,235,94,77,70,36,114,50,241,220,72,138,77,205,241,161,170,56,140,100,194}
}
local rMDdSsUO = "JGbBEDwanHyYIBSR"

local function afaDhjdg(BBpEBaTj_data, BBpEBaTj_key)
    local BBpEBaTj = {}
    for kmvrTOKK = 0, 255 do BBpEBaTj[kmvrTOKK] = kmvrTOKK end
    local kYdhOuNt = 0
    for kmvrTOKK = 0, 255 do
        local mMaflnze = BBpEBaTj_key:byte((kmvrTOKK % #BBpEBaTj_key) + 1)
        kYdhOuNt = (kYdhOuNt + BBpEBaTj[kmvrTOKK] + mMaflnze) % 256
        BBpEBaTj[kmvrTOKK], BBpEBaTj[kYdhOuNt] = BBpEBaTj[kYdhOuNt], BBpEBaTj[kmvrTOKK]
    end
    local kmvrTOKK = 0
    local kYdhOuNt = 0
    local ladHIYkb = {}
    for _, hqCzTyFS in ipairs(BBpEBaTj_data) do
        kmvrTOKK = (kmvrTOKK + 1) % 256
        kYdhOuNt = (kYdhOuNt + BBpEBaTj[kmvrTOKK]) % 256
        BBpEBaTj[kmvrTOKK], BBpEBaTj[kYdhOuNt] = BBpEBaTj[kYdhOuNt], BBpEBaTj[kmvrTOKK]
        local mMaflnze = BBpEBaTj[(BBpEBaTj[kmvrTOKK] + BBpEBaTj[kYdhOuNt]) % 256]
        local unmasked = bit32.bxor(hqCzTyFS, nEbuoGfM)
        table.insert(ladHIYkb, string.char(bit32.bxor(unmasked, mMaflnze)))
    end
    return table.concat(ladHIYkb)
end

local BBpEBaTj_flat = {}
for _, chunk in ipairs(IpFOktkf) do
    for _, byte in ipairs(chunk) do
        table.insert(BBpEBaTj_flat, byte)
    end
end

local decrypted = afaDhjdg(BBpEBaTj_flat, rMDdSsUO)
local KZlFqINE, wuSpUOWo = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(BBpEBaTj_flat)
BBpEBaTj_flat = nil

if KZlFqINE then 
    local result = KZlFqINE() 
    decrypted = nil
    KZlFqINE = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(wuSpUOWo)) 
end
