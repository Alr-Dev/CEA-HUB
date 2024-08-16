-- Chave
local KEY = "%$@121!@!@!SA09çãs1~~~sa;;;z=1@xs/xcca/sz/\\\/\\/llsak2"
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
-- Verificar a chave
local Window2 = OrionLib:MakeWindow({Name = "CEA HUB (Premium) KeyChecker", HidePremium = false, SaveConfig = true, ConfigFolder = "KEY"})
local lol = Window2:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://18964510076",
	PremiumOnly = false
})
lol:AddTextbox({
	Name = "KeyCheck",
	Default = "Key",
	TextDisappear = true,
	Callback = function(Value)
		if Value == KEY then
			OrionLib:MakeNotification({
				Name = "Key Accepted",
				Content = "Key Accepted, CEA HUB Loaded!"
			})
		else
			OrionLib:MakeNotification({
				Name = "Key Error",
				Content = "Key Error, CEA HUB not Loaded!"
			})
		end
	end	  
})

-- O resto do seu script começa aqui
-- Constants
local NOTIFICATION_TIME = 5
local HITBOX_SIZE = Vector3.new(2, 2, 2) -- Ajuste o tamanho da hitbox aqui
local HITBOX_COLOR = Color3.new(1, 0, 0) -- Ajuste a cor da hitbox aqui
local errortime = 15
-- Services
local StarterPlayer = game:GetService('StarterPlayer')
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local ServerScriptService = game:GetService('ServerScriptService')
local StarterCharacterService = game.StarterPlayer.StarterCharacterScripts
-- Mouse
local mouse = Players.LocalPlayer:GetMouse()

-- Check if StarterCharacterScripts exists
local find2 = ServerScriptService:FindFirstChild('Anti-Cheat')
local find3 = ServerScriptService:FindFirstChild('Anti-Hack')
local find4 = ServerScriptService:FindFirstChild('Anti-Exploit')
local find5 = ServerScriptService:FindFirstChild('Anti-Script')
-- Disable anti-cheat script if it exists
if StarterCharacterService:IsA('LocalScript') then
	local antiCheatScript = StarterCharacterService:FindFirstChildWhichIsA('LocalScript')
	if antiCheatScript then
		antiCheatScript.Disabled = true
	else
		print('Anti-Cheat not detected.')
		OrionLib:MakeNotification({
			Name = 'Error Code: 1159, will try other Anti-Cheat bypass..',
			Content = 'Anti-Cheat was not detected, for you secure, CEA Hub will not loaded, pls contatc the developers for fix this error.',
			Image = "rbxassetid://4483345998",
			Time = errortime
		})

		if find2 then
			find2.enabled = false
			OrionLib:MakeNotification({
				Name = 'Anti Cheat bypass sucessfull!',
				Content = 'Anti-Cheat was bypassed.',
				Image = "rbxassetid://4483345998",
				Time = NOTIFICATION_TIME
			})
		else
			print('Bypass not worked.')
			OrionLib:MakeNotification({
				Name = 'Error code: 22610',
				Content = 'For you security, the Script will be not loaded.',
				Image = "rbxassetid://4483345998",
				Time = errortime,
				OrionLib:Destroy()
			})
		end
	end
end
if find3 then
	find3.enabled = false
	OrionLib:MakeNotification({
		Name = 'Anti Cheat bypass sucessfull!',
		Content = 'Anti-Cheat was bypassed.',
		Image = "rbxassetid://4483345998",
		Time = NOTIFICATION_TIME
	})
else
	print('Bypass not worked.')
	OrionLib:MakeNotification({
		Name = 'Error code: 21610',
		Content = 'For you security, the Script will be not loaded.',
		Image = "rbxassetid://4483345998",
		Time = errortime,
		OrionLib:Destroy()
	})
end
if find4 then
	find2.enabled = false
	OrionLib:MakeNotification({
		Name = 'Anti Cheat bypass sucessfull!',
		Content = 'Anti-Cheat was bypassed.',
		Image = "rbxassetid://4483345998",
		Time = NOTIFICATION_TIME
	})
else
	print('Bypass not worked.')
	OrionLib:MakeNotification({
		Name = 'Error code: 30610',
		Content = 'For you security, the Script will be not loaded.',
		Image = "rbxassetid://4483345998",
		Time = errortime,
		OrionLib:Destroy()
	})
end
if find5 then
	find2.enabled = false
	OrionLib:MakeNotification({
		Name = 'Anti Cheat bypass sucessfull!',
		Content = 'Anti-Cheat was bypassed.',
		Image = "rbxassetid://4483345998",
		Time = NOTIFICATION_TIME
	})
else
	print('Bypass not worked.')
	OrionLib:MakeNotification({
		Name = 'Error code: 67610',
		Content = 'For you security, the Script will be not loaded.',
		Image = "rbxassetid://4483345998",
		Time = errortime,
		OrionLib:Destroy()
	})
