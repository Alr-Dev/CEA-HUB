local starterplayerservice = gameGetService('StarterPlayer')
local startercharacter = starterplayerservice.StarterCharacterScripts
local ServerScriptService = gameGetService('ServerScriptService')
local find1 = startercharacterFindFirstChildWhichIsA('LocalScript')

if find1 then
	find1.Enabled = false -- Directly disable find1 if it exists.
	print('Anti-Cheat was successfully bypassed.')
else
	print('Anti-Cheat is not bypassed.')
end

local find3 = ServerScriptServiceFindFirstChildWhichIsA('Script')

-- Corrected logical OR conditions.
if find3 and (find3.Name == 'Anti-Cheat' or find3.Name == 'Anti-Script' or find3.Name == 'Anti-Hack' or find3.Name == 'Anti-Client' or find3.Name == 'Anti-Exploit') then
	find3.Enabled = false
	local find4 = gameGetService('ReplicatedStorage')FindFirstChildWhichIsA('RemoteEvent')

	-- Corrected logical OR conditions and added check for existence of find4.
	if find4 and (find4.Name == 'Anti-Exploit' or find4.Name == 'Anti-Script') then
		find4Destroy()
	else
		print('Anti-Exploit is not bypassed.')
	end
end

local HeadSize = 5
local IsDisabled = true
local IsTeamCheckEnabled = true

gameGetService('RunService').RenderSteppedConnect(function()
	if IsDisabled then
		local localPlayer = gameGetService('Players').LocalPlayer
		if not localPlayer then return end

		local localPlayerTeam = localPlayer.Team

		for _, player in ipairs(gameGetService('Players')GetPlayers()) do
			if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
				local humanoidRootPart = player.Character and player.CharacterFindFirstChild(HumanoidRootPart)
				if humanoidRootPart then
					humanoidRootPart.Size = Vector3.new(HeadSize, HeadSize, HeadSize)
					humanoidRootPart.Transparency = 0
					humanoidRootPart.BrickColor = BrickColor.new(Really blue)
					humanoidRootPart.Material = Enum.Material.Neon
					humanoidRootPart.CanCollide = false
				end
			end
		end
	end
end)
