local map = require("helpers.vim_api_alias").map

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
		})
		map(
			"n",
			"<leader>e",
			"<CMD>Neotree filesystem toggle<CR>",
			{ silent = true, noremap = true, desc = "Toggle file system (Neotree)" }
		)
	end,
}
