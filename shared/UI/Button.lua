local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Fusion = require(ReplicatedStorage.Common.Packages.Fusion)
local New, Children, OnEvent, Value, Spring, Computed, Tween, Ref =
	Fusion.New, Fusion.Children, Fusion.OnEvent, Fusion.Value, Fusion.Spring, Fusion.Computed, Fusion.Tween, Fusion.Ref
local Padding = require(ReplicatedStorage.Common.UI.Utils.Padding)
local MouseOverModule =
	require(ReplicatedStorage:WaitForChild("Common"):WaitForChild("Utils"):WaitForChild("MouseEvent"))
--[[
    Date: 10/24/2022
    Time: 22:02:59

    Path: shared\UI\Button.lua

    Script made by Gamerboy72008
]]
local Hover = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Audio"):WaitForChild("Hover")
local Click = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Audio"):WaitForChild("Click")
local info = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 1)

local function e(props)
	local stroke = Value(1)
	local bool = true

	local UI = New("TextButton")({
		Name = "TextButton",
		FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextScaled = true,
		Text = props.Text,
		TextWrapped = true,
		BackgroundColor3 = Color3.fromRGB(72, 128, 112),
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0.0682),

		ZIndex = 2,

		[Children] = {
			New("UIPadding")({
				Name = "UIPadding",
				PaddingBottom = UDim.new(0, 2),
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 1),
				PaddingTop = UDim.new(0, 2),
			}),

			New("UICorner")({
				Name = "UICorner",
				CornerRadius = UDim.new(0, 2),
			}),

			New("UIStroke")({
				Name = "UIStroke",
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(255, 255, 255),
				Enabled = true,
				Thickness = 2,
				Transparency = Tween(stroke, info),
				Archivable = false,
			}),
		},
		-- [OnEvent("MouseEnter")] = function()
		-- 	stroke:set(0)
		-- 	Hover:Play()
		-- end,
		-- [OnEvent("MouseLeave")] = function()
		-- 	stroke:set(1)
		-- end,
		[OnEvent("MouseButton1Click")] = function()
			Click:Play()

			print()

			for i, v in pairs(props.Frame:get():GetChildren()) do
				if v:IsA("Frame") then
					v.Visible = false
				end
			end

			props.Item:get().Visible = true
		end,
	})

	local MouseEnter, MouseLeave = MouseOverModule.MouseEnterLeaveEvent(UI)

	MouseEnter:Connect(function()
		stroke:set(0)
		Hover:Play()
	end)

	MouseLeave:Connect(function()
		stroke:set(1)
	end)

	return UI
end

return e
