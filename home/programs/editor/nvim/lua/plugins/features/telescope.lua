local map = require("helpers.vim_api_alias").map

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			-- Telescope keymaps
			map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			map("n", "<leader>fw", builtin.live_grep, { desc = "Find Words (in files)" })
			map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers (navigate through opened buffers)" })
			map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
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
