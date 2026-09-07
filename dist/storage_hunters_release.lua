-- Ecco Hub V3 Release Payload | Product: storage_hunters | Version: 3.0.0
-- Protected distribution build. Unauthorized modification prohibited.
local StateMod = require("core/state")
local Window = require("ui/window")
local AutoFarm = require("features/autofarm")
local ESP = require("features/esp")
local PlayerMods = require("features/player")
local Auction = require("features/auction")
local Workshop = require("features/workshop")
local Utils = require("core/utils")
local Main = {}
function Main.init()
    StateMod.LoadConfig()
    local win = Window.init()
    AutoFarm.start()
    ESP.start()
    PlayerMods.start()
    Auction.start()
    Workshop.start()
    local UserInputService = game:GetService("UserInputService")
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == StateMod.STATE.Keybind then
            local targetSG = win and win.SG
            if not targetSG or not targetSG.Parent then
                local gethuiFn = gethui or function() return nil end
                targetSG = gethuiFn() and gethuiFn():FindFirstChild("EccoHub_Overhauled")
                    or game:GetService("CoreGui"):FindFirstChild("EccoHub_Overhauled")
                    or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("EccoHub_Overhauled")
            end
            if targetSG and targetSG:FindFirstChild("MainFrame") then
                targetSG.MainFrame.Visible = not targetSG.MainFrame.Visible
            end
        end
    end)
    Utils.notify("Ecco Hub - Storage Hunters v7.0 (Overhauled) Loaded!")
    print("[EccoHub] Modular engine initialized successfully.")
end
Main.init()
return Main