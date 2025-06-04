-- нихуя опен сурс ладер бреакер 6.2

print"[LadderBreaker]: Starting"
game.StarterGui:SetCore("SendNotification", {
	Title = "Loading LadderBreaker",
	Text = "It may take 15-20 seconds",
	Duration = math.huge,
	Button1 = "Ok"
})

-- script
local plrs = game.Players
local gplrs = plrs:GetPlayers()
local plr = plrs.LocalPlayer
local cam = workspace.Camera
local starter_gui = game:GetService"StarterGui"
local run_service = game:GetService"RunService"
local virtual_user = game:GetService"VirtualUser"
local tween_service = game:GetService"TweenService"
local user_input_service = game:GetService"UserInputService"
local replicated_storage = game:GetService"ReplicatedStorage"
local say_msg_request = replicated_storage:WaitForChild"DefaultChatSystemChatEvents":WaitForChild"SayMessageRequest"
local get_msg = replicated_storage:WaitForChild"DefaultChatSystemChatEvents":WaitForChild"OnMessageDoneFiltering"

-- int variables
local ver = "6.2"
local amount_of_plrs = #gplrs
local all_plrs = #gplrs
local seconds_of_executed_ladderbreaker = 0
local minutes_of_executed_ladderbreaker = 0
local saved_position = nil 
local message_repeats = 3
local osk = 1
local old_position
local saved_checkpoint
local bang_defense = "Kill"

-- toggle(bool) variables
local break_ladder_en = false
local break_ladder_walking_en = false
local noclip_en = false
local anti_spy_en = false
local my_ladder_en = false
local anti_void_en = false
local anti_sit_en = false
local auto_drop_dolce_optimal_en = false
local auto_drop_dolce_fast_en = false
local auto_grab_dolce_fast_en = false
local auto_grab_dolce_optimal_en = false
local auto_hide_dolce_en = false
local farm_dolce_en = false
local dolce_dick_en = false
local loop_speed_en = false
local inf_jump_en = false
local spam_osk = false
local anti_afk_en = nil

-- chat spy variables
local instance = (_G.chatSpyInstance or 0) + 1
spy_en = false
public_spy_en = false
spy_on_myself_en = false
public_italics_en = true
spy_properties = {
	Color = Color3.fromRGB(180, 0, 180),
	Font = Enum.Font.SourceSansBold,
	TextSize = 18
}
_G.chatSpyInstance = instance

-- library
print"[LadderBreaker]: Loading UI-Libraries (it may take 10-20 seconds)"
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
print"[LadderBreaker]: Loaded UI-Library: Fluent"
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
print"[LadderBreaker]: Loaded UI-Library: Rayfield"
print"[LadderBreaker]: Loading functions"
-- chat spy
local function onChatted(p, msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			spy_en = not spy_en
			wait(0.3)
			spy_properties.Text = "{SPY "..(spy_en and "EN" or "DIS").."ABLED}"
			starter_gui:SetCore("ChatMakeSystemMessage",spy_properties)
		elseif spy_en and (spy_on_myself_en==true or p~=plr) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = get_msg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public_spy_en==false and plrs[packet.FromSpeaker].Team==plr.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and spy_en then
				if public_spy_en then
					say_msg_request:FireServer((public_italics_en and "" or '').."{SPY} [".. p.DisplayName .."]: "..msg,"All")
				else
					spy_properties.Text = "{SPY} [".. p.Name .."]: "..msg
					starter_gui:SetCore("ChatMakeSystemMessage", spy_properties)
				end
			end
		end
	end
end

for _, p in ipairs(plrs:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p, msg) end)
end

plrs.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p, msg) end)
end)

-- character functions
local function update_gravity(grav) workspace.Gravity = grav end
local function update_field_of_view(fov) cam.FieldOfView = fov end
local function update_walk_speed(ws) plr.Character.Humanoid.WalkSpeed = ws end
local function update_jump_power(jp) plr.Character.Humanoid.JumpPower = jp end
local function tp(cframe) plr.Character.HumanoidRootPart.CFrame = cframe end

-- clocktime function
local function update_clocktime(time) game.Lighting.ClockTime = time end

-- notify function
local function notify(title, content, dur, subcontent)
	Library:Notify{
		Title = title,
		Content = content,
		SubContent = subcontent,
		Duration = dur
	}
end

