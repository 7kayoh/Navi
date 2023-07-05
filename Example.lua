local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer

local Fusion = require(ReplicatedStorage.Fusion)
local Navi = require(ReplicatedStorage.Navi)()

local pages = 35
for i = 1, pages do
    Fusion.New("TextLabel")({
        [Navi.Page] = tostring(i),
        Size = UDim2.fromScale(1, 1),
        Text = i
    })
end

Fusion.New("ScreenGui")({
    Parent = Player.PlayerGui,
    [Fusion.Children] = {
        Navi.Canvas()({
            BackgroundTransparency = 0.7,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1, 1),
        }),
        
        Fusion.New("TextButton"){
            Size = UDim2.fromOffset(200, 50),
            Text = "Random! Page! Please!",
            [Fusion.OnEvent("MouseButton1Click")] = function()
                Navi.To(tostring(math.random(1, pages)))
            end,
        }
    }
})