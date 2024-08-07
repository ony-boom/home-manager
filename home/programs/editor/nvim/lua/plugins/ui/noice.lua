return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	config = function()
		require("noice").setup({
			lsp = {
				progress = {
					enabled = false,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},

			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},

			views = {
				mini = {
					border = {
						padding = { 0, 1 },
					},
					win_options = {
						winblend = 0,
					},
				},
			},
		})
	end,
}
