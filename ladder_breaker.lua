--гуи
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_orion_lib.lua')))()
local Window = OrionLib:MakeWindow({Name = "Ladder Breaker | DMO", HidePremium = false, IntroEnabled = false, IntroText = "Loading..", SaveConfig = true, ConfigFolder = "OrionTest"})

--локальные переменные
local Player = game.Players.LocalPlayer
local numberValue = Instance.new("NumberValue") 
local AmountOfPlayers
local AllPlayers
local TimeOfExecutedLB = 0
local Players = game:GetService('Players')
local FlnPrtsDstrHght = game.Workspace.FallenPartsDestroyHeight
local antiVoidEnabled = false

_G.breakLadder = true
_G.breakrfullLadder = true
_G.brkspeed = brkspd
_G.clocktm = clktme
_G.tpbug = true

--функции ломания лестницы
local function brkLdr()
	while _G.breakLadder == true do
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88, 141, -237)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90, 140, -234)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92, 137, -231)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94, 136, -230)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, 135, -228)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97, 134, -226)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 132, -224)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 129, -226)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109, 127, -228)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111, 125, -227)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 124, -226)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 123, -226)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 122, -227)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 121, -228)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 120, -229)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 118, -232)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 116, -234)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(126, 114, -237)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 113, -239)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -241)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -244)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 111, -247)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 109, -250)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 107, -253)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 105, -256)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121, 103, -259)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 101, -261)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(117, 99, -264)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 97, -265)
        wait(_G.brkspeed)
        Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 95, -265)
        wait(_G.brkspeed)
    end
end
local function brkldrfull()
	while _G.breakrfullLadder == true do
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88, 141, -237)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90, 140, -234)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92, 137, -231)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94, 136, -230)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, 135, -228)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97, 134, -226)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 132, -224)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 129, -226)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109, 127, -228)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111, 125, -227)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 124, -226)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 123, -226)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 122, -227)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 121, -228)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 120, -229)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 118, -232)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 116, -234)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(126, 114, -237)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 113, -239)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -241)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -244)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 111, -247)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(124, 109, -250)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 107, -253)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123, 105, -256)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121, 103, -259)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 101, -261)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(117, 99, -264)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115, 97, -265)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(113, 95, -265)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(110, 93, -265)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108, 92, -265)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 90, -264)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(102, 88, -264)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98, 86, -263)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(95, 84, -262)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(91, 82, -259)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 78, -256)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 76, -253)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 74, -250)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 74, -247)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 73, -244)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 71, -240)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89, 70, -237)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90, 68, -234)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(91, 67, -231)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94, 66, -230)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(96, 64, -228)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99, 62, -226)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(103, 60, -227)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(107, 57, -227)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111, 55, -227)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(114, 53, -228)
		wait(_G.brkspeed)
		Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118, 50, -228)
		wait(_G.brkspeed)
	end
end

--глич тп хз зачем мне надо было сделать скрипт максимально большим просто так по приколу
local function tpglitch()
	while _G.tpbug == true do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999, 99999999, -9999)
		wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
		wait()
	end
end

--уведомление когда зашел креатор
game.Players.PlayerAdded:Connect(function(plr)
	if plr.Name == "Yaros1979" then
		OrionLib:MakeNotification({
		Name = "scripts dev joined lol",
		Content = "m1kpe0",
		Image = "rbxassetid://4483345998",
		Time = 15
	})
	end
end)

--маин вкладка
local MainTab = Window:MakeTab({
	Name = "main",
	Icon = "",
	PremiumOnly = false
})

--тогл 1
MainTab:AddToggle({
	Name = "break ladder",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		_G.breakLadder = Value
        brkLdr()
	end    
})

--тогл 2
MainTab:AddToggle({
	Name = "break ladder (more)",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		_G.breakrfullLadder = Value
        brkldrfull()
	end    
})

--взять лестницу
MainTab:AddButton({
	Name = "grab all stairs",
	Callback = function()
        for i, parts in pairs(workspace.Stairs:GetChildren()) do 
			if parts:IsA "Part" then 
				parts.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
			end 
		end
  	end    
})

--текстбокс
MainTab:AddTextbox({
	Name = "delay (break ladder)",
	Default = "",
	TextDisappear = true,
	Callback = function(brkspd)
		_G.brkspeed = brkspd
	end	  
})

--телепорт
local TPTab = Window:MakeTab({
	Name = "teleport",
        Image = "rbxassetid://4483345998",
	PremiumOnly = false
})

--кнопки
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
--анти админ
local AATab = Window:MakeTab({
	Name = "defense",
        Image = "rbxassetid://4483345998",
	PremiumOnly = false
})

--удаление блюра
AATab:AddButton({
	Name = "delete blur",
	Callback = function()
        game.Workspace.Camera.Blur:Destroy()
  	end    
})

