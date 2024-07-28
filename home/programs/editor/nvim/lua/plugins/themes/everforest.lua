return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_better_performance = 1
			vim.g.everforest_transparent_background = 2
			vim.g.everforest_float_style = "dim"

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
	},
}
