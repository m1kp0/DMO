local Player = game.Players.LocalPlayer
local numberValue = Instance.new("NumberValue") 
local AmountOfPlayers
local AllPlayers
local TimeOfExecutedLB = 0
local minutesOfExecutedLB = 0
local Players = game:GetService('Players')
local FlnPrtsDstrHght = game.Workspace.FallenPartsDestroyHeight
local antiVoidenabled = false
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
local antiSitEnabled = false
local antiWarpEnabled = false
local UIS = game:GetService("UserInputService")


enabledSpy = false
spyOnMyself = false
public = false
publicItalics = true

privateProperties = {
	Color = Color3.fromRGB(132,0,132); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}

_G.breakLadder = true
_G.breakrfullLadder = true
_G.brkspeed = brkspd
_G.clocktm = clktme
_G.tpbug = true
_G.chatSpyInstance = instance

local function brkLdr()
	while _G.breakLadder == true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88, 141, -237)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90, 140, -234)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92, 137, -231)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94, 136, -230)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, 135, -228)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97, 134, -226)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 132, -224)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 129, -226)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109, 127, -228)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111, 125, -227)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 124, -226)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 123, -226)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 122, -227)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 121, -228)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 120, -229)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 118, -232)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 116, -234)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(126, 114, -237)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 113, -239)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -241)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -244)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 111, -247)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 109, -250)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 107, -253)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 105, -256)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121, 103, -259)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 101, -261)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(117, 99, -264)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 97, -265)
        wait(_G.brkspeed)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 95, -265)
        wait(_G.brkspeed)
    end
end
local function brkldrfull()
	while _G.breakrfullLadder == true do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88, 141, -237)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90, 140, -234)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92, 137, -231)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94, 136, -230)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, 135, -228)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97, 134, -226)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 132, -224)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 129, -226)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109, 127, -228)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111, 125, -227)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 124, -226)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 123, -226)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 122, -227)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 121, -228)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 120, -229)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 118, -232)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 116, -234)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(126, 114, -237)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 113, -239)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -241)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -244)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 111, -247)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 109, -250)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 107, -253)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 105, -256)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121, 103, -259)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 101, -261)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(117, 99, -264)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 97, -265)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 95, -265)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(110, 93, -265)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108, 92, -265)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 90, -264)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(102, 88, -264)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98, 86, -263)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, 84, -262)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(91, 82, -259)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 78, -256)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 76, -253)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 74, -250)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 74, -247)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 73, -244)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 71, -240)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 70, -237)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90, 68, -234)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(91, 67, -231)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94, 66, -230)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(96, 64, -228)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99, 62, -226)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(103, 60, -227)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(107, 57, -227)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111, 55, -227)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(114, 53, -228)
		wait(_G.brkspeed)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 50, -228)
		wait(_G.brkspeed)
	end
end

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabledSpy = not enabledSpy
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabledSpy and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabledSpy and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabledSpy then
				if public then
					saymsg:FireServer((publicItalics and "" or '').."{SPY} [".. p.DisplayName .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end
 
for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_orion_lib.lua')))()
local Window = OrionLib:MakeWindow({Name = "Ladder Breaker | DMO", HidePremium = false, IntroEnabled = false, IntroText = "Loading..", SaveConfig = true, ConfigFolder = "OrionTest"})


local MainTab = Window:MakeTab({Name = "main", Icon = "", PremiumOnly = false})
local ChatTab = Window:MakeTab({Name = "chat", Image = "", PremiumOnly = false})
local TPTab = Window:MakeTab({Name = "teleport", Image = "", PremiumOnly = false})
local DefenseTab = Window:MakeTab({Name = "defense", Image = "", PremiumOnly = false})
local PlayerTab = Window:MakeTab({Name = "character", Image = "", PremiumOnly = false})
local ScriptTab = Window:MakeTab({Name = "scripts", Image = "", PremiumOnly = false})
local ClockTab = Window:MakeTab({Name = "time", Image = "", PremiumOnly = false})
local Ctab = Window:MakeTab({Name = "changelog", Image = "", PremiumOnly = false})
local Servertab = Window:MakeTab({Name = "server", Image = "", PremiumOnly = false})

MainTab:AddToggle({
	Name = "break ladder",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		_G.breakLadder = Value
        brkLdr()
	end    
})

MainTab:AddToggle({
	Name = "break ladder (more)",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		_G.breakrfullLadder = Value
        brkldrfull()
	end    
})

MainTab:AddParagraph("человеку с ником sapfir посвящается...", "ВКЛЮЧАЙТЕ ОДИН BREAK LADDER, ЛЮБОЙ НО ОДИН, ЕСлИ ВКЛЮЧИТЬ ОБА ТО ОН БУДЕТ ОЧень МАЛО ЛОМАТЬ!!!! а еще желательно включить fly и fling из инфините уиледа")
MainTab:AddLabel("лучший delay: 0.06 либо 0.07")

MainTab:AddTextbox({
	Name = "delay (break ladder)",
	Default = "",
	TextDisappear = true,
	Callback = function(brkspd)
		_G.brkspeed = brkspd
	end	  
})

ChatTab:AddToggle({
	Name = "chat spy",
	Default = true,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value == true then
			enabledSpy = true
			spyOnMyself = false
		else
			enabledSpy = false
			spyOnMyself = false
		end
	end    
})

ChatTab:AddToggle({
	Name = "public chat spy",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value == true then
			public = true
		else
			public = false
		end
	end    
})

TPTab:AddButton({
	Name = "spawn",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(91, 3, -26)
  	end    
})

TPTab:AddButton({
	Name = "top of the ladder",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
  	end    
})

TPTab:AddButton({
	Name = "bottom of the ladder",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93, 3, -232)
  	end    
})

