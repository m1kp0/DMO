--version
local version = "v4.8"
--server
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local saymsg = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local StarterGui = game:GetService("StarterGui")
local FlnPrtsDstrHght = workspace.FallenPartsDestroyHeight
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

--counter
local AmountOfPlayers
local AllPlayers
local TimeOfExecutedLB = 0
local minutesOfExecutedLB = 0
local SavedCheckpoint

--toggle
local breakFullLadderEnabled = false
local breakLadderEnabled = false
local antiVoidEnabled = false
local antiSitEnabled = false
local antiWarpEnabled = false
local chatBypassEn = false
local autoDropDolce = false
local autoGrabDolce = false
local spamen = false
enabledSpy = false
spyOnMyself = false
public = false
publicItalics = true

--properties
privateProperties = {
	Color = Color3.fromRGB(132,0,132); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
local raidSymbol = "👹"
local ladderTransparency = 0.5

--functions
local function brkLdr()
	while breakLadderEnabled == true do
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(88, 141, -237)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(90, 140, -234)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(92, 137, -231)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(94, 136, -230)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(95, 135, -228)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(97, 134, -226)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(100, 132, -224)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(105, 129, -226)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(109, 127, -228)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(111, 125, -227)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(113, 124, -226)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(115, 123, -226)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(118, 122, -227)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(118, 121, -228)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(120, 120, -229)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(123, 118, -232)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 116, -234)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(126, 114, -237)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 113, -239)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -241)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -244)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(124, 111, -247)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(124, 109, -250)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(123, 107, -253)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(123, 105, -256)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(121, 103, -259)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(120, 101, -261)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(117, 99, -264)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(115, 97, -265)
        wait(0.07)
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(113, 95, -265)
        wait(0.07)
    end
end

local function brkldrfull()
	while breakFullLadderEnabled == true do
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(88, 141, -237)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(90, 140, -234)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(92, 137, -231)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(94, 136, -230)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(95, 135, -228)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(97, 134, -226)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(100, 132, -224)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(105, 129, -226)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(109, 127, -228)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(111, 125, -227)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(113, 124, -226)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(115, 123, -226)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(118, 122, -227)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(118, 121, -228)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(120, 120, -229)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(123, 118, -232)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 116, -234)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(126, 114, -237)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 113, -239)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -241)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(125, 112, -244)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(124, 111, -247)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(124, 109, -250)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(123, 107, -253)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(123, 105, -256)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(121, 103, -259)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(120, 101, -261)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(117, 99, -264)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(115, 97, -265)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(113, 95, -265)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(110, 93, -265)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(108, 92, -265)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(105, 90, -264)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(102, 88, -264)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(98, 86, -263)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(95, 84, -262)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(91, 82, -259)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(89, 78, -256)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(89, 76, -253)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(89, 74, -250)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(89, 74, -247)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(89, 73, -244)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(89, 71, -240)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(89, 70, -237)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(90, 68, -234)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(91, 67, -231)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(94, 66, -230)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(96, 64, -228)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(99, 62, -226)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(103, 60, -227)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(107, 57, -227)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(111, 55, -227)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(114, 53, -228)
		wait(0.07)
		Player.Character.HumanoidRootPart.CFrame = CFrame.new(118, 50, -228)
		wait(0.07)
	end
