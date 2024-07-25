return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			-- Telescope keymaps
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find Words (in files)" })
			vim.keymap.set(
				"n",
				"<leader>fb",
				builtin.buffers,
				{ desc = "Find Buffers (navigate through opened buffers)" }
			)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
