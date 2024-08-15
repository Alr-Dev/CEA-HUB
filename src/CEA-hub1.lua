-- Constants
local NOTIFICATION_TIME = 5
local HITBOX_SIZE = Vector3.new(2, 2, 2) -- Ajuste o tamanho da hitbox aqui
local HITBOX_COLOR = Color3.new(1, 0, 0) -- Ajuste a cor da hitbox aqui

-- Services
local StarterPlayer = game:GetService('StarterPlayer')
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

-- Mouse
local mouse = Players.LocalPlayer:GetMouse()

-- Check if StarterCharacterScripts exists
local StarterCharacterService = StarterPlayer:FindFirstChild('StarterCharacterScripts')
if not StarterCharacterService then
	error("StarterCharacterScripts not found")
end

-- Disable anti-cheat script if it exists
if StarterCharacterService:IsA('LocalScript') then
	local antiCheatScript = StarterCharacterService:FindFirstChildWhichIsA('LocalScript')
	if antiCheatScript then
		antiCheatScript.Disabled = true
	else
		print('Anti-Cheat not detected.')
	end
end

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Make notification
OrionLib:MakeNotification({
	Name = "Loading..",
	Content = "Wait the UI load.",
	Image = "rbxassetid://4483345998",
	Time = NOTIFICATION_TIME
})

-- UI
local Window = OrionLib:MakeWindow({Name = "CEA HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "SPJ"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
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

-- Cursor Lock (básico)
local cursorLockEnabled = false
Tab:AddToggle({
	Name = 'Cursor Lock',
	Default = false,
	CallBack = function(value)
		cursorLockEnabled = value
	end
})

-- Cursor Lock logic
UserInputService.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 and cursorLockEnabled then
		local closestPlayer = getClosestPlayer()
		if closestPlayer then
			mouse.Target = closestPlayer.Character:FindFirstChild('Head')
		end
	end
end)

-- Camlock básico
local camLockEnabled = false
Tab:AddToggle({
	Name = 'Camlock',
	Default = false,
	CallBack = function(value)
		camLockEnabled = value
	end
})

-- Camlock logic
game:GetService('RunService').Heartbeat:Connect(function()
	if camLockEnabled then
		local closestPlayer = getClosestPlayer()
		if closestPlayer then
			game.Workspace.CurrentCamera.CameraSubject = closestPlayer.Character:FindFirstChild('Humanoid')
		end
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
