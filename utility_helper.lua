-- Protected Segment (utility_helper)
local qygSYCpC = 134
local rrxsnocX = {
{17,173,184,191,85,85,228,254,73,83,81,205,134,7,184,47,62,1,124,242,248,64,184,118,202,130,110,11,79,202,122,153,73,50,47,195,2,22,3,19,96,4,134,102,199,83,255,82,235,14,142,100,73,234,244,252,38,117,169,6},{255,141,233,122,229,35,130,210,168,144,42,51,176,249,195,28,62,36,171,73,223,44,103,22,130,111,76,254,147,120,93,35,21,236,63,245,15,191,19,145,50,23,43,240,99,198,169,254,208,231,11,127,165,187,235,39,222,228,78,82},{137,122,67,254,250,179,233,201,110,168,36,188,64,172,75,165,58,87,78,84,252,133,26,129,167,44}
}
local ZyCeqosu = "AwlIOwDnzaHelHwF"

local function IcVFrsRN(JFfloPZQ_data, JFfloPZQ_key)
    if type(JFfloPZQ_key) ~= "string" or #JFfloPZQ_key == 0 then return "" end
    local JFfloPZQ = {}
    for IjcJfXMf = 0, 255 do JFfloPZQ[IjcJfXMf] = IjcJfXMf end
    local yXaZPdxO = 0
    for IjcJfXMf = 0, 255 do
        local JCHSXHMg = JFfloPZQ_key:byte((IjcJfXMf % #JFfloPZQ_key) + 1)
        yXaZPdxO = (yXaZPdxO + JFfloPZQ[IjcJfXMf] + JCHSXHMg) % 256
        JFfloPZQ[IjcJfXMf], JFfloPZQ[yXaZPdxO] = JFfloPZQ[yXaZPdxO], JFfloPZQ[IjcJfXMf]
    end
    local IjcJfXMf = 0
    local yXaZPdxO = 0
    local mZBcvuOM = {}
    for _, xdBPeZhz in ipairs(JFfloPZQ_data) do
        IjcJfXMf = (IjcJfXMf + 1) % 256
        yXaZPdxO = (yXaZPdxO + JFfloPZQ[IjcJfXMf]) % 256
        JFfloPZQ[IjcJfXMf], JFfloPZQ[yXaZPdxO] = JFfloPZQ[yXaZPdxO], JFfloPZQ[IjcJfXMf]
        local JCHSXHMg = JFfloPZQ[(JFfloPZQ[IjcJfXMf] + JFfloPZQ[yXaZPdxO]) % 256]
        local unmasked = bit32.bxor(xdBPeZhz, qygSYCpC)
        table.insert(mZBcvuOM, string.char(bit32.bxor(unmasked, JCHSXHMg)))
    end
    return table.concat(mZBcvuOM)
end

local JFfloPZQ_flat = {}
for _, chunk in ipairs(rrxsnocX) do
    for _, byte in ipairs(chunk) do
        table.insert(JFfloPZQ_flat, byte)
    end
end

local decrypted = IcVFrsRN(JFfloPZQ_flat, ZyCeqosu)
local yHZdjKPd, RwzPHsJe = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(JFfloPZQ_flat)
JFfloPZQ_flat = nil

if yHZdjKPd then 
    local result = yHZdjKPd() 
    decrypted = nil
    yHZdjKPd = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "utility_helper" .. "): " .. tostring(RwzPHsJe)) 
end
