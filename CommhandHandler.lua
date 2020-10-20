--[[

Cool for handling functions or commands.


Written by greatgamer59


Example use: 

local CommandModule = require(script.Parent.CommandHandler) -- Where you put the module

game.Players.PlayerAdded:Connect(function(player)
player.Chatted:Connect(function(message)
-- You can add an admin check before exe
CommandModule:Execute(player, message) -- Magic
end)
end)

--]]


local Commands = {}

local prefix = ":"
local Commandslist = {
	[prefix.."Example"] = {
        ["Desc"] = "Description",
        ["Aliases"] = {"ex","e"},
        ["Exe"] = function(player, message)
        
        end
    }
}

function Commands:Execute(player, message)
	if not player or not message then 
		return false
	else
		local Arguments = string.split(message, " ")
		local Command = Arguments[1]
		
		
		if Commandslist[string.lower(Command)] then
			
			Commandslist[Command].Exe(player, message)
		else
			for i,v in pairs(Commandslist) do
				for i2,v2 in pairs(v.Aliases) do
					if prefix..v2 == Command then
						v.Exe(player, message)
						break
					end
				end
			end
		end
		
		
	end
	
end

function Commands:AddCmd(cmdname, desc)
	
	
		Commandslist[cmdname] = {
		["Desc"] = "Added Command. "..desc,
		["Aliases"] = {},
	    ["Exe"] = function(player, message)
				player:Kick("You tested it out!")
			end
	}
	return true
end

function Commands:RemoveCmd(cmdname)
	if Commandslist[prefix..tostring(cmdname)] then
		Commandslist[prefix..tostring(cmdname)] = nil
		return true
	else
		return false
	end
end

function Commands:GetCommands()
	return Commandslist
end


return Commands
