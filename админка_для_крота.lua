local others = game:GetService("Players")
local me = others.LocalPlayer
local storage = game:GetService("ReplicatedStorage")
local chat
local success, err = pcall(function()
   chat = storage.DefaultChatSystemChatEvents.SayMessageRequest
end); if not success then warn(err) end


local cmd = ""
local plr = ""

local in_chat = false
local loop_plr = false
local loop_all = false

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
   local Window = Rayfield:CreateWindow({
      Name = "админка для крота (префикс ставь ;)",
      LoadingTitle = "админка для крота",
      LoadingSubtitle = "префикс должен быть ;",
      ConfigurationSaving = {
         Enabled = true,
         FolderName = nil,
         FileName = "adminka_dla_krota"
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

   local my_tab = Window:CreateTab("Своя команда", 4483362458)
      my_tab:CreateInput({
         Name = "команда",
         PlaceholderText = "",
         RemoveTextAfterFocusLost = false,
         Callback = function(Text)
            cmd = Text
         end,
      })

      local my_sec1 = my_tab:CreateSection("для одного игрока нах")
         my_tab:CreateInput({
            Name = "игрок",
            PlaceholderText = "",
            RemoveTextAfterFocusLost = false,
            Callback = function(Text)
               plr = Text
            end,
         })

         my_tab:CreateToggle({
            Name = "писать команду в чат при исполнении",
            CurrentValue = false,
            Flag = "Toggle1",
            Callback = function(Value)
               in_chat = Value
            end,
         })

         my_tab:CreateButton({
            Name = "юзать команду (1 раз)",
            Callback = function()
               if in_chat then
                  local success, err = pcall(function()
                     chat:FireServer(";"..cmd.." "..plr, "All")
                  end); if not success then warn(err) end
               else
                  others:Chat(";"..cmd.." "..plr)
               end
            end,
         })

         my_tab:CreateToggle({
            Name = "юзать команду (постоянно)",
            CurrentValue = false,
            Flag = "Toggle1",
            Callback = function(Value)
               loop_plr = Value
               while loop_plr and task.wait(.1) do
                  if in_chat then
                     local success, err = pcall(function()
                        chat:FireServer(";"..cmd.." "..plr, "All")
                     end); if not success then warn(err) end
                  else
                     others:Chat(";"..cmd.." "..plr)
                  end
               end
            end,
         })
      local my_sec1 = my_tab:CreateSection("для всех нах")
         my_tab:CreateButton({
            Name = "юзать команду (1 раз)",
            Callback = function()
               for i, v in ipairs(others:GetPlayers()) do
                  if v ~= me then
                     if in_chat then
                        local success, err = pcall(function()
                           chat:FireServer(";"..cmd.." "..v.Name, "All")
                        end); if not success then warn(err) end
                     else
                        others:Chat(";"..cmd.." "..v.Name)
                     end
                  end
               end
            end,
         })

         my_tab:CreateToggle({
            Name = "юзать команду (постоянно)",
            CurrentValue = false,
            Flag = "Toggle1",
            Callback = function(Value)
               loop_all = Value
               while loop_all and task.wait(.1) do
                  for i, v in ipairs(others:GetPlayers()) do
                     if v ~= me then
                        if in_chat then
                           local success, err = pcall(function()
                              chat:FireServer(";"..cmd.." "..v.Name, "All")
                           end); if not success then warn(err) end
                        else
                           others:Chat(";"..cmd.." "..v.Name)
                        end
                     end
                  end
               end
            end,
         })
