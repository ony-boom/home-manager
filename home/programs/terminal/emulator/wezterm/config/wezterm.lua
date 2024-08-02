local wezterm = require("wezterm")

local config = wezterm.config_builder()

local ui = {
	fonts = {
		jetbrains = "JetBrainsMono Nerd Font",
		cascadia = "CaskaydiaCove Nerd Font",
		zed = "ZedMono Nerd Font",
	},
	themes = {
		everforest = {
			dark_medium = "Everforest Dark (Medium)",
		},
	},
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.automatically_reload_config = true
config.default_cursor_style = "BlinkingBar"
config.font = wezterm.font(ui.fonts.jetbrains, { weight = "DemiBold" })
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = ui.themes.everforest.dark_medium
-- config.window_background_opacity = 0.8

return config
