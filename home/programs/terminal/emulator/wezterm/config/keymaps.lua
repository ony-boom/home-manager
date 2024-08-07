local wezterm = require("wezterm")

local function map(mods, key, action)
	return {
		mods = mods,
		key = key,
		action = action,
	}
end

return {
	map("LEADER|SHIFT", '"', wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })),
	map("LEADER|SHIFT", "%", wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })),
	map("LEADER", "m", wezterm.action.TogglePaneZoomState),
}