end

-- Load OrionLib

-- Make notification
OrionLib:MakeNotification({
	Name = "Loading..",
	Content = "Wait the UI load.",
	Image = "rbxassetid://4483345998",
	Time = NOTIFICATION_TIME
})

-- UI
local Window = OrionLib:MakeWindow({Name = "CEA HUB (Premium)", HidePremium = false, SaveConfig = true, ConfigFolder = "SPJ"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://18964510076",
	PremiumOnly = false
})

-- Add toggle for Team Check
local teamCheck = false
Tab:AddToggle({
	Name = 'Team Check',
	Default = false,
	CallBack = function(value)
		teamCheck = value
	end
})

-- Add toggle for ESP
Tab:AddToggle({
	Name = 'ESP',
	Default = false,
	CallBack = function(value)
		for _, player in ipairs(Players:GetPlayers()) do
			if player.Character and (not teamCheck or player.TeamColor ~= Players.LocalPlayer.TeamColor) then
				for _, part in ipairs(player.Character:GetChildren()) do
					if part:IsA('BasePart') then
						part.Transparency = value and 0.5 or 0
					end
				end
			end
		end
	end
})

-- Add toggle for Hitbox
Tab:AddToggle({
	Name = 'Hitbox',
	Default = false,
	CallBack = function(value)
		for _, player in ipairs(Players:GetPlayers()) do
			if player.Character and (not teamCheck or player.TeamColor ~= Players.LocalPlayer.TeamColor) then
				for _, part in ipairs(player.Character:GetChildren()) do
					if part:IsA('BasePart') then
						part.Size = value and HITBOX_SIZE or Vector3.new(1, 1, 1)
						part.BrickColor = BrickColor.new(HITBOX_COLOR)
					end
				end
			end
		end
	end
})

-- Add color picker for Hitbox
Tab:AddColorPicker({
	Name = 'Hitbox Color',
	Default = Color3.new(1, 0, 0),
	CallBack = function(value)
		HITBOX_COLOR = value
		for _, player in ipairs(Players:GetPlayers()) do
			if player.Character and (not teamCheck or player.TeamColor ~= Players.LocalPlayer.TeamColor) then
				for _, part in ipairs(player.Character:GetChildren()) do
					if part:IsA('BasePart') then
						part.BrickColor = BrickColor.new(HITBOX_COLOR)
					end
				end
			end
		end
	end
})

-- Aimbot (melhorado)
local aimbotEnabled = false
Tab:AddToggle({
	Name = 'Aimbot',
	Default = false,
	CallBack = function(value)
		aimbotEnabled = value
	end
})

-- Legit Aimbot
local legitAimbotEnabled = false
Tab:AddToggle({
	Name = 'Legit Aimbot',
	Default = false,
	CallBack = function(value)
		legitAimbotEnabled = value
	end
})

-- Camlock target part
local targetPart = 'Head'
Tab:AddDropdown({
	Name = 'Target Part',
	Options = {'Head', 'Torso', 'HumanoidRootPart'},
	Default = 'Head',
	CallBack = function(value)
		targetPart = value
	end
})

-- Legit Cursor Lock
local legitCursorLockEnabled = false
Tab:AddToggle({
	Name = 'Legit Cursor Lock',
	Default = false,
	CallBack = function(value)
		legitCursorLockEnabled = value
	end
})

-- Aimbot logic
UserInputService.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 and aimbotEnabled then
		local closestPlayer = getClosestPlayer()
		if closestPlayer then
			mouse.Target = closestPlayer.Character:FindFirstChild(targetPart)
		end
	end
end)

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.T then
		legitCursorLockEnabled = not legitCursorLockEnabled
	end
end)

-- Function to get the closest player
function getClosestPlayer()
	local closestPlayer
	local shortestDistance = math.huge
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild('Head') and (not teamCheck or player.TeamColor ~= Players.LocalPlayer.TeamColor) then
			local distance = (Players.LocalPlayer.Character:FindFirstChild('Head').Position - player.Character:FindFirstChild('Head').Position).Magnitude
			if distance < shortestDistance then
				shortestDistance = distance
				closestPlayer = player
			end
		end
	end
	return closestPlayer
end

-- Function to lock cursor to closest player
function lockCursorToClosestPlayer()
	local closestPlayer = getClosestPlayer()
	if closestPlayer then
		mouse.Target = closestPlayer.Character:FindFirstChild(targetPart)
	end
end

-- Lock cursor to closest player when player dies
Players.LocalPlayer.CharacterAdded:Connect(function(character)
	character:WaitForChild('Humanoid').Died:Connect(function()
		if legitCursorLockEnabled then
			lockCursorToClosestPlayer()
		end
	end)
end)
