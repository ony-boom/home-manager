return {
	"rebelot/heirline.nvim",
	dependencies = { "Zeioth/heirline-components.nvim" },
	opts = function()
		local lib = require("heirline-components.all")
		local utils = require("heirline.utils")

		return {
			tabline = { -- UI upper bar
				-- lib.component.tabline_conditional_padding(),
				lib.component.tabline_buffers({}),
			},
			statuscolumn = { -- UI left column
				init = function(self)
					self.bufnr = vim.api.nvim_get_current_buf()
				end,
				lib.component.foldcolumn(),
				lib.component.numbercolumn({
					padding = { left = 1 },
				}),
				lib.component.signcolumn(),
			} or nil,
			statusline = { -- UI statusbar
				condition = function(args)
					return require("heirline-components.buffer").is_valid(args.buf)
				end,
				hl = { fg = "fg", bg = "bg" },
				lib.component.mode({ mode_text = {} }),
				lib.component.git_branch(),
				lib.component.file_info(),
				lib.component.diagnostics(),
				lib.component.fill(),
				lib.component.lsp(),
				lib.component.nav(),
				-- lib.component.mode({ surround = { separator = "right" } }),
			},
		}
	end,
	config = function(_, opts)
		local heirline = require("heirline")
		local heirline_components = require("heirline-components.all")

		-- Setup
		heirline_components.init.subscribe_to_events()
		heirline.load_colors(heirline_components.hl.get_colors())
		heirline.setup(opts)
	end,
}
