print"[LadderBreaker]: Starting"
game.StarterGui:SetCore("SendNotification", {
    Title = "Loading LadderBreaker",
    Text = "It may take 15-20 seconds",
    Duration = math.huge,
	Callback = bindable_function,
    Button1 = "Ok"
})

-- premium info
local name = game.Players.LocalPlayer.Name
local premium_users = {"Yaros1979", "abororoumn", "LYBLY_COCATb6969", "poedatelxyevnazavt11", "DragonSosu", "Dimooon7323"}
local premium_user = false

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
local ver = "6"
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

-- check premium function
local function check_premium(plr_name)
	for i, premiums in pairs(premium_users) do
		if plr_name == premiums then
			premium_user = true
		end
	end
	return premium_user
end

-- load functions
local function load_dmo()
	-- create window
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
	local Options = Library.Options	-- Options.MyToggle:SetValue(false)
	
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
	
	local AntiKillParts = Tabs.Defense:CreateToggle("AntiKillParts_Flag", {Title = "Anti kill parts", Default = false})
	AntiKillParts:OnChanged(function(bool)
		pcall(function()
			for i, part in pairs(workspace.Damage:GetChildren()) do
				if part:IsA("Part") then
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
		Title = "Drop dolce milk",
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
		Title = "Jerk off R15",
		Description = "",
		Callback = function()
			loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
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
		Title = "Mobile keyboard",
		Description = "",
		Callback = function()
			loadstring(game:HttpGet("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr"))()
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
		Title = "V6 beta changelog",
		Content = "Added:\nFluent ui library (interface),\nauto farm dolce milk,\nauto hide dolce milk,\nauto drop dolce milk (optimal),\nauto drop dolce milk (fast, laggy),\nauto grab dolce milk (optimal),\nauto grab dolce milk (fast, laggy);\nRemoved:\n old ui library;\nm1kp's note:\nXeno юзеры, люблю вас!"
	})
	
	Tabs.Server:CreateParagraph("Your", {
		Title = "You",
		Content = ""..plr.DisplayName.." ("..plr.Name..")",
		TitleAlignment = "Middle",
		ContentAlignment = Enum.TextXAlignment.Center
	})
	
	local plrspar = Tabs.Server:CreateParagraph("Players", {
		Title = "Players (max. 50)",
		Content = "Current players: "..amount_of_plrs.."\nAll players: "..all_plrs..""
	})
	
	local musc = Tabs.Server:CreateToggle("musc_Flag", {Title = "Play", Default = false})
	musc:OnChanged(function(bool)
		play_music = bool
		mus = Instance.new"Sound"
		if play_music then
			mus.SoundId = "rbxassetid://142376088"
			mus.Volume = 0.5
			mus.Looped = true
			mus:Play()
		else
			mus:Stop()
		end
	end)
	
	plrs.PlayerAdded:Connect(function(p)
		amount_of_plrs = #plrs:GetPlayers()
		all_plrs = all_plrs + 1
		plrspar:SetValue("Current players: "..amount_of_plrs.."\nAll players: "..all_plrs.."")
	end)
	
	plrs.PlayerRemoving:Connect(function(p)
		amount_of_plrs = #plrs:GetPlayers()
		plrspar:SetValue("Current players: "..amount_of_plrs.."\nAll players: "..all_plrs.."")
	end)
	
	-- loaded
	notify("LadderBreaker loaded completely", "Version: "..ver.."", 5)
	print"[LadderBreaker]: Loaded"
end

