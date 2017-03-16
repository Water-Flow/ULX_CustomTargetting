--   Custom Targets
--	'keyword' is what comes after #. IE: users, admins, yetis
--	'gamemode' is what custom target is locked to. So no targetting traitors in jailbreak
--	'func' is the function that dictates what to grab when that prefix+keyword
--	is triggered whether by chat or console.


custom_targets =
{
	------------------
	--Terrortown Shit--
	------------------
	[1] = 
	{
		['keyword'] = '#traitors',
		['gamemode'] = 'terrortown',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(player.GetAll()) do
					if ply:IsTraitor() then table.insert(t,ply) end
				end
				return t
		end
	},
	[2] = 
	{
		['keyword'] = '#innocents',
		['gamemode'] = 'terrortown',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(player.GetAll()) do
					if !ply:IsTraitor() then table.insert(t,ply) end
				end
				return t
		end
	},
	[3] = 
	{
		['keyword'] = '#detectives',
		['gamemode'] = 'terrortown',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(player.GetAll()) do
					if ply:IsDetective() then table.insert(t,ply) end
				end
				return t
		end
	},
	------------------
	--Jailbreak Shit--
	------------------
	[4] =
	{
		['keyword'] = '#guards',
		['gamemode'] = 'jailbreak',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(team.GetPlayers(TEAM_GUARD)) do
					table.insert(t,ply) 
				end
				return t
		end
	},
	[5] =
	{
		['keyword'] = '#prisioners',
		['gamemode'] = 'jailbreak',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(team.GetPlayers(TEAM_PRISONER)) do
					table.insert(t,ply)
				end
				return t
		end
	},
	[6]=
	{
		['keyword'] = '#warden',
		['gamemode'] = 'jailbreak',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(player.GetAll()) do
					if (JB:GetWarden() != nil) and (JB:GetWarden() == ply) then
						table.insert(t,ply)
						break
					end
				end
				return t
		end
	},
	------------------
	--TTT/Jailbreak
	------------------
	[7] =
	{
		['keyword'] = '#spectators',
		['gamemode'] = '*',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(player.GetAll()) do
						if ply:Team() == TEAM_SPEC or ply:Team() == TEAM_SPECTATOR then 
							table.insert(t,ply) 
						end
				end
				return t
		end
	}
}