AATab:AddToggle({
	Name = "anti void",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			antiVoidEnabled = true
			game:GetService('Workspace').FallenPartsDestroyHeight = -100000
			while Value do
				while game.Players.LocalPlayer.Character.HumanoidRootPart and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < -500 and antiVoidEnabled do
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
					OrionLib:MakeNotification({
						Name = "Theres a staarmaan waiting in the sky",
						Content = "i will save you next time:3",
						Image = "rbxassetid://18624604880",
						Time = 5
					})
					wait()
				end
				wait()
			end
		else
			antiVoidEnabled = false
			game:GetService('Workspace').FallenPartsDestroyHeight = -100
		end
	end    
})

AATab:AddButton({
	Name = "anti bang (press if someone bangs you)",
	Callback = function(Value)
		local positionOld = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game:GetService('Workspace').FallenPartsDestroyHeight = -1000
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, game:GetService('Workspace').FallenPartsDestroyHeight + 999, 0))
		wait(0.01)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, game:GetService('Workspace').FallenPartsDestroyHeight + 500, 0))
		wait(0.8)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(positionOld)
        game:GetService('Workspace').FallenPartsDestroyHeight = -100
	end    
})

--игрок
local PlayerTab = Window:MakeTab({
	Name = "character",
        Image = "rbxassetid://4483345998",
	PremiumOnly = false
})

--слайдеры
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

--кнопка р6 аватар
PlayerTab:AddButton({
	Name = "r6 animation",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))("t.me/arceusxscripts")
  	end    
})

--тогл глитч
PlayerTab:AddToggle({
	Name = "glitch",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(bruh)
		_G.tpbug = bruh
        tpglitch()
	end    
})

--текст
PlayerTab:AddParagraph("defaults","| speed - 16 | jump power - 50 | gravity - 200 | field of view- 70 |")

--скрипты
local ScriptTab = Window:MakeTab({
	Name = "scripts",
        Image = "rbxassetid://4483345998",
	PremiumOnly = false
})

--инфините уиелд
ScriptTab:AddButton({
	Name = "infinite yield",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

--сустемброкен
ScriptTab:AddButton({
	Name = "system broken",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
  	end    
})

--флоат
ScriptTab:AddButton({
	Name = "float",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))("https://t.me/arceusxscripts")
  	end    
})

--шейдеры
ScriptTab:AddButton({
	Name = "shaders",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))("t.me/arceusxscripts")
  	end    
})

--декс в2
ScriptTab:AddButton({
	Name = "dex Explorer v2",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/dex2.0", true))()
  	end    
})

--время
local ClockTab = Window:MakeTab({
	Name = "time",
    	Image = "rbxassetid://4483345998",
	PremiumOnly = false
})

--кнопки
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

Timee = 10

--текстбокс
ClockTab:AddTextbox({
	Name = "custom time",
	Default = "",
	TextDisappear = true,
	Callback = function(Timee)
		game.Lighting.ClockTime = Timee
	end	  
})

--инфо
local Ctab = Window:MakeTab({
	Name = "changelog",
        Image = "rbxassetid://4483345998",
	PremiumOnly = false
})

Ctab:AddParagraph("v3.4","deleted: ??? (5 seconds); added: webhook(discord), anti-admin tab, tp to bottom of the stairs; renamed: changelog tab, script; cleared: source, changelog tab ")
Ctab:AddParagraph("v3.5, no more updates (maybe)","added working breaking ladder script, glitch. shhhh...")
Ctab:AddParagraph("v3.6", "i remember the script lol. added server tab")
Ctab:AddParagraph("v3.7", "переведено на Русский язык хвахвхпхвап")
Ctab:AddParagraph("v3.8", "translated again - english; added: scripts from that script dev (scripts tab) infinite jump; changed: color of the gui")
Ctab:AddParagraph("v3.9", "added: infinite jumps, anti-void, anti-bang; changed: anti-admin tab to defense tab")

local Servertab = Window:MakeTab({
	Name = "server",
        Image = "rbxassetid://4483345998",
	PremiumOnly = false
})

--количество игроков
AmountOfPlayers = #Players:GetPlayers()
AllPlayers = #Players:GetPlayers()

--текст количества игроков
local plrsSection = Servertab:AddSection({Name = "players (max 50)"})
local CounOfPlayersLbl = Servertab:AddLabel("count of players: "..AmountOfPlayers.."")
local AllPlayersLbl = Servertab:AddLabel("all players: "..AmountOfPlayers.."")
Servertab:AddSection({Name = "you"})
Servertab:AddLabel("you: "..Player.Name.."("..Player.DisplayName..")")
local ExecutedLBbl = Servertab:AddLabel("script executed (seconds): "..TimeOfExecutedLB.."")

Players.PlayerAdded:Connect(function()
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
	ExecutedLBbl:Set("script executed (seconds): "..TimeOfExecutedLB.."")
end

OrionLib:MakeNotification({
	Name = "Ladder Breaker loaded",
	Content = "completely",
	Image = "rbxassetid://4483345998",
	Time = 3
})

OrionLib:Init()