local function load_premium()
	-- create window
	local Window = Library:CreateWindow{
		Title = "LadderBreaker",
		SubTitle = "Premium",
		TabWidth = 160,
		Size = UDim2.fromOffset(1500, 1000),
		Resize = true,
		MinSize = Vector2.new(1500, 1000),
		Acrylic = true,
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.RightControl
	}
	
	-- options
	local Options = Library.Options	-- Options.MyToggle:SetValue(false)
	
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

	local OskSpam = Tabs.Chat:CreateToggle("OskSpam_Flag", {Title = "Спам оск (не генератор)", Default = false})
	OskSpam:OnChanged(function(bool)
		spam_osk = bool
		while spam_osk do
			if osk == 1 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Але пердокрылый хуйла шлюшенская подзалупная хуета", "All")
				task.wait(5)
				osk = 2
			elseif osk == 2 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le уворачивайся от моей запы чернохуеплитический дегенерат", "All")
				task.wait(5)
				osk = 3
			elseif osk == 3 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я ща твоей потаскухе шлюхо матери череп хуем пробью кину тоего батька через реку", "All")
				task.wait(5)
				osk = 4
			elseif osk == 4 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты нищее дегенеративное утребье которое в очко долбил прадед", "All")
				task.wait(5)
				osk = 5
			elseif osk == 5 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le давай нахуй отцов пересчитывай своих я уже заебался слишком мало человек тя там долбит", "All")
				task.wait(5)
				osk = 6
			elseif osk == 6 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le хуесос патлатый чо ты там плачешь в хуй раб ща твоей маме гнилозубой 3 оставшиеся зуба выбью", "All")
				task.wait(5)
				osk = 7
			elseif osk == 7 and spam_osk then
				say_msg_request:FireServer("ты фрик ебаный под напором моей спермы из мармелада превратился в черную поганду", "All")
				task.wait(5)
				osk = 8
			elseif osk == 8 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le але мудоногий вафлепидешь ты сын пробляди тухлодырой просто копроеб низкорослый я же кончу твоей мамаше на могилу", "All")
				task.wait(5)
				osk = 9
			elseif osk == 9 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le там толпа ебет твоего батька за котлету он там полудохлый уже лежит", "All")
				task.wait(5)
				osk = 10
			elseif osk == 10 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le твоя бабка колясочница блядная мне минет за пачку сухариков 3 месяца делала она здохла быстрее чем я предполагал не успела сделать мне минет на память", "All")
				task.wait(5)
				osk = 11
			elseif osk == 11 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le але ты же наикопрохуила я же твоего жирного небритого батька смусорки достал после того как он от меня хуем в рыло получал", "All")
				task.wait(5)
				osk = 12
			elseif osk == 12 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Але ты че тут нахуй озверевшея обезьяна тухлодырая пытаешься просраться у меня под ногами", "All")
				task.wait(5)
				osk = 13
			elseif osk == 13 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le тише ты сейчас будешь получать мощные тычки хуем по затылку", "All")
				task.wait(5)
				osk = 14
			elseif osk == 14 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le але имбицильная потаскуха ты сейчас в своем же чемодане с которым ты хотел ко мне приехать полетишь в жерло вулкана", "All")
				task.wait(5)
				osk = 15
			elseif osk == 15 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le сынуля куртизанской шлюхи я те ща рил вены хуем вскрою влечу тебе с 2 ног в ебучку и кричу арррр арррр", "All")
				task.wait(5)
				osk = 16
			elseif osk == 16 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты уже тут смардное еблище на 180 скривил от такого удара", "All")
				task.wait(5)
				osk = 17
			elseif osk == 17 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le сынуля пробляди дырявой какой те хаудинг нахуй сын бляди принимай богоподобный хуй в свой спермоприемник", "All")
				task.wait(5)
				osk = 18
			elseif osk == 18 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le поебированная выблядь тебя в данной конференции уже пустили по кругу", "All")
				task.wait(5)
				osk = 19
			elseif osk == 19 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le гнилозубый вафлепиздешь анука выплюнь яйца изо рта нищее дегенеративное утребье которое в детстве долбил в очко прадед", "All")
				task.wait(5)
				osk = 20
			elseif osk == 20 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le блядохуила шлюхопропиздическая санкционная тайская шлюха я же закапывпю твою мамашу заживо на твоих глазах", "All")
				task.wait(5)
				osk = 21
			elseif osk == 21 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты нищий сын швали подорожной я же твоего батька там пилю лазером еблан его на 2 части распилило так быстро что он не успел мне там помолиться", "All")
				task.wait(5)
				osk = 22
			elseif osk == 22 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le давай ебало подбей сын свиноматки а то я ща те швабру в очко начну сувать", "All")
				task.wait(5)
				osk = 23
			elseif osk == 23 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Блять сука але сын свиноматки ебированной всей калифорнии что ты тут пиздишь", "All")
				task.wait(5)
				osk = 24
			elseif osk == 24 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le сынуля шаболды жирной нахуй давай вылизывай потные яйца своего жирного небритого отчима", "All")
				task.wait(5)
				osk = 25
			elseif osk == 25 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le перхоть подзалупная что ты можешь противопоставить я ща с мексиканским картелем влетаем к те на хату убиваем твою шваль мамашу жирную", "All")
				task.wait(5)
				osk = 26
			elseif osk == 26 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le на ран зе гантлит сняли видео как мы ее потрашили нахуй", "All")
				task.wait(5)
				osk = 27
			elseif osk == 27 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le але скотопиздыц кривозубый сынуля падали тумбоголовой ты знаешь как мой член проскальзывал по анальным тунелям твоей матери", "All")
				task.wait(5)
				osk = 28
			elseif osk == 28 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Че ты там себе начинаешь свечки в анус сувать походу ты страдаешь от собственной не вьебучести", "All")
				task.wait(5)
				osk = 29
			elseif osk == 29 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le отрыжка папиного хуя давай уже втопи ебало вылизывай древнегреческий клитор своей толстой шлюхо матери", "All")
				task.wait(5)
				osk = 30
			elseif osk == 30 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я же те очко разорвпл хуем и спермой залил ты раздулся я тя запустил пинком к тебе в окно", "All")
				task.wait(5)
				osk = 31
			elseif osk == 31 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ослина ебированная у тя семья мои гнилые рабы я же ща в берцах белыми шнурками буду подошвой давить интимную стрижку", "All")
				task.wait(5)
				osk = 32
			elseif osk == 32 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le твоего батька я тя нахуц подвесил как морковку в майнкрафте для свиней проеормил потомство", "All")
				task.wait(5)
				osk = 33
			elseif osk == 33 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le слизывай лечебную сметану с моего хуя собака гнилая ты обычный сперматозоид вытекающий с моей уретры", "All")
				task.wait(5)
				osk = 34
			elseif osk == 34 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le просто признац что ты слаб и я тебя только что отпинал ногами выблядка", "All")
				task.wait(5)
				osk = 35
			elseif osk == 35 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le разрублю тебя пополам нищий сынок полумертвого коня", "All")
				task.wait(5)
				osk = 36
			elseif osk == 36 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le але ебаная патчерица я же ща твой гнилой ебасос по кругу пускать буду", "All")
				task.wait(5)
				osk = 37
			elseif osk == 37 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Тебе мать ебали але в хуй пиши мне бырее", "All")
				task.wait(5)
				osk = 38
			elseif osk == 38 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le свинья ебало подбей у тя батек хач ебливый который твою мохнатую раздробленную пизду своим хуем выпотрошил полностью", "All")
				task.wait(5)
				osk = 39
			elseif osk == 39 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я те сказал ебало закрыла ебаная ротовыебанная обезьяна занимающаяся проституцией на хуе своего гнилозубого хачееба отца", "All")
				task.wait(5)
				osk = 40
			elseif osk == 40 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Дура ебаная ты че на мой хуй рыпаешься тебе же ща все ебало вскрою своим богоподобным членом", "All")
				task.wait(5)
				osk = 41
			elseif osk == 41 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Инфантильная шлюха ебало свое закрой и начни впитывать миллионы фактов в свое продырявленное моим хуем ебало", "All")
				task.wait(5)
				osk = 42
			elseif osk == 42 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Я же тебе щас яйцами все твои глаза выбью дочь куртизанской грязной свиноты жирной 300 килотонн бля", "All")
				task.wait(5)
				osk = 43
			elseif osk == 43 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Але копрофильная лупоглазая блядинка тебе же когда твою шлюхомать на белазе переезжали белаз чуть не утонул в ее пузе она как черная дыра нахуй", "All")
				task.wait(5)
				osk = 44
			elseif osk == 44 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ты че у тя бабку твою пузатую сиротку на колесо камаза намотало и 30 раз переебашило в блендере", "All")
				task.wait(5)
				osk = 45
			elseif osk == 45 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Твой батек спермобак ща пойдет тебе свой фимозный хуек сувать в твою ротовую полость где нет языка он в остался в анале твоего прадеда", "All")
				task.wait(5)
				osk = 46
			elseif osk == 46 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ты че беззубая мусорница я же тебя ща за волосы возьму начну по всему твоему шалашу раскручивать нахуй", "All")
				task.wait(5)
				osk = 47
			elseif osk == 47 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ау хуесосница я ща пойду твой череп испепелять лазером из головки моего хуя", "All")
				task.wait(5)
				osk = 48
			elseif osk == 48 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Потаскуха нахуй за пивом мне метнулась быстро я те этой банкой ща пропасть сделаю в твоем пустом черепе", "All")
				task.wait(5)
				osk = 49
			elseif osk == 49 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ты че бля я ща приду твою матушку вросшую в диван возьму за ебало и начну его выкручивать нахуй", "All")
				task.wait(5)
				osk = 50
			elseif osk == 50 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le паскудница я тебе говорю ща тя просто в землю втоптаю ты там будешь червей жрать выдра ебанутая стремная", "All")
				task.wait(5)
				osk = 51
			elseif osk == 51 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le чета ты сын шлюхи прихуел тут я смотрю может те давно череп не пробивали хуем", "All")
				task.wait(5)
				osk = 52
			elseif osk == 52 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Или я все не как не пойму давай ка я те тута щас скважину вьебу во лбу и ты нахуй будешь туда говнеца принимать покуда во рту места нет", "All")
				task.wait(5)
				osk = 53
			elseif osk == 53 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Закрой там еблище своё идиот ебучий черный сын шлюхи ты куда там убежало с этой конференции в надежде что тебя это спасет или что я не могу толком то понять", "All")
				task.wait(5)
				osk = 54
			elseif osk == 54 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le естественно от тебя ничего не остаётся тут ты поняла нет мышцы напряги свои и начни выдавать отпор какой либо пока тебе пизда тут окончательно не пришла", "All")
				task.wait(5)
				osk = 55
			elseif osk == 55 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le баная нахуйница сидит и терпит пока я его мать хачиху ебашу во все щели с эхом как в онигарском водопаде", "All")
				task.wait(5)
				osk = 56
			elseif osk == 56 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я те тута щас ряд еблище раскрою Ты чё мне тут начинаешь пиздеть дочь шлюхи я же тебя разъебашу мне даже не придется силы тратить", "All")
				task.wait(5)
				osk = 57
			elseif osk == 57 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же ебанутая девчонка которая думает что сможет вывезти меня ты очень сильно ошибаешься", "All")
				task.wait(5)
				osk = 58
			elseif osk == 58 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le a я тебя выебу как нехуй делать и будешь выжимать из себя соки чтобы ответить мне самому богу твоих родителей", "All")
				task.wait(5)
				osk = 59
			elseif osk == 59 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le свои слова которые ты высераешь и понимаешь насколько ты позорище и потом начнёшь мне в лс плакаться извинятся за твои слова и ты будешь думать что приму твои извинения", "All")
				task.wait(5)
				osk = 60
			elseif osk == 60 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le но ты ты ошибаешься так как ты дочь шлюхи которая ебётся каждый раз", "All")
				task.wait(5)
				osk = 61
			elseif osk == 61 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le при рождении она уж ебалась с отчимом которые ебашил в ней струек спермы", "All")
				task.wait(5)
				osk = 62
			elseif osk == 62 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le тут же ты нахуй отлетишь от хуя моего и тебе даже не кто не поможет ты же думаешь что тебе помогут", "All")
				task.wait(5)
				osk = 63
			elseif osk == 63 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же максимум позовешь своих подружек на мой хуй", "All")
				task.wait(5)
				osk = 64
			elseif osk == 64 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le твои подружки подсосы которые в силах отсосать у меня членок и пойти спать в свой сарай где уж бомжы твою мамашу ебашут", "All")
				task.wait(5)
				osk = 65
			elseif osk == 65 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le даже не надо объяснить что я тут сильный а ты слабак которые возомнил себя царем ты такой смешной однако", "All")
				task.wait(4)
				osk = 66
			elseif osk == 66 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le внутри тебя сперма моих дружков давай щас бел глупостей ты отсосешь мне по классике как ты обычно умеешь", "All")
				task.wait(5)
				osk = 67
			elseif osk == 67 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le и я забью на тебя хуй и перестану трогать и ты будешь выгоде и ты всегда будешь радоваться тому моменту когда я свой пенис буду пихать к твоим губам", "All")
				task.wait(5)
				osk = 68
			elseif osk == 68 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le да кстати ты уж сожрал мое говно я тебе дал свой кал жрать а ты его так доел сильно что ты просила добавки ты же даже в жизни не знаешь", "All")
				task.wait(5)
				osk = 69
			elseif osk == 69 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Слушай сюда пиздонаркогейша я же начну тебя ебать по всем фронтам также как твоего хуесоса отца на сво", "All")
				task.wait(5)
				osk = 70
			elseif osk == 70 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же слабая трансуха мне похуй кто ты я тебя ебал слабая дочурка хуеты я же тя об столб заебашил я тя с небоскреба кидал в тя тор молниями ебашил под 100000 вольт", "All")
				task.wait(5)
				osk = 71
			elseif osk == 71 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я тя яйцами душил ты от моего хуя получала удары что ты увидела спутник с которого я твоей матери сперму спустил", "All")
				task.wait(5)
				osk = 72
			elseif osk == 72 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le А ну-ка ты нахуй ебасос хуеплетный я же ща начну пулять тебя в стратосферу ебаный пиздоблядский лохматый чмырь", "All")
				task.wait(5)
				osk = 73
			elseif osk == 73 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le яш щас буду ебашить тебя шваль тухлодырая", "All")
				task.wait(5)
				osk = 74
			elseif osk == 74 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le А ну-ка свой еблет всосала дочура щлюхи я те нахуй все кости вы ломаю наизнанку", "All")
				task.wait(5)
				osk = 75
			elseif osk == 75 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я твоей матери палками по её уродливому лобку ебашил ну ну бля попизди в хуй пиздохуесоска", "All")
				task.wait(5)
				osk = 76
			elseif osk == 76 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Я тя нахуй как рыбу буду вскрывать я тя об тумбу уебал шлюхоподобная свиноте мразота", "All")
				task.wait(5)
				osk = 77
			elseif osk == 77 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я те меч в жопу сувал ща поминутно начну ебать тя ты своим спермоприемником будешь лизать мне хуй хуераспиздяйка у ты блять выродка залупы", "All")
				task.wait(5)
				osk = 78
			elseif osk == 78 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le внутри тебя сперма моих дружков давай щас бел глупостей ты отсосешь мне по классике как ты обычно умеешь", "All")
				task.wait(5)
				osk = 79
			elseif osk == 79 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le и я забью на тебя хуй и перестану трогать и ты будешь выгоде и ты всегда будешь радоваться тому моменту когда я свой пенис буду пихать к твоим губам", "All")
				task.wait(5)
				osk = 80
			elseif osk == 80 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le да кстати ты уж сожрал мое говно я тебе дал свой кал жрать а ты его так доел сильно что ты просила добавки ты же даже в жизни не знаешь", "All")
				task.wait(5)
				osk = 81
			elseif osk == 81 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Слушай сюда пиздонаркогейша я же начну тебя ебать по всем фронтам также как твоего хуесоса отца на сво", "All")
				task.wait(5)
				osk = 82
			elseif osk == 82 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же слабая трансуха мне похуй кто ты я тебя ебал слабая дочурка хуеты я же тя об столб заебашил я тя с небоскреба кидал в тя тор молниями ебашил под 100000 вольт", "All")
				task.wait(5)
				osk = 83
			elseif osk == 83 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я тя яйцами душил ты от моего хуя получала удары что ты увидела спутник с которого я твоей матери сперму спустил", "All")
				task.wait(5)
				osk = 84
			elseif osk == 84 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le А ну-ка ты нахуй ебасос хуеплетный я же ща начну пулять тебя в стратосферу ебаный пиздоблядский лохматый чмырь", "All")
				task.wait(5)
				osk = 85
			elseif osk == 85 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я в тя комочками из спермой пулял ты же слабая подсоска хуя моего ты никому не известная детя шлюхи медленная хуета ща хуем те ебало скрою", "All")
				task.wait(5)
				osk = 86
			elseif osk == 86 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ты еще поклониться моему волшебному дилдаку будешь", "All")
				task.wait(5)
				osk = 87
			elseif osk == 87 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ебаная шлюха щя начну ебать тя камнями по еблету залупой на Марс к Илону Маску запущу он тя выебет пиздохарактерную подзалупную ебаподсоску", "All")
				task.wait(5)
				osk = 88
			elseif osk == 88 and spam_osk then
				say_msg_request:FireServer("Тle le le le le le le le ы же нахуй поеботна блядопиздеща я же нахуй твоего отца заебаширую своими сильными ногами маленькая хуебродопиздатая чмырила, прыщявая залупень", "All")
				task.wait(5)
				osk = 89
			elseif osk == 89 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ты нахуй как мармелад под огнем превратилась в черную поганку от моей спермы ты вместо воды будешь пить мою спермоту", "All")
				task.wait(5)
				osk = 90
			elseif osk == 90 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты детишка алконаркоцигана со своими собутыльниками отсосали хуи по размеру к их гнилозубому рту", "All")
				task.wait(5)
				osk = 91
			elseif osk == 91 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же нахуц пиздец какая слабая и даже не пизди что ты мою мать ебал потому что даже женщина заебашит такую слабую хуетень как ты", "All")
				task.wait(5)
				osk = 92
			elseif osk == 92 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ты де уже от пота выявленным моим хуем задыхаешься ты просто черножопая грязная своей жизнью хуеглотное дерьмо", "All")
				task.wait(5)
				osk = 93
			elseif osk == 93 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le вскройся также как это сделал твой бухой узбек отец на сво", "All")
				task.wait(5)
				osk = 94
			elseif osk == 94 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ну ты же нахуй цель для буллинга все сильнее заглатываешь мой хуй", "All")
				task.wait(5)
				osk = 95
			elseif osk == 95 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я своим металлическим членом достал до твоего желудочного сока но место него там была моя сперма", "All")
				task.wait(3)
				osk = 96
			elseif osk == 96 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le которая появилась из за твоего тупого отца яйцебродного которого заебашить даже букашке не составит особого труда", "All")
				task.wait(5)
				osk = 97
			elseif osk == 97 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я тебе в натуре буду пробивать в твое обосанное ебло каждые 5 секунд потому что я буду доводить тебя до смерти старенькая коза", "All")
				task.wait(5)
				osk = 98
			elseif osk == 98 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Ты же нахуй понимаешь что я буду ебать тебя до смерти без секунды отдыха просто нахуй скажи уже что ты слабость которая насасывает мне хуй", "All")
				task.wait(5)
				osk = 99
			elseif osk == 99 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Такая мразотина яж твою колясочницу бабушку выбросил в окно и она прилетела в твой ничтожный еблет осла ебаного", "All")
				task.wait(5)
				osk = 100
			elseif osk == 100 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ну уже просто втопи свое еблище в могилу твоей матери, твоец матери краном уебали в ебло ты же нахуй не по смеешь даже высрать 1 слово", "All")
				task.wait(5)
				osk = 101
			elseif osk == 101 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le против такого могущественого как я который холодно кровно заебашировал всю твою семью ты же нахуй слабая шлюхидзе скунсиха от которой за километр пахнет моей спермой просто нахуй", "All")
				task.wait(5)
				osk = 102
			elseif osk == 102 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le лузани шалавка ебаная", "All")
				task.wait(5)
				osk = 103
			elseif osk == 103 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Анука але вафлепиздище вафлехуильное анука соси мой обконченный дилдак который выебал в анал твою бездарную шлюшенскую", "All")
				task.wait(5)
				osk = 104
			elseif osk == 104 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le шлюхо мамашу прошмандовку але утребье я щя буду ебашить твою мандохвостого отца камнями по голове я со спутника спущю", "All")
				task.wait(5)
				osk = 105
			elseif osk == 105 and spam_osk then
				say_msg_request:FireServer("тle le le le le le le le ы же сам блядоблядинская проблядная чернохуеплитическая мандорылая чернорылая пиздорылая фуфловое мразеебированная млепопитающая", "All")
				task.wait(5)
				osk = 106
			elseif osk == 106 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le засунь огурец в пизду твоей мертвой бездарной губке матери я же здал эту чушку на мясо комбинат к таким же свиноподобным", "All")
				task.wait(5)
				osk = 107
			elseif osk == 107 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le свинорылым свиньям которые бяли такими же паскуда и прошмандовками как и твоя шлюхидза потаскуха матушка ты знал что я вырезал", "All")
				task.wait(5)
				osk = 108
			elseif osk == 108 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ее древнегреческий клитор выкопанный племеним древних ацтеков ножницами и с моей сперомой скормил твоему козлоссаному ничтожеству блядотворенскуму копрохую жирному небритому отчима", "All")
				task.wait(5)
				osk = 109
			elseif osk == 109 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le он ебет тебя стручком в 3 см всю ночь а ты ахаешь будто увидел как я режу сиськи твоей проблядоблядухе мертвой шаболде атери которая делала мне минет 3 месяца за пачку сухариков с котлетой", "All")
				task.wait(5)
				osk = 110
			elseif osk == 110 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le она будет получать тотальные проблемы от моего члена перейдем на твою старую потаскуху шлюхо бабушку я же ей выбивал ее вставную челусть купленные на последние гроши", "All")
				task.wait(5)
				osk = 111
			elseif osk == 111 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le потому что она такая же мудоногая кривозубая гнилозубая мандохвостная жирная блядуха ей пора в гроб я лично на кончаю ей на могилку поставлю ей там ф как твоей матери", "All")
				task.wait(5)
				osk = 112
			elseif osk == 112 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le хорошая женщина была всегда мне давала как только я попрощу ее спермоприемник уже выглядед как белый экран жаль что они все здохли", "All")
				task.wait(5)
				osk = 113
			elseif osk == 113 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le пока что кроме тебя чушкохуила я же распелю тебя бензопилой пополам а потом выложу как расчлененку я посмотрю как ты будешь хрюкать", "All")
				task.wait(5)
				osk = 114
			elseif osk == 114 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le когда я буду резать тебе твою глотку ты же просто свинорылый козлоссаный свиняра подсоска моего хуя", "All")
				task.wait(5)
				osk = 115
			elseif osk == 115 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же просто хитроебированный сынок жирной мертвой шлюхидзы шлюхоблядиной прошмандоки которую наркоманы хуярили по пузу пока же я говорил", "All")
				task.wait(5)
				osk = 116
			elseif osk == 116 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты уже здох от ебейшего напора моей спермы бездарное утребье ебаный пасынок жирной шаболды", "All")
				task.wait(5)
				osk = 117
			elseif osk == 117 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я же распелю тебя бензопилой пополам а потом выложу как расчлененку я посмотрю как ты будешь хрюкать когда я буду резать тебе", "All")
				task.wait(5)
				osk = 118
			elseif osk == 118 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le твою глотку ты же просто свинорылый козлоссаный свиняра подсоска моего хуя ты же просто хитроебированный сынок жирной мертвой", "All")
				task.wait(5)
				osk = 119
			elseif osk == 119 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le шлюхидзы шлюхоблядиной прошмандоки которую наркоманы хуярили по пузу пока же я говорил ты уже здох от ебейшего напора моей", "All")
				task.wait(5)
				osk = 120
			elseif osk == 120 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le спермы бездарное утребье ебаный пасынок жирной шаболды анука сосо мой член 0 отпора безприемное хуета ложись в гроб", "All")
				task.wait(5)
				osk = 121
			elseif osk == 121 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я буду него кончать как и твоей полоумной шлюхо пиздапроблной бляди матери", "All")
				task.wait(5)
				osk = 122
			elseif osk == 122 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Блядоблятский пиздонутый вафледрон анука соси мой обконченный дилдак суванный в пидзу твоей козлоссущей шлюхо мамаше выебнаая", "All")
				task.wait(5)
				osk = 123
			elseif osk == 123 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le перхотью подзалупной уворачивайся от моей залупы ктребье а то я уебу яйцами те по глазам они у тебя под диван укатяться будешь по всей хате ебало собирать", "All")
				task.wait(5)
				osk = 124
			elseif osk == 124 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Троллинг бедная девочка обиделась на мои факты про тебя у тебя уж пизда задроченая малоимущий умирай уж в муках собака ебливая", "All")
				task.wait(5)
				osk = 125
			elseif osk == 125 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le каждый раз при обстоятельствах будешь у меня под столом мой членок обсасывать и мою сперму в себя принимать ты уж этим заниматься любишь так что приказам моим ты уж всегда готова", "All")
				task.wait(5)
				osk = 126
			elseif osk == 126 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le Максимум высри из своего ротика говнище, я буду хуярить твой текст своим королевским агрегатом, сделаю печать на твой лобешник,", "All")
				task.wait(5)
				osk = 127
			elseif osk == 127 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le там будет написано тупой сынок шлюшенции, ибо ты выписал мне в хуй срутекст своими жирненькими копытцами, ебать ты сынище мутации", "All")
				task.wait(5)
				osk = 128
			elseif osk == 128 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le старался так и влетел в мой хуй,мдаа можно спокойно въебать тебе троический ударок в печень за твою микрообъебануюю деградированную текстовку", "All")
				task.wait(5)
				osk = 129
			elseif osk == 129 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же сыночек шмарообъебки будешь доедать за мной объедки,точнее частицы своей дегролированной матухи спермобанки,", "All")
				task.wait(5)
				osk = 130
			elseif osk == 130 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я в неё столько спермы влил ,что ты просто наешься до отвала будешь пить из своей мамы, а если ослушаешься возьму и сдеру с тебя твою мутированную кожецу,", "All")
				task.wait(5)
				osk = 131
			elseif osk == 131 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le для меня ты всего лишь хуесос высравший из себя мало по малу, ибо твои наделенные деградацией тексты пошли дефать моё ахуенное чтиво,", "All")
				task.wait(5)
				osk = 132
			elseif osk == 132 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le щас же я возьму просто и испепелю твою мать своим хуйцом и разрежу все её микрохуемподорванные частицы деградации,", "All")
				task.wait(5)
				osk = 133
			elseif osk == 133 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же сынок блядусии как заурядный пасынок будешь выдан на обед моему хую,буду ебать твой ротик и кончать в тебя,", "All")
				task.wait(5)
				osk = 134
			elseif osk == 134 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le а ты будешь все это глотать,я сделаю из тебя последнюю шлюшку, хотя в твоей линии есть и дочерние клетки ,я избавлю тебч от них ебанув на тебя тупогорильную чмышку клеймо,", "All")
				task.wait(5)
				osk = 135
			elseif osk == 135 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты же в свою очередь пойдешь на линию отбора ,где и будут ебать твою ничтожномямлющую тушку", "All")
				task.wait(5)
				osk = 136
			elseif osk == 136 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le слышишь рабоблядь ,я расстреляю ноги твоему бати ,возьму его голову и буду ебашить в неё из дробовика ,а после перейду на мать и выбью из неё все свиные кости,", "All")
				task.wait(5)
				osk = 137
			elseif osk == 137 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le а тебя в свою очередь я пропущу через мясорубку и сделаю фаршеподобное изделие , будешь фрикаделькой, буду наслаждаться твоей ничтожной плотью сыночек шлюхематочной продукции", "All")
				task.wait(5)
				osk = 138
			elseif osk == 138 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я твою мамашу ебал дерьмо ебанное быстрее в руки себя взяла козлина ебучая будешь тут мне отсасывать на постоянной основе", "All")
				task.wait(5)
				osk = 139
			elseif osk == 139 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le телочка ебанная я тебе нахуй тут сосалище объебашу кулаками дерьмо ебучее будешь у меня тут на постоянной основе лещей получать", "All")
				task.wait(5)
				osk = 140
			elseif osk == 140 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le теленок ебучий что ты тут пытаешься нахуй я тебе тут один хуй сломаю все сосалище ебанная тряпка", "All")
				task.wait(5)
				osk = 141
			elseif osk == 141 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le молись сколько хочешь тебе никто не поможет осилить мою залупу в этом противостоянии тряпичная мизерная куртизанская банкаброшница", "All")
				task.wait(5)
				osk = 142
			elseif osk == 142 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le что будет тут на постоянной основе получать у меня в рыгалище тварь ебаная я тебе сказал в руки себя щеглина ебанная", "All")
				task.wait(5)
				osk = 143
			elseif osk == 143 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le будешь же тут всеми своими слабыми силами надрачивать мою залупу щегол ебучий я твою мамашу шлюху ебал пошел нахуй отсюда сынуля", "All")
				task.wait(5)
				osk = 144
			elseif osk == 144 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le шалавы ты перекошенный тебе же тут пизды сынку шалавы дадим обоссыв твою глазницу терпила ебанная будешь тут своей черепной коробкой", "All")
				task.wait(5)
				osk = 145
			elseif osk == 145 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le обороняться от моей залупы терпилоид ебучий тебе тут каждый мать ебал что ты тут пытаешься отсосница ебанная я твое ебало нахуй", "All")
				task.wait(5)
				osk = 146
			elseif osk == 146 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le тут вытрахаю кидая его в масленицу терпила ебанная в руки себя взяла и начала мне показывать что ты из себя представляешь терпильная хуесосущая тряпка", "All")
				task.wait(5)
				osk = 147
			elseif osk == 147 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le тут которую я буду кидать тут по пентаграмме мусорщица ебанная я тебе тут нахуй буду кости ломать пока ты будешь здесь истошно орать", "All")
				task.wait(5)
				osk = 148
			elseif osk == 148 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le сын шалавы перекошенный завали свое ебало сынуля шлюхи ебучий тебе же тут один хуй сынку шалавы сломаем все ебало кидая в него харчи и рапиры", "All")
				task.wait(5)
				osk = 149
			elseif osk == 149 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я твою мамашу ебал так что не замедляйся тряпка глупейшая", "All")
				task.wait(5)
				osk = 150
			elseif osk == 150 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я твою мамашу ебал чушак ебучий тебе сказано тут показывать весь свой нулячий скилл в виде своих отсосов девчонка ебучая", "All")
				task.wait(5)
				osk = 151
			elseif osk == 151 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я тебе тут буду на постоянной основе кидать маслянистые харчи в ебалище будешь ими умывать свой говнистый ебальник сын шалавы ебанный", "All")
				task.wait(5)
				osk = 152
			elseif osk == 152 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я твою мамашу ебал попросту что ты мразь ебанная лоускильная хуесоска пытаешься тебе никогда не осилить меня на фантазии", "All")
				task.wait(5)
				osk = 153
			elseif osk == 153 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le просто прими факт того что ты ебанная мразота попросту никогда и никого тут не осилишь", "All")
				task.wait(5)
				osk = 154
			elseif osk == 154 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le что на выдержке что на фантазии кидая мне свою немыслимую трепотню девчонка ебучая я тебе попросту тут сосалище в ошметки превращу чуркабес ебучий", "All")
				task.wait(5)
				osk = 155
			elseif osk == 155 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le будешь тут своими лоускильными текстами выживать тут у меня слышишь телочка ебанная я твою мамашу шалаву ебанную ебу", "All")
				task.wait(5)
				osk = 156
			elseif osk == 156 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le тут в дерьмище превращу один хуй ты тряпка говнистая будешь тут своим упитанным ебалищем набирать залупы в свой зубной состав вместо пломбы", "All")
				task.wait(5)
				osk = 157
			elseif osk == 157 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le телочка ебучая пиздец тебе же сынку падали шаблонизированной тут пиздец слышала телочка ебучая собирай уже все свои силы воедино", "All")
				task.wait(5)
				osk = 158
			elseif osk == 158 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le и показывай мне отсосы в хорошем качестве чтобы я тебя мразоту ебанную тут попросту не начал раскидывать по всем отделам дерьмеца который летит в твое ебалище интуитивно", "All")
				task.wait(5)
				osk = 159
			elseif osk == 159 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le телочка ты ебучая наислабейшая", "All")
				task.wait(5)
				osk = 160
			elseif osk == 160 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты попросту у меня тут будешь высижывать последние свои дни жизни и вкачиваться смотря на мои объемные текста и отсасыват одну громадную залупу", "All")
				task.wait(5)
				osk = 161
			elseif osk == 161 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le чурочка ебучая я тебе тут попросту мать ебал хуесос лоускильный ничтожный ничего из себя не представляющий", "All")
				task.wait(5)
				osk = 162
			elseif osk == 162 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le телочка я тебе говорю не смей даже противиться мне я тебе нахуй ебало все перетрахаю что ты ебанная терпила еще годами в себя прийти не сможешь", "All")
				task.wait(5)
				osk = 163
			elseif osk == 163 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ебанная мразота говорю реще собирай все свои силы в кулак и начинай мне показывать как ты умеешь наяриватьмою залупу своими ебучими сраными культяпками", "All")
				task.wait(5)
				osk = 164
			elseif osk == 164 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le которые я тебе отбил в ходе харкания в ебалище твоей матери шалаве дерьмище ебанное", "All")
				task.wait(5)
				osk = 165
			elseif osk == 165 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты ебучая терпила тебе тут будем на постоянной основе кидать харчки в ебало дабы ты ебанная блевотина понимала что со мной бесполезно конкурировать в чем либо", "All")
				task.wait(5)
				osk = 166
			elseif osk == 166 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ведь твое ебалище гнилое будет постоянно находиться в опасности и страхе ведь моя залупа полностью пронзит и насквозь твою сосальню сынок шлюхи ебучий", "All")
				task.wait(5)
				osk = 167
			elseif osk == 167 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я тебе говорю не отсоси здесь тебе никакие шаблоны тут не помогут знай это терпила ебанная я же буду тебе ебалище переламывать на постоянной основе", "All")
				task.wait(5)
				osk = 168
			elseif osk == 168 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le чуркабес ебучий ты уже сжился с тем фактом что твоя мать шлюха сделает тут мне минет и съебется нахуй пока я буду сокрушать твое ебалище меж галлактики", "All")
				task.wait(5)
				osk = 169
			elseif osk == 169 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ебанная мусорница я тебе говорю не смей тут отсосать шимпанзе ебучее тебе же тут сынку падали все ноги нахуй переломаю за твои попытки отсосать мою залупу на камеру", "All")
				task.wait(5)
				osk = 170
			elseif osk == 170 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le патлатый длиноволоссый скуфурезный тупейший сын рабопидораса ебанного жирного нахуй толстоеблый прыщавый омежный сын шлюхи что гниет понорвстающе на моем елданище", "All")
				task.wait(5)
				osk = 171
			elseif osk == 171 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le встанем вдвоем меж ног твоей матери копро бляди и будем харкать в ее жирноою отраханное жерло будтно она не человек", "All")
				task.wait(5)
				osk = 172
			elseif osk == 172 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le а просто выблядко подобная трипоблядская пиздаеблая полузгнившая дочура черной хуйни хуй держи в зубах своих", "All")
				task.wait(5)
				osk = 173
			elseif osk == 173 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le сыняра ебанной выдры залупу мою чещешь при этом тыкая по клаве клава мой хуй тыкай быстрее дерьмоедливый сынок копроблядиты просто потеха ебаннаянахуй", "All")
				task.wait(5)
				osk = 174
			elseif osk == 174 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le не на что не способная которая ищет тут оправдания сосируя мой богоебский половой агрегат накрозависиый блядотный увалень четопиздит своим сальным непропорциональным еблом", "All")
				task.wait(5)
				osk = 175
			elseif osk == 175 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le пытаевьшсись достигунть своей главной цели в жизни а именно отсосать мой детародный орган качественно и без хуйни я тыою мамашу ебалником", "All")
				task.wait(5)
				osk = 176
			elseif osk == 176 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le не известный сынуля шлюхикоторый сидит врежиметерпилыебучейиполучаетпизды от каждегоя тя слабака ебанного буду хуесосить терпи унижения сын шлюхи", "All")
				task.wait(5)
				osk = 177
			elseif osk == 177 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le я твою мать ебал тебе ноавиься мое мамаебство хуйлуша ебливая я тебе рога сломаю тут за твой базар петух ебаный еблище своё", "All")
				task.wait(5)
				osk = 178
			elseif osk == 178 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le нахуй завали шерсть ебучая чисто я кста в зубы твоей матери с ноги влетал сынише ебанного говна тут нахуй решил моему пенису", "All")
				task.wait(5)
				osk = 179
			elseif osk == 179 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le нахуй сопоставить чото ртом своей жировыебанной свинорылой матухи в итоге ща сосируя мне им нахуй пытаясь душу высосать из моего королевского нахуй волшебного хуя", "All")
				task.wait(5)
				osk = 180
			elseif osk == 180 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le который одним взмахом заставить тебя примкнуть к нему своими ебаными губами и сосировать его ртом мамки твоей ебливой свиноватки", "All")
				task.wait(5)
				osk = 181
			elseif osk == 181 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le в итоге нахуй получив по ебалу и начать судорожно сосать его до потери пулься нахуй", "All")
				task.wait(5)
				osk = 182
			elseif osk == 182 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le пока он тебе нахуй глаза не выбил и тепбе не пришлось мою хуяку нахуй на ощуп искать ебланище ебать тупое ебаная подвальная проблядская хуета", "All")
				task.wait(5)
				osk = 183
			elseif osk == 183 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le чо ты тут на деле може кроме того как сосать мою королевскую хуяку нижняя ветвь развития чото пытается сопоставить мне ртом своей матери", "All")
				task.wait(5)
				osk = 184
			elseif osk == 184 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le пока его отец гоняет мои шары чтоб они ему нахуй вмятину на ебале не оставили тупорылое", "All")
				task.wait(5)
				osk = 185
			elseif osk == 185 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ебать создание я же тебя ща отьебашу нахуй и колени наизнанку выверну хуесос ебливый сосок ебаный я же ща внатуре твою мамашу ебу", "All")
				task.wait(5)
				osk = 186
			elseif osk == 186 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le она пытается убежать от моего хуя чтоб он ее как в прошлый раз залупай по губам не отхуесосил ты тут сынок шлюхи черной", "All")
				task.wait(5)
				osk = 187
			elseif osk == 187 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le чисто рексиш мне на хуй пиздов отхватывал от залцпф моейа ну тяни сюда ебло твоей мамаши ебем ее всей кф сын бляди у твоей", "All")
				task.wait(5)
				osk = 188
			elseif osk == 188 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le матери шлюхи ебаной черепно мозговая от удара залупой рекс ебучий обхарканный бомжами сын шлбхи ты сосешь сдесь сын шлюхи с обконченым еблищем", "All")
				task.wait(5)
				osk = 189
			elseif osk == 189 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ты куда по тапкам там въебал ишак ебучий ты тут будешь страдать каждый день в моем присутствии чуркаш ебучий", "All")
				task.wait(5)
				osk = 190
			elseif osk == 190 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le мать те в бронивике нбал мать те покойницу ебанную хуем пытал заплаканную дочь выдры шпиглик ебанный не боймя меня телка", "All")
				task.wait(5)
				osk = 191
			elseif osk == 191 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le месим твою губастую шлюхомать передай своей матери что она шлюха траханная мною так скажем ты тут щеняра ты ебанная тупо рексик", "All")
				task.wait(5)
				osk = 192
			elseif osk == 192 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ебливый ниначто ниспособный я те мамашу зарежу нахуй копрофильный отсосный сыняра ебанной шельмы я те на рыло срал ничтожный", "All")
				task.wait(5)
				osk = 193
			elseif osk == 193 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le рабопидорас ты сынуля шлюхи ебанной будешь онли по еблу своему маловидному получать удары залупой ты пиздец блядорыльцевый сынуля", "All")
				task.wait(5)
				osk = 194
			elseif osk == 194 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le хуйни не смыслящий ничего в жизни я твою мамашу ебал она брала тут по самые десна ебал твое изнасилованное сосалище харчеглотное", "All")
				task.wait(5)
				osk = 195
			elseif osk == 195 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le поебенное рыльце твое разобью на пазлы нахуй те тельце твое обьебанное сынуля ты черной шлюхи ебало твое мамбетное тут трахать", "All")
				task.wait(5)
				osk = 196
			elseif osk == 196 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le буду косозубая шельма бля блядоуфанатевшая тут моим пенисом дегенеративная говноедливая трущебное сынуля ты потешной говноеблой", "All")
				task.wait(5)
				osk = 197
			elseif osk == 197 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le наездницы моего полового агрегата сынуля ебанной попездливой блядины кринжовая дочь фимозного пастуха рабыня ты ебанная", "All")
				task.wait(5)
				osk = 198
			elseif osk == 198 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le дряблокожая ебанная дочура шлавенции деревнская шлюха твою тупую физиомюномию нахуй тут ебировать буду тумородная ты дите свиньи", "All")
				task.wait(5)
				osk = 199
			elseif osk == 199 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le ебанной ебал те мамашу тут ты сынуля бляди нбанной я те матуху ебал потому что эта блядуха пришла на мусорку набила се брюхо", "All")
				task.wait(5)
				osk = 200
			elseif osk == 200 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le жирное хуями блядскими эту хуесоску драли пятеро бомжей ебанных под забором она давала в пизду свою спидозную за шестнадцать рублей", "All")
				task.wait(5)
				osk = 201
			elseif osk == 201 and spam_osk then
				say_msg_request:FireServer("le le le le le le le le бля в принципе живет ваша радословная хуесосов тем что она сосет грязные елдаки как и ты сыняра шельмы ебанной", "All")
				task.wait(5)
				osk = 1
			end
			task.wait()
		end
	end)
	
	Tabs.Chat:CreateButton{
	Title = "Chat functions",
	Description = "",
	Callback = function()
		load_chat_functions()
		-- сделаю отдельный скрипт с функциями чата
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
		Title = "Премка ебать",
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
end

-- start ladder breaker
if check_premium(name) then
	print"[LadderBreaker]: Loading LadderBreaker Premium"
	load_premium()
else
	print"[LadderBreaker]: Loading LadderBreaker DMO"
	load_dmo()
end
