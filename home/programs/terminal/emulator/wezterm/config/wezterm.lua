require("events")
local wezterm = require("wezterm")
local keymaps = require("keymaps")
local helpers = require("helpers")

local config = wezterm.config_builder()

local ui = {
	fonts = {
		jetbrains = "JetBrainsMono Nerd Font",
		cascadia = "CaskaydiaCove Nerd Font",
		zed = "ZedMono Nerd Font",
		iosevka = "Iosevka Matsuri Term"
	},
	themes = {
		everforest = {
			dark_medium = {
				isCustom = true,
				name = "Everforest Dark (Medium)",
				path = "everforest-dark-medium.toml",
			},
		},
	},
}

local current_theme = ui.themes.everforest.dark_medium
local current_font = ui.fonts.iosevka

if current_theme.isCustom then
	local colors, metadata = wezterm.color.load_scheme(
		wezterm.home_dir .. "/.config/wezterm/colors/" .. ui.themes.everforest.dark_medium.path
	)
	local theme = helpers.create_theme(colors, metadata)

	config.colors = theme.colors()
	config.window_frame = theme.window_frame({
		font_size = 12,
		font = wezterm.font(current_font .. " Mono"),
	})
else
	config.color_scheme = current_theme.name
end

config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

config.keys = keymaps.keys
config.key_tables = keymaps.key_tables

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.audible_bell = "Disabled"
config.window_decorations = "RESIZE"
config.font = wezterm.font(current_font)
config.freetype_load_flags = "NO_HINTING"
config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingBar"
config.show_new_tab_button_in_tab_bar = false

config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 1,
}

return config
