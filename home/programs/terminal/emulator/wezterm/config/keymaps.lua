local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local function map(mods, key, action)
	return {
		mods = mods,
		key = key,
		action = action,
	}
end

M.keys = {
	map("LEADER|SHIFT", '"', act.SplitVertical({ domain = "CurrentPaneDomain" })),
	map("LEADER|SHIFT", "%", act.SplitHorizontal({ domain = "CurrentPaneDomain" })),
	map("LEADER", "m", act.TogglePaneZoomState),
	map("LEADER", "LeftArrow", act.ActivatePaneDirection("Left")),
	map("LEADER", "RightArrow", act.ActivatePaneDirection("Right")),
	map("LEADER", "UpArrow", act.ActivatePaneDirection("Up")),
	map("LEADER", "DownArrow", act.ActivatePaneDirection("Down")),
	map(
		"LEADER",
		",",
		act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		})
	),
	map(
		"LEADER",
		"r",
		act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		})
	),
}

M.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return M
