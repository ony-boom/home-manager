return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			italics = true,
			transparent_background_level = 1,

			--[[
            on_highlights = function(hl, palette)
                hl.Float = { fg = palette.fg, bg = palette.bg0 }
                hl.NormalFloat = { fg = palette.fg, bg = palette.bg0 }
                hl.FloatBorder = { fg = palette.fg, bg = palette.none }
            end,
      --	]]
		})

		local winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:TelescopeSelection,Search:None"
		require("cmp").setup({
			window = {
				completion = {
					winhighlight = winhighlight,
				},
				documentation = {
					winhighlight = winhighlight,
				},
			},
		})
	end,
}
