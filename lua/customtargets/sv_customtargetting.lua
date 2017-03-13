local function AdditionalTargetting(targets,ply)
	--We're going to have to manually check any vaildation calls since the hook acts before
	print('Targets='..targets)
	print('Player='..ply)

	if not IsValid(ply) then ply = 'CONSOLE' end
	local targettable = custom_targets
	local specifiedtbl = {}
	for k,v in pairs(targettable) do
		if targets == v.keyword then
			specifiedtbl = k
		end
	end
	--in theory, should override the targets listed and return the value from the function attached to the keyword
	if specifiedtbl ~= nil then return specifiedtbl['func'] end
end

--Called during ULib.getUsers when considering a target string for keywords.  
--This could be used to create a new, custom keyword for targeting users who have been connected for less than five minutes, for example.  
--Return nil or a table of player objects to add to the target list.
hook.Add('ULibGetUsersCustomKeyword','AdditionalCustomTargets',AdditionalTargetting)