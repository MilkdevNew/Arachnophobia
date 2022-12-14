repeat
	task.wait()
until game:IsLoaded()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween, Sping, Ref =
	Fusion.New,
	Fusion.Children,
	Fusion.OnEvent,
	Fusion.Value,
	Fusion.Spring,
	Fusion.Computed,
	Fusion.Tween,
	Fusion.Spring,
	Fusion.Ref
--[[
    Date: 10/25/2022
    Time: 19:27:44

    Path: client\Game\Core\Main.client.lua

    Script made by Gamerboy72008
]]

-- Packages
local Fliter = require(ReplicatedStorage.Common.Utils.Fliter)

-- Data
local Info = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
local LongInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
-- UI

-- Apply or setup or init
Fliter:ApplyFilter("Realistic")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)

if not game:GetService("RunService"):IsStudio() then
	player.CameraMode = Enum.CameraMode.LockFirstPerson
end

-- UI Start

-- Fusion Values
local SizeIcon = Value(UDim2.fromScale(0.183, 0.0477))
local Transparency = Value(1) -- Milk Icon background
local Background = Value(0) -- Main Frame
local Text = Value(1) -- Milk Text
local Label = Value(1) -- Milk's Studio being you GameName
local Frame = Value() -- Ref
local Headphone = Value(1) -- Headphones

local GUI = New("ScreenGui")({
	Name = "TitleScreen",
	IgnoreGuiInset = true,
	Parent = player.PlayerGui,
	[Children] = {
		New("Frame")({
			Name = "Frame",
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = Tween(Background, Info),
			Size = UDim2.fromScale(1, 1),

			[Children] = {
				New("Frame")({
					[Ref] = Frame,
					Name = "Frame",
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					Position = UDim2.fromScale(0.5, 0.0361),
					BackgroundTransparency = Tween(Transparency, LongInfo),
					Size = Tween(SizeIcon, LongInfo), --Spring(SizeIcon, 25, 0.2),
					[Children] = {},
				}),
				New("TextLabel")({
					Name = "TextLabel",
					FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
					Text = "Milk",
					AnchorPoint = Vector2.new(0.5, 0),
					TextColor3 = Color3.fromRGB(0, 0, 0),
					TextScaled = true,
					TextSize = 14,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.0361),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextTransparency = Tween(Text, LongInfo),
					Size = UDim2.fromScale(0.183, 0.325),
				}),
				New("TextLabel")({
					Name = "TextLabel",
					FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextScaled = true,
					TextSize = 14,
					Text = "Milk's Studio beings you Arachnophobia",
					TextWrapped = true,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.423),
					TextTransparency = Tween(
						Label,
						TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					),
					Size = UDim2.fromScale(1, 0.0463),
				}),
				New("TextLabel")({
					Name = "Headphone",
					FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
					Text = "Wear headphones for better gameplay",
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextScaled = true,
					TextSize = 14,
					TextWrapped = true,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.825),
					TextTransparency = Tween(
						Headphone,
						TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					),
					Size = UDim2.fromScale(1, 0.0463),
				}),
				New("ImageLabel")({
					Name = "ImageLabel",
					Image = "rbxassetid://11390622596",
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.713),
					Size = UDim2.fromScale(0.025, 0.0444),
					ImageTransparency = Tween(
						Headphone,
						TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					),

					[Children] = {
						New("UIAspectRatioConstraint")({
							Name = "UIAspectRatioConstraint",
						}),
					},
				}),
			},
		}),
	},
})

repeat
	task.wait()
until game:IsLoaded()

Transparency:set(1)

task.wait(2)

Transparency:set(0)
SizeIcon:set(UDim2.fromScale(0.183, 0.325))
New("UIAspectRatioConstraint")({
	Name = "UIAspectRatioConstraint",
	AspectRatio = 1,
	Parent = Frame:get(),
})
task.wait(0.50)
Text:set(0)
task.wait(1)
Label:set(0)

task.wait(1)

Transparency:set(1)
Text:set(1)
task.wait(0.5)
Label:set(1)

task.wait(1)

Headphone:set(0)

task.wait(2)
Headphone:set(1)
task.wait(1)
Background:set(1)

local sound = Instance.new("Sound")
sound.Name = "Sound"
sound.Looped = true
sound.SoundId = "rbxassetid://9103284660"

ReplicatedStorage.Assets.Audio.RoomZero:Play()
ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("StopAudio").OnClientEvent:Connect(function()
	ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Audio"):WaitForChild("RoomZero"):Stop()
end)
