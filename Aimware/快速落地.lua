local tab = gui.Tab(gui.Reference("Ragebot"), "tab", "πεΏ«ιθ½ε°")
local disable_auto_jump_inair = gui.Checkbox(tab, "Chicken.disable_auto_jump.air", "πε―θ§θε΄εζζδΊΊεη¦η¨θ·³θ·εθ½", false)
local auto_speedburst_in_air = gui.Checkbox(tab, "Chicken.auto_speedburst_in_air.air",
 "πε―θ§θε΄εζζδΊΊεεΏ«ιδ»η©ΊδΈ­θ½ε°", false)

local has_target = false
callbacks.Register("AimbotTarget", function(t)
	has_target = t:GetIndex()
end)

callbacks.Register("CreateMove", function(cmd)
	local in_air_and_target = has_target and bit.band(entities.GetLocalPlayer():GetPropInt("m_fFlags"), 1) == 0
	
	if auto_speedburst_in_air:GetValue() and in_air_and_target then
		cheat.RequestSpeedBurst()
	end
	
	if disable_auto_jump_inair:GetValue() then
		gui.SetValue("misc.autojump", has_target and 0 or 1)
		gui.SetValue("misc.strafe.enable", not has_target)
	end
end)