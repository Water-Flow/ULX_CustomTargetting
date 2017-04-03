local function AdditionalTargetting(targets,ply)

	local specifiedtbl = {}
	for k,v in pairs(custom_targets) do
		if (v.keyword == targets) then
			specifiedtbl = custom_targets[k]
			break
		end
	end

	if not (specifiedtbl == nil) then 
		if specifiedtbl.gamemode == GetConVar('gamemode'):GetString() or  specifiedtbl.gamemode == '*' then
			return specifiedtbl.func() 
		end
	end
	--nothing found, return what ever targets was originally passed into
	return targets
end

hook.Add('ULibGetUsersCustomKeyword','AdditionalCustomTargets',AdditionalTargetting)