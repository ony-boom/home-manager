return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)

					-- Actions
					map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
					map("v", "<leader>gr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Reset hunk" })
					map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Un-stage hunk" })
					map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
					map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
					map("n", "<leader>gb", function()
						gitsigns.blame_line({ full = true })
					end, { desc = "Show blame" })
					map("n", "<leader>tgb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
					map("n", "<leader>gd", gitsigns.diffthis)
					map("n", "<leader>gD", function()
						gitsigns.diffthis("~")
					end, { desc = "Show diff" })
					map("n", "<leader>tgd", gitsigns.toggle_deleted, { desc = "Toggle deleted line" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
				end,
			})
		end,
	},
}