-- chat functions
local function load_chat_functions()
	-- script variables
	local replicated_storage = game:GetService"ReplicatedStorage"
	local msg_request = say_msg_request
	
	-- value
	local s = r -- spam/raid msg/symbol
	local spam_delay = 2.5
	
	-- functions
	local function invis_chat(e)
		plrs:Chat(e)
	end
	
	local function bypass_chat()
		invis_chat("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
		task.wait()
		invis_chat("/e ABC")
		task.wait()
		invis_chat("le le le le le le le")
		task.wait()
		invis_chat("le le le le le")
		task.wait()
	end
	
	local function say_msg(msg)
		msg_request:FireServer(msg, "All")
	end
	
	local Window = Rayfield:CreateWindow({
		Name = "Chat functions",
		Icon = 0,
		LoadingTitle = "LadderBreaker: chat functions",
		LoadingSubtitle = "By m1kp",
		Theme = "Default",
		
		DisableRayfieldPrompts = false,
		DisableBuildWarnings = false,
		
		ConfigurationSaving = {
			Enabled = true,
			FolderName = nil,
			FileName = "Chat functions (ladder breaker)"
		},
		
		Discord = {
			Enabled = false,
			Invite = "noinvitelink",
			RememberJoins = true
		},
		
		KeySystem = false,
		KeySettings = {
			Title = "Untitled",
			Subtitle = "Key System",
			Note = "No method of obtaining the key is provided",
			FileName = "Key",
			SaveKey = true,
			GrabKeyFromSite = false,
			Key = {"Hello"}
		}
	})
	
	local Main = Window:CreateTab("Main", 4483362458)
	
	local Bypass = Main:CreateSection("Bypass (ненадо материться)")
	
	local en = false
	local ToggleBypass = Main:CreateToggle({
		Name = "Chat bypass (ненадо материться пожалуста)",
		CurrentValue = false,
		Flag = "BypassToggleFlag",
		Callback = function(bool)
			en = bool
			repeat bypass_chat() until en == false 
		end,
	})
	
	local InputChat = Main:CreateInput({
		Name = "Chat (не материтесь пж)",
		PlaceholderText = "Input",
		RemoveTextAfterFocusLost = true,
		Callback = function(input)
			say_msg(input)
		end,
	})
	
	local Raid = Main:CreateSection("Raid")
	
	local bool1, bool2
	local ToggleRaid = Main:CreateToggle({
		Name = "Chat raid",
		CurrentValue = false,
		Flag = "RaidToggleFlag",
		Callback = function(bool)
			bool1 = bool
			if bool1 then
				repeat
					say_msg(s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s..s)
					wait(2.5)
				until bool1 == false
			end
		end,
	})
	
	local MySpamToggle = Main:CreateToggle({
		Name = "My spam",
		CurrentValue = false,
		Flag = "MySpamToggleFlag",
		Callback = function(bool)
			bool2 = bool
			if bool2 then
				repeat
					say_msg(s)
					wait(spam_delay)
				until bool2 == false
			end
		end,
	})
	
	local InputSpamRaid = Main:CreateInput({
		Name = "Spam/raid message",
		PlaceholderText = "для рейда один символ пж",
		RemoveTextAfterFocusLost = false,
		Callback = function(input)
			s = input
		end,
	})
	
	local InputDelay = Main:CreateInput({
		Name = "Spam delay",
		PlaceholderText = "Input",
		RemoveTextAfterFocusLost = true,
		Callback = function(input)
			spam_delay = input
		end,
	})
end

-- destroy thing function
local function destroy_thing(way, name)
	for i, v in pairs(way:GetDescendants()) do
		if v.Name == name then v:Destroy() end
	end
end

-- breaking ladder functions
local function noclip_for_breaking()
	if plr.Character ~= nil then
		for _, child in pairs(plr.Character:GetDescendants()) do
			if child:IsA"BasePart" and (child.CanCollide and noclip_en) == true then child.CanCollide = false end
		end
	end
end

local function create_ladder_for_breaking(bool)
	if bool then
		for i, v in pairs(workspace.Stairs:GetDescendants()) do
			if v:IsA"Part" then
				local breaking_stair = Instance.new("Part", workspace)
				breaking_stair.Anchored = true 
				breaking_stair.Size = v.Size
				breaking_stair.Transparency = 1
				breaking_stair.CFrame = v.CFrame
				breaking_stair.Position = v.Position - Vector3.new(0, 3, 0)
				breaking_stair.Name = "LadderBreaker_breaking_stair"
			end
		end
	else destroy_thing(workspace, "LadderBreaker_breaking_stair") end
end

-- defense functions
local function anti_blur()
	if anti_blur_en then 
		cam.Blur.Enabled = false
	else
		cam.Blur.Enabled = true
	end
end

local function anti_sit()
	pcall(function()
		if plr.Character and plr.Character.Humanoid.Health > 0 and anti_sit_en then
			plr.Character.Humanoid.Seated:Connect(function()
				if anti_sit_en then plr.Character.Humanoid.Sit = false end
			end)
		end
	end)
end

local function anti_spy() 
	while anti_spy_en do
		plrs:Chat("["..plr.DisplayName.."]: ANTI CHAT SPY")
		task.wait(0.1)
	end
end

local function anti_void() 
	if anti_void_en then
		pcall(function()
			workspace.FallenPartsDestroyHeight = -math.huge
			while anti_void_en do
				if plr.Character and plr.Character.Humanoid.Health > 0 then
					if plr.Character.HumanoidRootPart and plr.Character.HumanoidRootPart.Position.Y < -500 and anti_void_en then
						tp(CFrame.new(80, 149, -247))
						task.wait()
						notify("Theres a staarmaan waiting in the sky", "I will save you next time <3", 3)
					end
				end
				task.wait(0.1)
			end
		end)
	else workspace.FallenPartsDestroyHeight = -100 end
end

local function create_ladder_for_defense()
	if my_ladder_en then
		for i, p in pairs(workspace.Stairs:GetDescendants()) do
			if p:IsA"Part" then
				local defense_stair = Instance.new("Part", workspace)
				defense_stair.Anchored = true
				defense_stair.Size = p.Size
				defense_stair.Color = p.Color
				defense_stair.CFrame = p.CFrame
				defense_stair.Transparency = 0.5
				defense_stair.Position = p.Position
				defense_stair.BrickColor = p.BrickColor
				defense_stair.Material = "SmoothPlastic"
				defense_stair.Name = "LadderBreaker_defense_stair"
			end
		end
	else destroy_thing(workspace, "LadderBreaker_defense_stair") end
end

local function checkpoint(save_or_delete)
	if save_or_delete == "save" then
		saved_checkpoint = plr.Character.HumanoidRootPart.CFrame
		plr.CharacterAdded:Connect(function()
			task.wait(0.2)
			if saved_checkpoint ~= nil then
				tp(CFrame.new(saved_checkpoint))
			end
		end)
	else
		saved_checkpoint = nil
	end
end

local function drop_things_optimized(thing)
	if plr.Backpack:FindFirstChild(thing) then
		plr.Backpack:FindFirstChild(thing).Parent = plr.character
	end
	task.wait()
	if plr.Character:FindFirstChild(thing) then
		plr.Character:FindFirstChild(thing).Parent = workspace
	end
end

local function drop_things_fast(thing)
	for i, v in pairs(plr.Backpack:GetChildren()) do
		if #plr.Backpack:GetChildren() ~= 0 then
			if v.Name == thing then v.Parent = plr.Character end
		end
	end
	task.wait()
	for i, v in pairs(plr.Character:GetChildren()) do
		if v.Name == thing then v.Parent = workspace end
	end
end

local function grab_things_optimal(thing)
	while auto_grab_dolce_optimal_en do
		task.wait()
		if workspace:FindFirstChild("Dolce Milk") then
			plr.Character.Humanoid:EquipTool(workspace:FindFirstChild("Dolce Milk"))
		end
	end
end

local function grab_things_fast(thing)
	while auto_grab_dolce_fast_en do
		task.wait()
		for i, v in pairs(workspace:GetChildren()) do
			if v.Name == thing then
				plr.Character.Humanoid:EquipTool(v)
			end
		end
	end
end

local function farm_things(thing)
	while farm_dolce_en do
		task.wait()
		if plr.Character and plr.Character:WaitForChild("Humanoid").Health ~= 0 and farm_dolce_en then
			task.wait(0.2)
			tp(CFrame.new(-241, 265, -2804))
			task.wait(0.2)
			for i, tool in pairs(plr.Backpack:GetChildren()) do drop_things_fast("Dolce Milk") end
			plr.Character:WaitForChild("Humanoid").Health = 0
		end
		task.wait()
	end
end

local function hide_things(thing)
	while auto_hide_dolce_en do
		task.wait(0.3)
		for i, d in pairs(plr.Character:GetChildren()) do
			if d.Name == thing and auto_hide_dolce_en then 
				if plr.Character.Humanoid.Health ~= 0 then d.Parent = plr.Backpack end
			end
		end
	end
end

-- break ladder function
local function break_ladder()
	while break_ladder_en do
		pcall(function()
			local plr = game.Players.LocalPlayer
			local breakingSpeed = 0.05
			noclipping = run_service.Stepped:Connect(noclip_for_breaking)
			plr.Character.HumanoidRootPart.Size = Vector3.new(1.5,1.5,1.5)
			tp(CFrame.new(90.2871323, 142.19899, -241.016586, 0.216689184, -4.79452353e-08, -0.976240635, -6.84476973e-08, 1, -6.4304956e-08, 0.976240635, 8.0755612e-08, 0.216689184))
			task.wait(breakingSpeed)
			tp(CFrame.new(91.0978851, 140.298981, -238.744034, 0.451353669, -9.80752262e-08, -0.89234513, 3.78280376e-08, 1, -9.07736251e-08, 0.89234513, 7.21534521e-09, 0.451353669))
			task.wait(breakingSpeed)
			tp(CFrame.new(91.6046371, 139.298996, -237.295547, 0.44760713, 5.99268688e-08, -0.894230306, -2.39691129e-08, 1, 5.5017285e-08, 0.894230306, -3.19222071e-09, 0.44760713))
			task.wait(breakingSpeed)
			tp(CFrame.new(92.9826508, 138.298996, -236.002441, 0.560875833, 2.02255208e-08, -0.827899933, 1.60691194e-08, 1, 3.53162264e-08, 0.827899933, -3.31116397e-08, 0.560875833))
			task.wait(breakingSpeed)
			tp(CFrame.new(94.6445465, 136.298996, -233.878571, 0.678971052, 2.75740355e-08, -0.734165013, 2.43300722e-08, 1, 6.0059314e-08, 0.734165013, -5.86408255e-08, 0.678971052))
			task.wait(breakingSpeed)
			tp(CFrame.new(96.3649826, 135.298996, -232.799728, 0.737124205, -7.15544459e-08, -0.675757289, 4.51176092e-08, 1, -5.66729561e-08, 0.675757289, 1.12864544e-08, 0.737124205))
			task.wait(breakingSpeed)
			tp(CFrame.new(98.2008362, 133.298996, -231.302521, 0.832671225, -7.37861754e-08, -0.553767622, 5.41573719e-08, 1, -5.18103427e-08, 0.553767622, 1.31503812e-08, 0.832671225))
			task.wait(breakingSpeed)
			tp(CFrame.new(100.045044, 132.298996, -230.338242, 0.898028553, -1.85680875e-08, -0.439937174, 4.47176696e-08, 1, 4.90744121e-08, 0.439937174, -6.37431867e-08, 0.898028553))
			task.wait(breakingSpeed)
			tp(CFrame.new(102.621155, 130.298996, -229.510193, 0.975852668, -9.59031183e-08, -0.218429893, 1.01547307e-07, 1, 1.4613792e-08, 0.218429893, -3.64418753e-08, 0.975852668))
			task.wait(breakingSpeed)
			tp(CFrame.new(104.224251, 129.298996, -229.041656, 0.989499152, -4.17768646e-08, -0.144538477, 4.8952419e-08, 1, 4.60881751e-08, 0.144538477, -5.26797201e-08, 0.989499152))
			task.wait(breakingSpeed)
			tp(CFrame.new(105.747269, 128.298965, -228.67215, 0.990291774, 2.31010642e-08, -0.139004305, -2.69731437e-08, 1, -2.59719943e-08, 0.139004305, 2.94692359e-08, 0.990291774))
			task.wait(breakingSpeed)
			tp(CFrame.new(107.090187, 127.301003, -228.880722, 0.998178422, 1.11795488e-08, 0.0603306815, -1.04699032e-08, 1, -1.20787185e-08, -0.0603306815, 1.142506e-08, 0.998178422))
			task.wait(breakingSpeed)
			tp(CFrame.new(108.413338, 126.298996, -228.716553, 0.999167681, -6.68114719e-09, 0.0407914072, 2.30229569e-09, 1, 1.07394378e-07, -0.0407914072, -1.07211072e-07, 0.999167681))
			task.wait(breakingSpeed)
			tp(CFrame.new(109.961189, 125.298996, -229.40242, 0.978919268, 9.81815962e-09, 0.204247564, 2.64855471e-09, 1, -6.07639095e-08, -0.204247564, 6.00239218e-08, 0.978919268))
			task.wait(breakingSpeed)
			tp(CFrame.new(111.531853, 124.298996, -229.330017, 0.958375871, 2.94830205e-08, 0.285509497, -7.94839583e-10, 1, -1.0059653e-07, -0.285509497, 9.61823545e-08, 0.958375871))
			task.wait(breakingSpeed)
			tp(CFrame.new(113.806046, 122.298996, -230.324554, 0.921631157, -2.16754015e-09, 0.388066947, 1.21990595e-09, 1, 2.68829048e-09, -0.388066947, -2.00420724e-09, 0.921631157))
			task.wait(breakingSpeed)
			tp(CFrame.new(115.568855, 121.299004, -231.170425, 0.896044672, -4.62760319e-08, 0.443963975, 4.74952131e-08, 1, 8.37500735e-09, -0.443963975, 1.35817819e-08, 0.896044672))
			task.wait(breakingSpeed)
			tp(CFrame.new(116.907997, 120.299004, -232.019852, 0.785785735, 9.36495752e-08, 0.618498802, -1.09982103e-07, 1, -1.16850796e-08, -0.618498802, -5.8841831e-08, 0.785785735))
			task.wait(breakingSpeed)
			tp(CFrame.new(117.750374, 119.299004, -232.964508, 0.766403079, -5.49552901e-08, 0.642359972, 3.03970005e-08, 1, 4.92853474e-08, -0.642359972, -1.82466255e-08, 0.766403079))
			task.wait(breakingSpeed)
			tp(CFrame.new(118.971375, 118.299004, -233.847092, 0.680802226, 5.91350862e-08, 0.732467234, 1.54345638e-08, 1, -9.5079983e-08, -0.732467234, 7.6035974e-08, 0.680802226))
			task.wait(breakingSpeed)
			tp(CFrame.new(119.779747, 117.299004, -235.016525, 0.620363712, 4.14338537e-08, 0.784314275, -1.25519701e-08, 1, -4.28999805e-08, -0.784314275, 1.67689027e-08, 0.620363712))
			task.wait(breakingSpeed)
			tp(CFrame.new(120.715286, 116.299004, -236.171967, 0.604902804, -6.95124882e-08, 0.796299279, 1.30869937e-08, 1, 7.73529862e-08, -0.796299279, -3.6369876e-08, 0.604902804))
			task.wait(breakingSpeed)
			tp(CFrame.new(121.504257, 115.299004, -237.414734, 0.532548904, -5.04965456e-08, 0.846399248, -2.90271629e-08, 1, 7.79241347e-08, -0.846399248, -6.60669812e-08, 0.532548904))
			task.wait(breakingSpeed)
			tp(CFrame.new(122.117371, 114.299004, -238.541702, 0.42217344, 9.86871118e-09, 0.906515062, 7.67946595e-09, 1, -1.44628345e-08, -0.906515062, 1.30673765e-08, 0.42217344))
			task.wait(breakingSpeed)
			tp(CFrame.new(123.046234, 112.299004, -241.616653, 0.274375856, 2.04904804e-08, 0.961622536, -2.82256245e-08, 1, -1.32547333e-08, -0.961622536, -2.3505617e-08, 0.274375856))
			task.wait(breakingSpeed)
			tp(CFrame.new(123.593735, 111.299004, -242.749542, 0.229756922, 4.71209738e-08, 0.973248065, -1.40535565e-08, 1, -4.50985489e-08, -0.973248065, -3.31589267e-09, 0.229756922))
			task.wait(breakingSpeed)
			tp(CFrame.new(123.748993, 110.299004, -244.383392, 0.119748861, -4.74855621e-09, 0.992804229, -3.66719299e-09, 1, 5.22529886e-09, -0.992804229, -4.26652802e-09, 0.119748861))
			task.wait(breakingSpeed)
			tp(CFrame.new(123.89962, 110.299995, -246.38942, 0.0361889414, 7.96216e-08, 0.999344945, 4.05463432e-08, 1, -8.11420762e-08, -0.999344945, 4.34562288e-08, 0.0361889414))
			task.wait(breakingSpeed)
			tp(CFrame.new(123.635635, 108.299004, -248.081543, -0.0769171864, -8.11551217e-08, 0.99703747, -3.16514637e-09, 1, 8.11520806e-08, -0.99703747, 3.08622039e-09, -0.0769171864))
			task.wait(breakingSpeed)
			tp(CFrame.new(123.577309, 107.299004, -249.108566, -0.0518187359, -4.53069084e-08, 0.998656511, -5.51531354e-09, 1, 4.50816771e-08, -0.998656511, -3.17182836e-09, -0.0518187359))
			task.wait(breakingSpeed)
			tp(CFrame.new(123.393623, 106.299004, -250.494919, -0.231385753, 1.13640709e-07, 0.972862065, -2.45591263e-08, 1, -1.22651855e-07, -0.972862065, -5.22725365e-08, -0.231385753))
			task.wait(breakingSpeed)
			tp(CFrame.new(122.710434, 105.299004, -251.976761, -0.37035495, -1.64589515e-08, 0.928890288, 9.04863739e-10, 1, 1.80797155e-08, -0.928890288, 7.53643103e-09, -0.37035495))
			task.wait(breakingSpeed)
			tp(CFrame.new(122.158119, 104.299988, -252.889267, -0.42040509, 4.45564652e-09, 0.907336533, -8.9301827e-10, 1, -5.32445865e-09, -0.907336533, -3.04869774e-09, -0.42040509))
			task.wait(breakingSpeed)
			tp(CFrame.new(121.294701, 103.301003, -254.337387, -0.535623789, 7.37801074e-08, 0.844456732, -2.1261263e-08, 1, -1.00855551e-07, -0.844456732, -7.19748456e-08, -0.535623789))
			task.wait(breakingSpeed)
			tp(CFrame.new(120.681671, 102.301003, -255.877136, -0.642682076, -1.67137824e-08, 0.76613301, -9.52543489e-10, 1, 2.10167173e-08, -0.76613301, 1.27772921e-08, -0.642682076))
			task.wait(breakingSpeed)
			tp(CFrame.new(119.662415, 101.301003, -256.994781, -0.632999241, 7.13252604e-08, 0.774152458, 1.55037903e-08, 1, -7.9456413e-08, -0.774152458, -3.82935497e-08, -0.632999241))
			task.wait(breakingSpeed)
			tp(CFrame.new(118.77874, 100.301003, -257.984833, -0.716385543, -1.71869772e-08, 0.697704613, -6.95620761e-09, 1, 1.74911428e-08, -0.697704613, 7.67702435e-09, -0.716385543))
			task.wait(breakingSpeed)
			tp(CFrame.new(117.64502, 99.3009949, -259.123322, -0.800759912, -3.11203081e-08, 0.598985434, -1.72060801e-08, 1, 2.89529076e-08, -0.598985434, 1.28781359e-08, -0.800759912))
			task.wait(breakingSpeed)
			tp(CFrame.new(117.64502, 99.3009949, -259.123322, -0.800759912, -3.11203081e-08, 0.598985434, -1.72060801e-08, 1, 2.89529076e-08, -0.598985434, 1.28781359e-08, -0.800759912))
			task.wait(breakingSpeed)
			tp(CFrame.new(115.316833, 97.3010025, -260.57663, -0.82039547, 3.2885076e-08, 0.571796536, -1.97802628e-08, 1, -8.58919407e-08, -0.571796536, -8.17756458e-08, -0.82039547))
			task.wait(breakingSpeed)
			tp(CFrame.new(113.726326, 96.3009949, -261.376984, -0.909036577, -2.97304226e-08, 0.416716367, 2.12505196e-08, 1, 1.17700978e-07, -0.416716367, 1.15849929e-07, -0.909036577))
			task.wait(breakingSpeed)
			tp(CFrame.new(112.365425, 95.3010025, -261.610168, -0.927964509, 4.85544689e-08, 0.372668564, 1.68661192e-08, 1, -8.8291074e-08, -0.372668564, -7.56455094e-08, -0.927964509))
			task.wait(breakingSpeed)
			tp(CFrame.new(110.901733, 94.3010025, -262.06958, -0.987205684, 9.71211875e-08, 0.159452155, 8.6838071e-08, 1, -7.14581248e-08, -0.159452155, -5.66973455e-08, -0.987205684))
			task.wait(breakingSpeed)
			tp(CFrame.new(109.692291, 93.3010025, -262.383759, -0.980488539, -3.64462593e-08, 0.196576193, -2.91028233e-08, 1, 4.02453324e-08, -0.196576193, 3.37391626e-08, -0.980488539))
			task.wait(breakingSpeed)
			tp(CFrame.new(108.489365, 92.3010025, -262.534027, -0.986067474, -5.87416409e-08, 0.166345671, -6.76184087e-08, 1, -4.76999169e-08, -0.166345671, -5.82833692e-08, -0.986067474))
			task.wait(breakingSpeed)
			tp(CFrame.new(106.537674, 91.3010025, -262.720703, -0.999931037, -2.24309482e-09, -0.0117414938, -2.20549312e-09, 1, -3.21542015e-09, 0.0117414938, -3.1893026e-09, -0.999931037))
			task.wait(breakingSpeed)
			tp(CFrame.new(104.887077, 90.3010025, -262.596161, -0.995300889, 5.40037242e-08, -0.0968301743, 4.66026435e-08, 1, 7.86952157e-08, 0.0968301743, 7.38128776e-08, -0.995300889))
			task.wait(breakingSpeed)
			tp(CFrame.new(103.820724, 89.3010025, -262.438812, -0.987907588, 3.34804504e-08, -0.155043945, 2.65912661e-08, 1, 4.6507715e-08, 0.155043945, 4.18225063e-08, -0.987907588))
			task.wait(breakingSpeed)
			tp(CFrame.new(102.105492, 88.3010025, -262.006592, -0.968392909, -7.10715824e-08, -0.249429628, -4.31664198e-08, 1, -1.17345841e-07, 0.249429628, -1.02869897e-07, -0.968392909))
			task.wait(breakingSpeed)
			tp(CFrame.new(100.995506, 87.3010025, -261.777893, -0.952094436, 1.24691383e-07, -0.305804104, 1.16673007e-07, 1, 4.44979555e-08, 0.305804104, 6.68717082e-09, -0.952094436))
			task.wait(breakingSpeed)
			tp(CFrame.new(99.2935104, 86.3010025, -261.273956, -0.929972231, 6.24183443e-08, -0.367629796, 5.68595304e-08, 1, 2.59515431e-08, 0.367629796, 3.23095661e-09, -0.929972231))
			task.wait(breakingSpeed)
			tp(CFrame.new(98.2667007, 85.3010025, -260.794861, -0.897156298, -4.42727313e-08, -0.441713184, -4.57311806e-08, 1, -7.34574401e-09, 0.441713184, 1.36097853e-08, -0.897156298))
			task.wait(breakingSpeed)
			tp(CFrame.new(97.1793594, 84.3010025, -259.237549, -0.834665418, -7.94021702e-08, -0.550757349, -7.1248671e-08, 1, -3.6192656e-08, 0.550757349, 9.03196895e-09, -0.834665418))
			task.wait(breakingSpeed)
			tp(CFrame.new(95.887558, 83.3010025, -258.414917, -0.805086672, 1.28317652e-07, -0.593157232, 1.10091491e-07, 1, 6.69037732e-08, 0.593157232, -1.14382317e-08, -0.805086672))
			task.wait(breakingSpeed)
			tp(CFrame.new(94.8851013, 82.3010025, -257.492767, -0.723361731, 1.1667273e-07, -0.690469325, 9.37954212e-08, 1, 7.07123604e-08, 0.690469325, -1.36122464e-08, -0.723361731))
			task.wait(breakingSpeed)
			tp(CFrame.new(93.9190674, 81.3010025, -256.479492, -0.641820073, 9.16277614e-08, -0.76685524, 6.77392435e-08, 1, 6.27906687e-08, 0.76685524, -1.16458834e-08, -0.641820073))
			task.wait(breakingSpeed)
			tp(CFrame.new(93.1807861, 80.3010025, -255.430206, -0.617946088, -7.19211712e-08, -0.786220491, -5.26583044e-08, 1, -5.00892341e-08, 0.786220491, 1.04485922e-08, -0.617946088))
			task.wait(breakingSpeed)
			tp(CFrame.new(92.3184738, 79.3010025, -254.313919, -0.522809267, -4.44631958e-08, -0.852449715, 5.04990183e-08, 1, -8.31304803e-08, 0.852449715, -8.65092531e-08, -0.522809267))
			task.wait(breakingSpeed)
			tp(CFrame.new(91.3926468, 78.3010025, -252.766205, -0.457059085, 3.93542399e-09, -0.889436364, -2.19847376e-10, 1, 4.53760096e-09, 0.889436364, 2.26949193e-09, -0.457059085))
			task.wait(breakingSpeed)
			tp(CFrame.new(90.8795319, 77.3010025, -251.461411, -0.356288821, -1.12123402e-07, -0.934375882, 1.88049931e-08, 1, -1.27168747e-07, 0.934375882, -6.28797352e-08, -0.356288821))
			task.wait(breakingSpeed)
			tp(CFrame.new(90.5267105, 76.3010025, -250.176254, -0.263333082, 1.13872396e-07, -0.96470499, -2.37062618e-08, 1, 1.24509612e-07, 0.96470499, 5.5657047e-08, -0.263333082))
			task.wait(breakingSpeed)
			tp(CFrame.new(90.1674194, 75.3010025, -248.859985, -0.270067543, 4.81445603e-08, -0.962841392, -8.44487946e-09, 1, 5.23712949e-08, 0.962841392, 2.22748664e-08, -0.270067543))
			task.wait(breakingSpeed)
			tp(CFrame.new(89.7181473, 74.3009949, -246.990936, -0.123625994, -9.58061293e-08, -0.992328882, 5.18873868e-08, 1, -1.03010962e-07, 0.992328882, -6.42241886e-08, -0.123625994))
			task.wait(breakingSpeed)
			tp(CFrame.new(89.7181473, 74.3009949, -246.990936, -0.123625994, -9.58061293e-08, -0.992328882, 5.18873868e-08, 1, -1.03010962e-07, 0.992328882, -6.42241886e-08, -0.123625994))
			task.wait(0.35)
			noclipping:Disconnect()
			task.wait()
		end)
		task.wait()
	end
end

local Window = Library:CreateWindow{
	Title = "LadderBreaker",
	SubTitle = "DMO",
	TabWidth = 160,
	Size = UDim2.fromOffset(1500, 1000),
	Resize = true,
	MinSize = Vector2.new(1500, 1000),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.RightControl
}

-- options
local Options = Library.Options

-- tabs
local Tabs = {
	Main = Window:CreateTab{Title = "Main", Icon = "phosphor-steps"},
	Chat = Window:CreateTab{Title = "Chat", Icon = "message-circle-more"},
	TP = Window:CreateTab{Title = "Teleport", Icon = "cable"},
	Defense = Window:CreateTab{Title = "Defense", Icon = "shield-check"},
	Character = Window:CreateTab{Title = "Player", Icon = "user-cog"},
	Scripts = Window:CreateTab{Title = "Scripts", Icon = "code-xml"},
	ClockTime = Window:CreateTab{Title = "Clock time", Icon = "sun"},
	Changelog = Window:CreateTab{Title = "Changelog", Icon = "mail-plus"},
	Server = Window:CreateTab{Title = "Server", Icon = "server"}
}

-- main tab
local BreakLadderToggle = Tabs.Main:CreateToggle("BreakLadderToggle_Flag", {Title = "Break Ladder", Default = false})
BreakLadderToggle:OnChanged(function(bool)
	break_ladder_en = bool
	noclip_en = bool
	create_ladder_for_breaking(bool)
	if noclip_en then
		noclipping = run_service.Stepped:Connect(noclip_for_breaking)
	else
		if noclipping then
			noclipping:Disconnect()
		end
	end
	break_ladder()
end)

-- chat tab
local SpyChat = Tabs.Chat:CreateToggle("SpyChat_Flag", {Title = "Chat Spy", Default = false})
SpyChat:OnChanged(function(bool)
	spy_en = bool
end)

local PublicSpy = Tabs.Chat:CreateToggle("PublicSpy_Flag", {Title = "Public Spy", Default = false})
PublicSpy:OnChanged(function(bool)
	public_spy_en = bool
end)

local SpyOnMyself = Tabs.Chat:CreateToggle("SpyOnMyself_Flag", {Title = "Spy On Myself", Default = false})
SpyOnMyself:OnChanged(function(bool)
	spy_on_myself_en = bool
end)

local AntiSpy = Tabs.Chat:CreateToggle("AntiSpy_Flag", {Title = "Anti chat spy", Default = false})
AntiSpy:OnChanged(function(bool)
	anti_spy_en = bool
	anti_spy()
end)

Tabs.Chat:CreateButton{
Title = "Chat functions",
Description = "",
Callback = function()
	load_chat_functions()
end}

-- tp tab
Tabs.TP:CreateButton{
	Title = "Spawn",
	Description = "",
	Callback = function()
		tp(CFrame.new(91, 3, -26))
	end
}

Tabs.TP:CreateButton{
	Title = "Top of the ladder",
	Description = "",
	Callback = function()
		tp(CFrame.new(80, 147, -247))
	end
}

Tabs.TP:CreateButton{
	Title = "Bottom of the ladder",
	Description = "",
	Callback = function()
		tp(CFrame.new(93, 3, -232))
	end
}

Tabs.TP:CreateButton{
	Title = "Green zone",
	Description = "",
	Callback = function()
		tp(CFrame.new(70, 100, -469))
	end
}

Tabs.TP:CreateButton{
	Title = "Pink zone",
	Description = "",
	Callback = function()
		tp(CFrame.new(3, 188, -1188))
	end
}

Tabs.TP:CreateButton{
	Title = "Purple zone",
	Description = "",
	Callback = function()
		tp(CFrame.new(-25, 192, -1534))
	end
}

Tabs.TP:CreateButton{
	Title = "Orange zone",
	Description = "",
	Callback = function()
		tp(CFrame.new(-82, 282, -1824))
	end
}

Tabs.TP:CreateButton{
	Title = "Dark-yellow zone",
	Description = "",
	Callback = function()
		tp(CFrame.new(-122, 264, -2145))
	end
}

Tabs.TP:CreateButton{
	Title = "Blue zone",
	Description = "",
	Callback = function()
		tp(CFrame.new(-204, 264, -2620))
	end
}

Tabs.TP:CreateButton{
	Title = "End",
	Description = "",
	Callback = function()
		tp(CFrame.new(-238, 265, -2809))
	end
}

-- defense tab
local AntiBlur = Tabs.Defense:CreateToggle("AntiBlur_Flag", {Title = "Anti blur", Default = false})
AntiBlur:OnChanged(function(bool)
	anti_blur_en = bool
	anti_blur()
end)

local AntiSit = Tabs.Defense:CreateToggle("AntiSit_Flag", {Title = "Anti sit", Default = false})
AntiSit:OnChanged(function(bool)
	anti_sit_en = bool
	anti_sit()
end)

local AntiKillParts = Tabs.Defense:CreateToggle("AntiKillParts_Flag", {Title = "Anti kill/kick parts", Default = false})
AntiKillParts:OnChanged(function(bool)
	pcall(function()
		for i, part in pairs(workspace.Damage:GetChildren()) do
			if part:IsA("Part") then
				if bool then part.CanTouch = false else part.CanTouch = true end
			end
		end
		for i, part in pairs(workspace:GetDescendants()) do
			if part:IsA("Part") and part.Name == "TeleportPart" then
				if bool then part.CanTouch = false else part.CanTouch = true end
			end
		end
	end)
end)

local AntiVoid = Tabs.Defense:CreateToggle("AntiVoid_Flag", {Title = "Anti void", Default = false})
AntiVoid:OnChanged(function(bool)
	anti_void_en = bool
	anti_void()
end)

Tabs.Defense:CreateButton{
	Title = "Kill/Kick bang",
	Description = "",
	Callback = function()
		if bang_defense == "Kick" then
			local old_position = plr.Character.HumanoidRootPart.CFrame
			for i, part in pairs(workspace:GetDescendants()) do
				if part:IsA("Part") and part.Name == "TeleportPart" then
					part.CanTouch = false
				end
			end
			for i = 1, 5 do
				task.wait(0.2)
				tp(CFrame.new(-245.082535, 265.335266, -2826.54883, -0.985214949, 3.41150885e-09, -0.171322852, -1.9914264e-08, 1, 1.34432383e-07, 0.171322852, 1.35856567e-07, -0.985214949))
			end
			tp(old_position)
		else
			local old_position = plr.Character.HumanoidRootPart.CFrame
			for i, part in pairs(workspace.Damage:GetChildren()) do
				if part:IsA("Part") then
					part.CanTouch = false
				end
			end
			task.wait(0.1)
			for i = 1, 5 do
				task.wait(0.2)
				tp(CFrame.new(65.8883896, 95.9391251, -407.936798, 0.99227649, -5.69515706e-08, 0.124046057, 5.96924039e-08, 1, -1.83786479e-08, -0.124046057, 2.56413077e-08, 0.99227649))
			end
			task.wait(0.1)
			tp(old_position)
		end
	end
}

Tabs.Defense:CreateButton{
	Title = "Kill/Kick facebang",
	Description = "",
	Callback = function()
		if bang_defense == "Kill" then
			local old_position = plr.Character.HumanoidRootPart.CFrame
			for i, part in pairs(workspace.Damage:GetChildren()) do
				if part:IsA("Part") then
					part.CanTouch = false
				end
			end
			for i = 1, 3 do
				task.wait(0.2)
				tp(CFrame.new(65.9753799, 90.9765091, -407.554199, -0.998261631, -0.00710663432, -0.0585079715, 7.12106774e-09, 0.992703795, -0.120578274, 0.0589379929, -0.120368667, -0.990978181))
			end
			task.wait(0.1)
			tp(old_position)
		elseif bang_defense == "Kick" then
			local old_position = plr.Character.HumanoidRootPart.CFrame
			for i, part in pairs(workspace:GetDescendants()) do
				if part:IsA("Part") and part.Name == "TeleportPart" then
					part.CanTouch = false
				end
			end
			for i = 1, 3 do
				task.wait(0.2)
				tp(CFrame.new(-244.424606, 265.321747, -2826.51587, 0.981782734, 2.22285195e-08, 0.190007031, -4.74679318e-08, 1, 1.2828302e-07, -0.190007031, -1.3496529e-07, 0.981782734))
			end
			task.wait(0.1)
			tp(old_position)
		end
	end
}

local BangDefenseDrop = Tabs.Defense:CreateDropdown("BangDefenseDrop_Flag", {
	Title = "Bang defense",
	Values = {"Kill", "Kick"},
	Multi = false,
	Default = "Kill",
})

BangDefenseDrop:OnChanged(function(value)
	bang_defense = value
end)

local CreateMyLadder = Tabs.Defense:CreateToggle("CreateMyLadder_Flag", {Title = "Create my ladder", Default = false})
CreateMyLadder:OnChanged(function(bool)
	my_ladder_en = bool
	create_ladder_for_defense()
end)

Tabs.Defense:CreateButton{
	Title = "Save checkpoint",
	Description = "",
	Callback = function()
		checkpoint("save")
	end
}

Tabs.Defense:CreateButton{
	Title = "Delete checkpoint",
	Description = "",
	Callback = function()
		checkpoint("delete")
	end
}

Tabs.Defense:CreateButton{
	Title = "Drop dolce milks",
	Description = "",
	Callback = function()
		drop_things_fast("Dolce Milk")
	end
}

local AutoDropDolceMilkFast = Tabs.Defense:CreateToggle("AutoDropDolceMilkFast_Flag", {Title = "Auto drop dolce milk (fast, laggy)", Default = false})
AutoDropDolceMilkFast:OnChanged(function(bool)
	auto_drop_dolce_fast_en = bool
	while auto_drop_dolce_fast_en do
		drop_things_fast("Dolce Milk")
		task.wait()
	end
end)

local AutoDropDolceMilkOptimal = Tabs.Defense:CreateToggle("AutoDropDolceMilkOptimal_Flag", {Title = "Auto drop dolce milk (optimal)", Default = false})
AutoDropDolceMilkOptimal:OnChanged(function(bool)
	auto_drop_dolce_optimal_en = bool
	while auto_drop_dolce_optimal_en do
		drop_things_optimized("Dolce Milk")
		task.wait()
	end
end)

local AutoGrabDolceMilkFast = Tabs.Defense:CreateToggle("AutoGrabDolceMilkFast_Flag", {Title = "Auto grab dolce milk (fast, laggy)", Default = false})
AutoGrabDolceMilkFast:OnChanged(function(bool)
	auto_grab_dolce_fast_en = bool
	grab_things_fast("Dolce Milk")
end)

local AutoGrabDolceMilkOptimal = Tabs.Defense:CreateToggle("AutoGrabDolceMilkOptimal_Flag", {Title = "Auto grab dolce milk (optimal)", Default = false})
AutoGrabDolceMilkOptimal:OnChanged(function(bool)
	auto_grab_dolce_optimal_en = bool
	grab_things_optimal("Dolce Milk")
end)

local AutoHideDolceMilk = Tabs.Defense:CreateToggle("AutoHideDolceMilk_Flag", {Title = "Auto hide dolce milk", Default = false})
AutoHideDolceMilk:OnChanged(function(bool)
	auto_hide_dolce_en = bool
	hide_things("Dolce Milk")
end)

local AutoFarmDolceMilk = Tabs.Defense:CreateToggle("AutoFarmDolceMilk_Flag", {Title = "Auto farm dolce milk", Default = false})
AutoFarmDolceMilk:OnChanged(function(bool)
	farm_dolce_en = bool
	farm_things("Dolce Milk")
end)

local AntiAFK = Tabs.Defense:CreateToggle("AntiAFK_Flag", {Title = "Anti AFK", Default = false})
AntiAFK:OnChanged(function(bool)
	if bool then
		anti_afk_en = plr.Idled:Connect(function()
			virtual_user:CaptureController()
			virtual_user:ClickButton2(Vector2.new())
		end)
	else
		if anti_afk_en ~= nil then
			anti_afk_en:Disconnect()
		end
	end
end)

-- player tab
local WSSlider = Tabs.Character:CreateSlider("WSSlider_Flag", {
	Title = "Speed",
	Description = "",
	Default = plr.Character.Humanoid.WalkSpeed,
	Min = 0,
	Max = 200,
	Rounding = 1,
	Callback = function(value)
		update_walk_speed(value)
	end
})

local WSInput = Tabs.Character:CreateInput("WSInput_Flag", {
	Title = "Speed",
	Default = "",
	Placeholder = "input",
	Numeric = true,
	Finished = true,
	Callback = function(value)
		WSSlider:SetValue(value)
	end
})

local JPSlider = Tabs.Character:CreateSlider("JPSlider_Flag", {
	Title = "Jump power",
	Description = "",
	Default = plr.Character.Humanoid.JumpPower,
	Min = 0,
	Max = 500,
	Rounding = 1,
	Callback = function(value)
		update_jump_power(value)
	end
})

local JPInput = Tabs.Character:CreateInput("JPInput_Flag", {
	Title = "Jump power",
	Default = "",
	Placeholder = "input",
	Numeric = true,
	Finished = true,
	Callback = function(value)
		JPSlider:SetValue(value)
	end
})

local inf_jump = Tabs.Character:CreateToggle("inf_jump_Flag", {Title = "Infinite jumps", Default = false})
inf_jump:OnChanged(function(bool)
	inf_jump_en = bool
	user_input_service.JumpRequest:Connect(function()
		if inf_jump_en then plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
	end)
end)

local platformStand = Tabs.Character:CreateToggle("platformStand_Flag", {Title = "platform stand", Default = false})
platformStand:OnChanged(function(bool)
	plr.Character.Humanoid.PlatformStand = bool
end)

local GravSlider = Tabs.Character:CreateSlider("GravSlider_Flag", {
	Title = "Gravity",
	Description = "",
	Default = workspace.Gravity,
	Min = 0,
	Max = 1000,
	Rounding = 2,
	Callback = function(value)
		update_gravity(value)
	end
})

local GravInput = Tabs.Character:CreateInput("GravInput_Flag", {
	Title = "Set gravity",
	Default = "",
	Placeholder = "input",
	Numeric = true,
	Finished = true,
	Callback = function(value)
		GravSlider:SetValue(value)
	end
})

local FOVSlider = Tabs.Character:CreateSlider("FOVSlider_Flag", {
	Title = "Field of view",
	Description = "",
	Default = cam.FieldOfView,
	Min = 1,
	Max = 120,
	Rounding = 1,
	Callback = function(value)
		update_field_of_view(value)
	end
})

local FOVInput = Tabs.Character:CreateInput("FOVInput_Flag", {
	Title = "Set field of view",
	Default = "",
	Placeholder = "input",
	Numeric = true,
	Finished = true,
	Callback = function(value)
		FOVSlider:SetValue(value)
	end
})

-- script tab
Tabs.Scripts:CreateButton{
	Title = "Infinite Yield REBORN",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/alajayid/infiniteyield-reborn-reborn/master/source"))()
	end
}

Tabs.Scripts:CreateButton{
	Title = "System Broken",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
	end
}

Tabs.Scripts:CreateButton{
	Title = "Dex (PC)",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
	end
}

Tabs.Scripts:CreateButton{
	Title = "Dex (Mobile)",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
	end
}

Tabs.Scripts:CreateButton{
	Title = "Path & Float",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/m1kp0/universal_scripts/refs/heads/main/ONLY-PC_pathing"))()
	end
}

Tabs.Scripts:CreateButton{
	Title = "Jerk off R6",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
	end
}

Tabs.Scripts:CreateButton{
	Title = "Отдельный chat bypass",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/m1kp0/universal_scripts/refs/heads/main/chat_bypass.lua')()
	end
}

Tabs.Scripts:CreateButton{
	Title = "Fake lagg",
	Description = "",
	Callback = function()
		loadstring(game:HttpGet'https://raw.githubusercontent.com/m1kp0/universal_scripts/refs/heads/main/fake_lagg.lua')()
	end
}

-- clocktime tab
Tabs.ClockTime:CreateButton{
	Title = "Night",
	Description = "",
	Callback = function()
		update_clocktime(0)
	end
}

Tabs.ClockTime:CreateButton{
	Title = "Day",
	Description = "",
	Callback = function()
		update_clocktime(10)
	end
}

Tabs.ClockTime:CreateButton{
	Title = "Evening",
	Description = "",
	Callback = function()
		update_clocktime(18)
	end
}

Tabs.ClockTime:CreateButton{
	Title = "Morning",
	Description = "",
	Callback = function()
		update_clocktime(6)
	end
}

local ClockTimeInput = Tabs.ClockTime:CreateInput("ClockTimeInput_Flag", {
	Title = "Custom clock time",
	Default = "10",
	Placeholder = "Input",
	Numeric = true,
	Finished = true,
	Callback = function(value)
		update_clocktime(value)
	end
})

Tabs.Changelog:CreateParagraph("V6", {
	Title = "кому не похуй на эту вкладку?",
	Content = "негры"
})

Tabs.Server:CreateParagraph("Your", {
	Title = "You",
	Content = ""..plr.DisplayName.." ("..plr.Name..")"
})

local plrspar = Tabs.Server:CreateParagraph("Players", {
	Title = "Players (max. 50)",
	Content = "Current players: "..amount_of_plrs.."\nAll players: "..all_plrs..""
})

plrs.PlayerAdded:Connect(function()
	amount_of_plrs = #plrs:GetPlayers()
	all_plrs = all_plrs + 1
	plrspar:SetValue("Current players: "..amount_of_plrs.."\nAll players: "..all_plrs.."")
end)

plrs.PlayerRemoving:Connect(function()
	amount_of_plrs = #plrs:GetPlayers()
	plrspar:SetValue("Current players: "..amount_of_plrs.."\nAll players: "..all_plrs.."")
end)

-- loaded
notify("LadderBreaker loaded completely", "Version: "..ver.."", 5)
print"[LadderBreaker]: Loaded"
