-- Custom Targets, a table of tables. Messy eh?
--	'keyword' is what comes after prefix. IE: users, admins, yetis
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
					if ply:Team() == 3 then table.insert(t,ply) end
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
					if ply:Team() == 2 then table.insert(t,ply) end
				end
				return t
		end
	}
	------------------
	--Errr, both?--
	------------------
	[6] =
	{
		['keyword'] = '#spectators',
		['gamemode'] = '*',
		['func'] = function()
				local t = {}
				for _ , ply in pairs(player.GetAll()) do
					if GetConVar('gamemode') == 'terrortown' then
						if not ply:IsAlive() then table.insert(t,ply) end
					elseif GetConVar('gamemode') == 'jailbreak' then
						if ply:Team() == TEAM_UNASSIGNED then
							table.insert(t,ply)
						end
					end
				end
				return t
		end
	}
}

