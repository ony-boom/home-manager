local map = require("helpers.vim_api_alias").map

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"smartpde/telescope-recent-files",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.load_extension("ui-select")
		telescope.load_extension("recent_files")

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		-- Telescope keymaps
		map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		map("n", "<leader>fw", builtin.live_grep, { desc = "Find Words (in files)" })
		map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers (navigate through opened buffers)" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		map("n", "<leader>fo", telescope.extensions.recent_files.pick, { desc = "Find Recent file" })
	end,
}
