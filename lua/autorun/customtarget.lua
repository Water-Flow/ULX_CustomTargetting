if SERVER then
	include('sv_customtargetting.lua')
	include('sh_definitions.lua')
	AddCSLuaFile('sh_definitions.lua')
else
	include('sh_definitions.lua')
end