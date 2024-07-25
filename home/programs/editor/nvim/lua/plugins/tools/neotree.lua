return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set(
			"n",
			"<leader>e",
			"<CMD>Neotree filesystem toggle<CR>",
			{ silent = true, noremap = true, desc = "Toggle file system (Neotree)" }
		)
	end,
}
