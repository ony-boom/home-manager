local map = require("helpers.vim_api_alias").map

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"smartpde/telescope-recent-files",
		-- "nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					hijack_netrw = true,
				},
			},
		})

		-- Telescope keymaps
		map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		map("n", "<leader>fw", builtin.live_grep, { desc = "Find Words (in files)" })
		map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers (navigate through opened buffers)" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		map("n", "<leader>fo", telescope.extensions.recent_files.pick, { desc = "Find Recent file" })
		-- map("n", "<space>e", ":Telescope file_browser<CR>")

		telescope.load_extension("fzf")
		telescope.load_extension("recent_files")
		-- telescope.load_extension("file_browser")
	end,
}
