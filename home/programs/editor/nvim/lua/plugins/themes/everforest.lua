return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		local everforest = require("everforest")
		everforest.setup({
			ui_contrast = "high",
			transparent_background_level = 2,
			-- on_highlights = function(hl, palette) end,
		})
		vim.g.everforest_better_performance = 1
	end,
}