end

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==Player and msg:lower():sub(1,4)=="/spy" then
			enabledSpy = not enabledSpy
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabledSpy and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabledSpy and (spyOnMyself==true or p~=Player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==Player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabledSpy then
				if public then
					saymsg:FireServer((publicItalics and "" or '').."{SPY} [".. p.DisplayName .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.DisplayName .."]: "..msg
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
local chatFrame = Player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

local function ChangeFov(Fov, Time)
	TweenService:Create(workspace.Camera, TweenInfo.new(Time), {FieldOfView = Fov}):Play()
end

--library
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

--main tab
MainTab:AddToggle({
	Name = "break ladder",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		breakLadderEnabled = Value
        brkLdr()
	end    
})

MainTab:AddToggle({
	Name = "break ladder (more)",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		breakFullLadderEnabled = Value
        brkldrfull()
	end    
})

--chat tab
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

ChatTab:AddToggle({
	Name = "spy on myself",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value == true then
			spyOnMyself = true
		else
			spyOnMyself = false
		end
	end    
})

ChatTab:AddSection({Name = "advanced"})

ChatTab:AddParagraph("ВАЖНО", "НЕ ПИШИТЕ НИЧЕГО В ОБЫНЧЫЙ ЧАТ СО ВКЛЮЧЕННЫМ БАЙПАССОМ, ИНАЧЕ - БАН И НЕ БУДЕТ РОБЛАКСА")

ChatTab:AddTextbox({
	Name = "chat (не забанят, пишите сюда!!!!)",
	Default = "",
	TextDisappear = true,
	Callback = function(messageToSay)
		Players:Chat("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE false")
        wait()
        Players:Chat("/e ABC")
        wait()
        Players:Chat("le le le le le le le")
        wait()
        Players:Chat("le le le le le")
        wait()
		ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(messageToSay, "All")
	end	  
})

ChatTab:AddToggle({
	Name = "chat bypass",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		chatBypassEn = Value
		repeat wait(1)
			Players:Chat("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE false")
            wait()
            Players:Chat("/e ABC")
            wait()
            Players:Chat("le le le le le le le")
            wait()
            Players:Chat("le le le le le")
            wait()
		until chatBypassEn == false
	end    
})

local raidSymbol = "👹"
ChatTab:AddToggle({
	Name = "chat raid",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
	spamen = Value
		if spamen then
			if raidSymbol == "👹" then
				repeat
					wait(2)
					ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹👹", "All")
				until spamen == false
			elseif raidSymbol == "👍" then
				repeat
					wait(2)
					ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍", "All")
				until spamen == false
			elseif raidSymbol == "🥵" then
				repeat
					wait(2)
					ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵🥵", "All")
				until spamen == false
			elseif raidSymbol == "😈" then
				repeat
					wait(2)
					ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈", "All")
				until spamen == false
			elseif raidSymbol == "👺" then
				repeat
					wait(2)
					ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺👺", "All")
				until spamen == false
			elseif raidSymbol == "❤️" then
				repeat
					wait(2)
					ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️", "All")
				until spamen == false
			elseif raidSymbol == "💩" then
				repeat
					wait(2)
					ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩", "All")
				until spamen == false
			end
		end
	end    
})

ChatTab:AddDropdown({
	Name = "raid symbol",
	Default = "👹",
	Options = {"👹", "👍", "🥵", "😈", "👺", "❤️", "💩"},
	Callback = function(Value)
		raidSymbol = Value
	end    
})

--telport tab
TPTab:AddButton({
	Name = "spawn",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(91, 3, -26)
  	end    
})

TPTab:AddButton({
	Name = "top of the ladder",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
  	end    
})

TPTab:AddButton({
	Name = "bottom of the ladder",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(93, 3, -232)
  	end    
})

TPTab:AddButton({
	Name = "green zone",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(70, 100, -469)
  	end    
})

TPTab:AddButton({
	Name = "yellow zone",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(41, 106, -775)
  	end    
})

TPTab:AddButton({
	Name = "pink zone",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(3, 188, -1188)
  	end    
})

TPTab:AddButton({
	Name = "purple zone",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(-25, 192, -1534)
  	end    
})

TPTab:AddButton({
	Name = "orange zone",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(-82, 282, -1824)
  	end    
})

TPTab:AddButton({
	Name = "dark-yellow zone",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(-122, 264, -2145)
  	end    
})

TPTab:AddButton({
	Name = "blue zone",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(-204, 264, -2620)
  	end    
})

TPTab:AddButton({
	Name = "end",
	Callback = function()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(-238, 265, -2809)
  	end    
})

--defense tab
DefenseTab:AddSection({Name = "anti-admin"})

DefenseTab:AddToggle({
	Name = "anti blur",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Flag = "AntiSitToggle",
	Callback = function(Value)
		if Value then
			workspace.Camera.Blur.Enabled = false
		else
			workspace.Camera.Blur.Enabled = true
		end
	end    
})


DefenseTab:AddButton({
	Name = "anti kill-parts",
	Callback = function()
		for i, p in pairs(workspace.Damage:GetDescendants()) do
			if p.Name == "TouchInterest" then
				p:Destroy()
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
		while game:GetService("RunService").RenderStepped:Wait() and antiWarpEnabled do
			ChangeFov(70, 0.0000001)
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
		Player.Character.Humanoid.Seated:Connect(function()
			if antiSitEnabled then
				Player.Character.Humanoid.Sit = false
			else
				antiSitEnabled = false
			end
		end)
	end    
})

DefenseTab:AddSection({Name = "advanced"})

DefenseTab:AddToggle({
	Name = "anti void",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			antiVoidEnabled = true
			workspace.FallenPartsDestroyHeight = -100000
			while Value do
				while Player.Character.HumanoidRootPart and Player.Character.HumanoidRootPart.Position.Y < -500 and antiVoidEnabled do
					Player.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
					OrionLib:MakeNotification({
						Name = "Theres a staarmaan waiting in the sky",
						Content = "i will save you next time:3",
						Image = "rbxassetid://18624604880",
						Time = 5
					})
					Player.Character.HumanoidRootPart.CFrame = CFrame.new(80, 147, -247)
					wait()
				end
				wait()
			end
		else
			antiVoidEnabled = false
			workspace.FallenPartsDestroyHeight = -100
		end
	end    
})

DefenseTab:AddToggle({
	Name = "create my ladder",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			for i, p in pairs(workspace.Stairs:GetDescendants()) do
				if p:IsA("Part") then
					local k = Instance.new("Part", workspace)
					k.Position = p.Position
					k.Anchored = true
					k.CFrame = p.CFrame
					k.Size = p.Size
					k.Name = "LB-Ladder"
					k.Color = p.Color
					k.BrickColor = p.BrickColor
					k.Transparency = 0.5
					k.Material = "SmoothPlastic"
				end
			end
		else
			for i, p in pairs(workspace:GetDescendants()) do
				if p.Name == "LB-Ladder" then
					p:Destroy()
				end
			end
		end
	end    
})

DefenseTab:AddButton({
	Name = "died teleport",
	Callback = function()
		Player.Character.Humanoid.Died:Connect(function()
			flashback = Player.Character.HumanoidRootPart.Position
		end)
		Player.CharacterAdded:Connect(function()
			wait(0.2)
			Player.Character.HumanoidRootPart.CFrame = CFrame.new(flashback)
			flashback = nil
		end)
  	end    
})

DefenseTab:AddButton({
	Name = "save checkpoint",
	Callback = function()
		SavedCheckpoint = Player.Character.HumanoidRootPart.Position
		Player.CharacterAdded:Connect(function()
			wait(0.2)
			Player.Character.HumanoidRootPart.CFrame = CFrame.new(SavedCheckpoint)
		end)
  	end    
})

DefenseTab:AddButton({
	Name = "delete checkpoint",
	Callback = function()
		SavedCheckpoint = nil
  	end    
})

DefenseTab:AddButton({
	Name = "drop dolce milk",
	Callback = function()
		local tool = Player.Character:FindFirstChildWhichIsA("Tool")
		if tool then
			tool.Parent = workspace
		else
			OrionLib:MakeNotification({
				Name = "возьми дольче милк",
				Content = "в руки",
				Image = "rbxassetid://18624604880",
				Time = 5
			})
		end
	end
})

DefenseTab:AddToggle({
	Name = "auto drop dolce milk",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		autoDropDolce = Value
		while autoDropDolce do
			wait()
			local tool = Player.Character:FindFirstChild("Dolce Milk")
			if tool and autoDropDolce then
				tool.Parent = workspace
			end
		end
	end    
})

DefenseTab:AddToggle({
	Name = "auto grab dolce milk",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		autoGrabDolce = Value
		while game:GetService("RunService").RenderStepped:Wait() and autoGrabDolce do
			wait(0.1)
			for i, d in pairs(workspace:GetDescendants()) do
				if d.Name == "Dolce Milk" and d.Parent == workspace then
					d.Handle.CFrame = CFrame.new(Player.Character.RightLowerArm.CFrame.Position + Vector3.new(-1, -1, 0))
				end
			end
		end
	end    
})
--character settings tab
PlayerTab:AddTextbox({
	Name = "speed",
	Default = "16",
	TextDisappear = false,
	Callback = function(Speed)
		Player.Character.Humanoid.WalkSpeed = Speed
	end	  
})

PlayerTab:AddTextbox({
	Name = "jump power",
	Default = "50",
	TextDisappear = false,
	Callback = function(Jumpp)
		Player.Character.Humanoid.JumpPower = Jumpp
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
					Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				end
			end)
		else
			infJump = false
		end
	end
})

PlayerTab:AddTextbox({
	Name = "gravity",
	Default = "196",
	TextDisappear = false,
	Callback = function(Grav)
		workspace.Gravity = Grav
	end	  
})

PlayerTab:AddTextbox({
	Name = "field of view",
	Default = "70",
	TextDisappear = false,
	Callback = function(fov)
		workspace.Camera.FieldOfView = fov
	end	  
})

PlayerTab:AddToggle({
	Name = "infinite zoom distance",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			Player.CameraMaxZoomDistance = math.huge
		else
			Player.CameraMaxZoomDistance = 150
		end
	end
})

PlayerTab:AddButton({
	Name = "sit",
	Callback = function()
		if OrionLib.Flags["AntiSitToggle"].Value == true then
			OrionLib:MakeNotification({
				Name = "you need to disable the anti sit",
				Content = "you cant sit with enabled anti sit",
				Image = "rbxassetid://18624604880",
				Time = 5
			})
		else
			workspace.Gravity = 10
			Player.Character.Humanoid.Sit = true
			wait(1)
			workspace.Gravity = 192.6
		end
  	end    
})

PlayerTab:AddToggle({
	Name = "platform stand",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			workspace.Gravity = 10
			Player.Character.Humanoid.PlatformStand = true
			wait(1)
			workspace.Gravity = 192.6
		else
			Player.Character.Humanoid.PlatformStand = false
		end
	end
})

PlayerTab:AddButton({
	Name = "r6 animation",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))("t.me/arceusxscripts")
  	end    
})

