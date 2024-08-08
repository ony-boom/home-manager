local function create_theme(colors, metadata)
	return {
		name = metadata.name,
		colors = function()
			return {
				foreground = colors.foreground,
				background = colors.background,
				cursor_bg = colors.cursor_bg,
				cursor_border = colors.cursor_border,
				cursor_fg = colors.cursor_fg,
				selection_bg = colors.selection_bg or colors.background,
				selection_fg = colors.selection_fg or colors.foreground,

				ansi = colors.ansi,
				brights = colors.brights,

				tab_bar = {
					background = colors.background,
					active_tab = {
						bg_color = colors.brights[1],
						fg_color = colors.foreground,
					},
					inactive_tab = {
						bg_color = colors.background,
						fg_color = colors.foreground,
					},
					inactive_tab_hover = {
						bg_color = colors.brights[1],
						fg_color = colors.foreground,
					},
					new_tab = {
						bg_color = colors.background,
						fg_color = colors.foreground,
					},
					new_tab_hover = {
						bg_color = colors.background,
						fg_color = colors.foreground,
					},
					inactive_tab_edge = colors.cursor_border,
				},
			}
		end,

		window_frame = function(overrides)
			local default = {
				active_titlebar_bg = colors.background,
				inactive_titlebar_bg = colors.background,
			}

			for key, value in pairs(overrides) do
				default[key] = value
			end

			return default
		end,
	}
end

return create_theme
