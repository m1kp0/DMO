--script
local plr = game.Players.LocalPlayer
local TweenService = game:GetService'TweenService'
local uis = game:GetService'UserInputService'
local coregui = cloneref(game:GetService'CoreGui')
local dragging
local dragSpeed = 0.2
local dragStart = nil
local startPos = nil

--instance
local gui = Instance.new'ScreenGui'
local frame = Instance.new'Frame'
local main = Instance.new'TextButton'
local corner = Instance.new'UICorner'

--properties
gui.Parent = coregui
gui.Name = 'bypass gui'

frame.Parent = gui
frame.Transparency = 1

main.Parent = frame
main.TextColor3 = Color3.fromRGB(240, 240, 240)
main.BackgroundColor3 = Color3.fromRGB(50, 0, 50)
main.Position = UDim2.new(0, 0, 0, 0)
main.Size = UDim2.new(0, 130, 0, 35)
main.BorderSizePixel = 0
main.Text = 'анти банг - дольче милк'

corner.Parent = main

--functional
main.MouseButton1Click:Connect(function()
    for i, p in pairs(workspace.Damage:GetDescendants()) do
        if p.Name == "TouchInterest" then
            p:Destroy()
        end
    end
    local p = plr.Character.HumanoidRootPart.Position
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(65, 96, -407)
	wait(0.3)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(65, 96, -407)
	wait(0.3)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(p)

end)

--gui
local function updateInput(inp)
	local e = inp.Position - dragStart
	local pos = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + e.X, 
		startPos.Y.Scale, 
		startPos.Y.Offset + e.Y
	)
	TweenService:Create(main, TweenInfo.new(dragSpeed), {Position = pos}):Play()
end

main.InputBegan:Connect(function(inp)
	if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = inp.Position
		startPos = main.Position
		inp.Changed:Connect(function()
			if inp.UserInputState == Enum.UserInputState.End then
				dragging =  false
			end
		end)
	end 
end)

uis.InputChanged:Connect(function(inp)
	if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
		if dragging then
			updateInput(inp)
		end
	end
end)