TPTab:AddButton({
	Name = "green zone",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(70, 100, -469)
  	end    
})

TPTab:AddButton({
	Name = "yellow zone",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(41, 106, -775)
  	end    
})

TPTab:AddButton({
	Name = "pink zone",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3, 188, -1188)
  	end    
})

TPTab:AddButton({
	Name = "purple zone",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-25, 192, -1534)
  	end    
})

TPTab:AddButton({
	Name = "orange zone",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-82, 282, -1824)
  	end    
})

TPTab:AddButton({
	Name = "dark-yellow zone",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-122, 264, -2145)
  	end    
})

TPTab:AddButton({
	Name = "blue zone",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-204, 264, -2620)
  	end    
})

TPTab:AddButton({
	Name = "end",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-238, 265, -2809)
  	end    
})

DefenseTab:AddButton({
	Name = "delete blur",
	Callback = function()
        game.Workspace.Camera.Blur:Destroy()
  	end    
})

DefenseTab:AddToggle({
	Name = "anti void",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			antiVoidenabled = true
			game:GetService('Workspace').FallenPartsDestroyHeight = -100000
			while Value do
				while game.Players.LocalPlayer.Character.HumanoidRootPart and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < -500 and antiVoidenabled do
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
					OrionLib:MakeNotification({
						Name = "Theres a staarmaan waiting in the sky",
						Content = "i will save you next time:3",
						Image = "rbxassetid://18624604880",
						Time = 5
					})
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
					wait()
				end
				wait()
			end
		else
			antiVoidenabled = false
			game:GetService('Workspace').FallenPartsDestroyHeight = -100
		end
	end    
})

DefenseTab:AddToggle({
	Name = "anti sit",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Flag = "AntiSitToggle",
	Callback = function(Value)
		antiSitEnabled = Value
		if antiSitEnabled then
			while antiSitEnabled do
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit == true then
					game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit = false
				end
			wait()
			end
		end
	end    
})

DefenseTab:AddToggle({
	Name = "anti warp",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Flag = "AntiWarpToggle",
	Callback = function(Value)
		antiWarpEnabled = Value
		if antiWarpEnabled then
			while antiWarpEnabled do
				if game.Workspace.Camera.FieldOfView < 70 or game.Workspace.Camera.FieldOfView > 70 then
					game.Workspace.Camera.FieldOfView = 70
				end
			wait()
			end
		end
	end    
})

PlayerTab:AddTextbox({
	Name = "speed",
	Default = "",
	TextDisappear = true,
	Callback = function(Speed)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed
	end	  
})

PlayerTab:AddTextbox({
	Name = "jump power",
	Default = "",
	TextDisappear = true,
	Callback = function(Jumpp)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jumpp
	end	  
})

PlayerTab:AddToggle({
	Name = "infinite jumps",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			infJump = true
			game:GetService("UserInputService").JumpRequest:Connect(function()
				if infJump then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				end
			end)
		else
			infJump = false
		end
	end
})

PlayerTab:AddTextbox({
	Name = "gravity",
	Default = "",
	TextDisappear = true,
	Callback = function(Grav)
		game.Workspace.Gravity = Grav
	end	  
})

PlayerTab:AddTextbox({
	Name = "field of view",
	Default = "",
	TextDisappear = true,
	Callback = function(fov)
		game.Workspace.Camera.FieldOfView = fov
	end	  
})

