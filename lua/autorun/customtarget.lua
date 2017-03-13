if SERVER then
	include('customtargets/sv_customtargetting.lua')
	include('customtargets/sh_definitions.lua')
	AddCSLuaFile('customtargets/sh_definitions.lua')
else
	include('customtargets/sh_definitions.lua')
end