PlayerTab:AddParagraph("defaults","| speed - 16 | jump power - 50 | gravity - 196.2 | field of view- 70 |")

--other scripts tab
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
	Name = "dex Explorer v2",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/dex2.0", true))()
  	end    
})

ScriptTab:AddButton({
	Name = "jerk off",
	Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
  	end    
})

ScriptTab:AddButton({
	Name = "pathing & floating",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/m1kp0/universal_scripts/refs/heads/main/ONLY-PC_pathing"))()
  	end    
})

ScriptTab:AddButton({
	Name = "отдельный chat bypass",
	Callback = function()
        loadstring(game:HttpGet'https://raw.githubusercontent.com/m1kp0/universal_scripts/refs/heads/main/chat_bypass.lua')()
  	end    
})

--clocktime tab
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
	Default = game.Lighting.ClockTime,
	TextDisappear = true,
	Callback = function(Timee)
		game.Lighting.ClockTime = Timee
	end	  
})

ClockTab:AddToggle({
	Name = "real time",
	Default = false,
	Flag = "clocktimeflag",
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		while Value do
			wait(1)
			local niggga = os.time()
			local sex = "%H"
			local gay = os.date(sex, niggga)
			wait()
			game.Lighting.ClockTime = gay
		end
	end
})

--changelog tab
Ctab:AddParagraph("v4.0 биг обнова", "added: chat bypass (за сообщения не забанят), chat bypass, послать жестко нахуй, послать еще раз; save checkpoint, delete checkpoint (defense tab); hour (server tab); inf zoom distance (character tab); cleared: changelog tab; поменял местами name и display name (server tab); fixed: теперь минута прибавляется каждые 59 а не 60 секунд (server tab)")
Ctab:AddParagraph("v4.1", "added: drop dolce milk; updated: chat bypass")
Ctab:AddParagraph("v4.2", "haha nice чистый код скрипта; added spy on myself (chat tab)")
Ctab:AddParagraph("v4.3", "added: anti kill parts, create my ladder; fixed anti sit; updated defense tab")
Ctab:AddParagraph("v4.4", "added: ladder transparency, auto-drop dolce milk, auto-grab dolce milk")
Ctab:AddParagraph("v4.5", "optimized script yeeeaaaa; fixed anti-warp; updated chat-bypass")
Ctab:AddParagraph("v4.6", "added: toggle anti blur (defense tab), platform stand (character tab), version notify; deleted: delete blur button (defense tab), shaders (script tab)")
Ctab:AddParagraph("v4.7", "disabled: text disappear; added: died teleport (defense tab)")
Ctab:AddParagraph("v4.8", "deleted: hours (server tab); added: real time (server tab), real time (time tab)")

