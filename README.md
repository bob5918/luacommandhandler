# projectbobsource
Ripped from my current project. Thought you guys may learn from it



Example use in a SCRIPT placed in SERVERSCRIPTSERVICE:

local HttpService = game:GetService("HttpService")
-- If you want to grab auto updating source I suggest you use loadstring or an other alternative like LBI



local AdminModule = loadstring(HttpService:GetAsync("https://raw.githubusercontent.com/bob5918/projectbobsource/master/CommhandHandler.lua"))()


-- Add your commands here

local function KickFunc(player, message)
	local Args = string.split(message, " ")
	if Args[2] then
		if game.Players:FindFirstChild(Args[2]) then
			-- We have a player
			game.Players[Args[2]]:Kick()
		else
			error('Invalid player found')
		end
	else
		-- no player
		error('No player')
	end
end

-- Make sure that the command name has the prefix
AdminModule:AddCmd(":kick","Kicks the specified player", KickFunc) -- Params: Command Name, Command Description, Command Function

game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		AdminModule:Execute(player, message)
	end)
end)
