local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, _)
	local name = window:active_key_table()
	if name then
		name = " " .. name .. " "
	end
	window:set_right_status(name or "")
end)
