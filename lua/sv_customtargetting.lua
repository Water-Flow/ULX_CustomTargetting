local function AdditionalTargetting(targets,ply)
	--We're going to have to manually check any vaildation calls since the hook acts before
	if not IsValid(ply) then ply = 'CONSOLE' end
	local targettable = custom_targets
	local specifiedtbl = {}
	for k,v in pairs(targettable) do
		if string.find(v.keyword,string.Replace(targets,'#','')) then
			specifiedtbl = targettable[k]
			break
		end
	end
	--ulx.fancyLog(ply,"Table: #T",specifiedtbl.func())
	--in theory, should override the targets listed and return the value from the function attached to the keyword
	if specifiedtbl ~= nil then 
		--If the gamemode matches or is '*'
		if specifiedtbl.gamemode == GetConVar('gamemode') or  specifiedtbl.gamemode == '*' then
			return specifiedtbl.func() 
		end
	end
end

--Called during ULib.getUsers when considering a target string for keywords.  
--This could be used to create a new, custom keyword for targeting users who have been connected for less than five minutes, for example.  
--Return nil or a table of player objects to add to the target list.
hook.Add('ULibGetUsersCustomKeyword','AdditionalCustomTargets',AdditionalTargetting)