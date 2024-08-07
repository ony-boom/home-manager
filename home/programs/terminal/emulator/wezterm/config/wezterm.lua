local wezterm = require("wezterm")
-- local keymaps = require("keymaps")

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

config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

-- config.keys = keymaps

config.enable_tab_bar = false
-- config.use_fancy_tab_bar = false
config.audible_bell = "Disabled"
config.window_decorations = "RESIZE"
config.freetype_load_flags = "NO_HINTING"
config.automatically_reload_config = true
config.default_cursor_style = "BlinkingBar"
config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.font = wezterm.font(ui.fonts.jetbrains)

config.color_scheme = ui.themes.everforest.dark_medium
-- config.window_background_opacity = 0.8

return config