PlayerTab:AddButton({
	Name = "sit",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Sit = true
		wait(0.01)
		if OrionLib.Flags["AntiSitToggle"].Value == true then
			OrionLib:MakeNotification({
				Name = "you need to disable the anti sit",
				Content = "you cant sit with enabled anti sit",
				Image = "rbxassetid://18624604880",
				Time = 5
			})
		end
  	end    
})

PlayerTab:AddButton({
	Name = "r6 animation",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))("t.me/arceusxscripts")
  	end    
})

PlayerTab:AddParagraph("defaults","| speed - 16 | jump power - 50 | gravity - 200 | field of view- 70 |")

ScriptTab:AddButton({
	Name = "infinite yield",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

ScriptTab:AddButton({
	Name = "system broken",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
  	end    
})

ScriptTab:AddButton({
	Name = "float",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))("https://t.me/arceusxscripts")
  	end    
})

ScriptTab:AddButton({
	Name = "shaders",
	Callback = function()
		loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))("t.me/arceusxscripts")
  	end    
})

ScriptTab:AddButton({
	Name = "dex Explorer v2",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/dex2.0", true))()
  	end    
})

ClockTab:AddButton({
	Name = "night",
	Callback = function()
      	game.Lighting.ClockTime = 0
  	end    
})

ClockTab:AddButton({
	Name = "day",
	Callback = function()
      	game.Lighting.ClockTime = 10
  	end    
})

ClockTab:AddButton({
	Name = "morning",
	Callback = function()
      	game.Lighting.ClockTime = 6
  	end    
})

ClockTab:AddButton({
	Name = "evening",
	Callback = function()
      	game.Lighting.ClockTime = 18
  	end    
})

ClockTab:AddTextbox({
	Name = "custom time",
	Default = "",
	TextDisappear = true,
	Callback = function(Timee)
		game.Lighting.ClockTime = Timee
	end	  
})

Ctab:AddParagraph("v3.4","deleted: ??? (5 seconds); added: webhook(discord), anti-admin tab, tp to bottom of the stairs; renamed: changelog tab, script; cleared: source, changelog tab ")
Ctab:AddParagraph("v3.5, no more updates (maybe)","added working breaking ladder script, glitch. shhhh...")
Ctab:AddParagraph("v3.6", "i remember the script lol. added server tab")
Ctab:AddParagraph("v3.7", "translated again - english; added: infinite jump; changed: color of the gui")
Ctab:AddParagraph("v3.8", "added: infinite jumps, anti-void, chat spy, public chat spy, anti sit, sit button; changed: renamed anti-admin tab to defense tab")
Ctab:AddParagraph("v3.9", "fixed break ladder and teleport after reset")

AmountOfPlayers = #Players:GetPlayers()
AllPlayers = #Players:GetPlayers()

local plrsSection = Servertab:AddSection({Name = "players (max 50)"})
local CounOfPlayersLbl = Servertab:AddLabel("count of players: "..AmountOfPlayers.."")
local AllPlayersLbl = Servertab:AddLabel("all players: "..AmountOfPlayers.."")
Servertab:AddSection({Name = "you"})
Servertab:AddLabel("you: "..Player.Name.."("..Player.DisplayName..")")
local ExecutedLBbl = Servertab:AddLabel("script executed: "..minutesOfExecutedLB.." min "..TimeOfExecutedLB.." sec")

Players.PlayerAdded:Connect(function(plr)
    AmountOfPlayers = AmountOfPlayers + 1
	AllPlayers = AllPlayers + 1
    CounOfPlayersLbl:Set("count of players: "..AmountOfPlayers.."")
	AllPlayersLbl:Set("all players: "..AllPlayers.."")
end)

Players.PlayerRemoving:Connect(function()
    AmountOfPlayers = AmountOfPlayers - 1
    CounOfPlayersLbl:Set("count of players: "..AmountOfPlayers.."")
end)

while true do
	wait(1)
	TimeOfExecutedLB = TimeOfExecutedLB + 1
	wait()
	ExecutedLBbl:Set("script executed: "..minutesOfExecutedLB.." min "..TimeOfExecutedLB.." sec")
	if TimeOfExecutedLB == 60 then
		minutesOfExecutedLB = minutesOfExecutedLB + 1
		TimeOfExecutedLB = 0
		wait()
	end
	if minutesOfExecutedLB >= 60 then
		for i = 1, 10 do
			OrionLib:MakeNotification({
				Name = "пора заканчивать",
				Content = ""..Player.DisplayName..", ты тут больше часа!!1!",
				Image = "rbxassetid://4483345998",
				Time = 10
			})
			wait()
		end
	end
end

OrionLib:MakeNotification({
	Name = "Ladder Breaker loaded",
	Content = "completely",
	Image = "rbxassetid://4483345998",
	Time = 3
})

OrionLib:Init()
