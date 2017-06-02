local rankid = 15 -- Set by default to CC Trainee+. change this to the rank you would like to allow
local cmdrankid = 230
-- Do not change anything after here
local stafflock = true

function rankset(msg)
	local rankid = tonumber(string.sub(msg, 20))
end

game:GetService('Players').PlayerAdded:connect(function(plr)
	if plr:GetRankInGroup(2757464) <= rankid then
		if stafflock == true then
			plr:Kick('This server is only open to staff members and selected other ranks.')
		end
	elseif plr:GetRankInGroup(2757464) <= cmdrankid then
		plr.Chatted:connect(function(msg)
			if msg == ':stafflock off' then
				stafflock = false
			elseif msg == ':stafflock on' then
				stafflock = true
			elseif string.sub(msg, 1, 19) == ':stafflock rankset ' then
				pcall(rankset, msg)
			end
		end)
	end
end)