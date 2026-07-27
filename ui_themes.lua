-- Protected Segment (ui_themes)
local VDKqSqAF = 2
local dfUFOelp = {
{70,74,249,67,253,184,250,41,187,175,210,196,5,92,127,232,188,174,171,247,55,159,233,141,92,200,95,197,63,174,57,164,53,102,215,70,70,8,57,133,187,61,204,153,47,148,15,136,84,97,190,228,81,174,3,27,116,217,240,119},{251,28,183,212,223,166,217,160,199,169,115,6,113,125,4,102,18,245,132,1,233,24,21,227,111,59,108,230,237,183,31,46,125,126,222,124,234,216,207,203,17,94,128,132,225,127,223,32,65,49,41,144,175,149,117,135,148,36,36,215},{48,45,191,121,134,181,193,151,118,227,75,237,74,121,102,89,59,213,191,229,168}
}
local BukaUZVX = "skDbAGQNdnvFQMKj"

local function yXoYYGMz(mRYHaQlZ_data, mRYHaQlZ_key)
    if type(mRYHaQlZ_key) ~= "string" or #mRYHaQlZ_key == 0 then return "" end
    local mRYHaQlZ = {}
    for fILRieJc = 0, 255 do mRYHaQlZ[fILRieJc] = fILRieJc end
    local pcAJHybJ = 0
    for fILRieJc = 0, 255 do
        local mCFmncry = mRYHaQlZ_key:byte((fILRieJc % #mRYHaQlZ_key) + 1)
        pcAJHybJ = (pcAJHybJ + mRYHaQlZ[fILRieJc] + mCFmncry) % 256
        mRYHaQlZ[fILRieJc], mRYHaQlZ[pcAJHybJ] = mRYHaQlZ[pcAJHybJ], mRYHaQlZ[fILRieJc]
    end
    local fILRieJc = 0
    local pcAJHybJ = 0
    local pNGXzJCY = {}
    for _, xwvSynNF in ipairs(mRYHaQlZ_data) do
        fILRieJc = (fILRieJc + 1) % 256
        pcAJHybJ = (pcAJHybJ + mRYHaQlZ[fILRieJc]) % 256
        mRYHaQlZ[fILRieJc], mRYHaQlZ[pcAJHybJ] = mRYHaQlZ[pcAJHybJ], mRYHaQlZ[fILRieJc]
        local mCFmncry = mRYHaQlZ[(mRYHaQlZ[fILRieJc] + mRYHaQlZ[pcAJHybJ]) % 256]
        local unmasked = bit32.bxor(xwvSynNF, VDKqSqAF)
        table.insert(pNGXzJCY, string.char(bit32.bxor(unmasked, mCFmncry)))
    end
    return table.concat(pNGXzJCY)
end

local mRYHaQlZ_flat = {}
for _, chunk in ipairs(dfUFOelp) do
    for _, byte in ipairs(chunk) do
        table.insert(mRYHaQlZ_flat, byte)
    end
end

local decrypted = yXoYYGMz(mRYHaQlZ_flat, BukaUZVX)
local FSdnRBaW, YSYsoeBD = loadstring(decrypted)

-- Immediate Memory Sanitation: Overwrite decrypted variables
table.clear(mRYHaQlZ_flat)
mRYHaQlZ_flat = nil

if FSdnRBaW then 
    local result = FSdnRBaW() 
    decrypted = nil
    FSdnRBaW = nil
    return result
else 
    decrypted = nil
    warn("[ecco] Boot Error (" .. "ui_themes" .. "): " .. tostring(YSYsoeBD)) 
end
