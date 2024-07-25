return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = {
					left = "|",
					right = "|",
				},
				section_separators = {
					left = "",
					right = "",
				},
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "buffers" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},

			extensions = { "neo-tree" },
		})

		vim.g.everforest_better_performance = 1
	end,
}
