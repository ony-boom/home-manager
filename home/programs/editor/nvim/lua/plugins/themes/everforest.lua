return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			ui_contrast = "high",
			transparent_background_level = 2,
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

		vim.g.everforest_better_performance = 1
	end,
}