--server tab
AmountOfPlayers = #Players:GetPlayers()
AllPlayers = #Players:GetPlayers()

Servertab:AddSection({Name = "players (max 50)"})

local CounOfPlayersLbl = Servertab:AddLabel("count of players: "..AmountOfPlayers.."")
local AllPlayersLbl = Servertab:AddLabel("all players: "..AmountOfPlayers.."")

Servertab:AddSection({Name = "you"})

Servertab:AddLabel("you: "..Player.DisplayName.."("..Player.Name..")")
local ExecutedLBbl = Servertab:AddLabel("script executed: "..minutesOfExecutedLB.." min "..TimeOfExecutedLB.." sec")
local RealTimeLbl = Servertab:AddLabel("REAL TIME")


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

local hourOfExecutedLB = 0

OrionLib:MakeNotification({
	Name = "Ladder Breaker "..version.." loaded",
	Content = "completely",
	Image = "rbxassetid://4483345998",
	Time = 7
})

while true do
	wait(1)
	TimeOfExecutedLB = TimeOfExecutedLB + 1
	wait()
	ExecutedLBbl:Set("script executed: "..hourOfExecutedLB.." hours, "..minutesOfExecutedLB.." mins, "..TimeOfExecutedLB.." sec")
	if TimeOfExecutedLB == 59 then
		minutesOfExecutedLB = minutesOfExecutedLB + 1
		TimeOfExecutedLB = 0
		wait()
	end
	local time = os.time()
	local format = "%H:%M"
	local realTime = os.date(format, time)
	wait()
	RealTimeLbl:Set("real time: "..realTime.."")
end

OrionLib:Init()
