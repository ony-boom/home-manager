local map = require("helpers.vim_api_alias").map

return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "alejandra" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		})

		map("n", "<leader>lf", conform.format, { desc = "LSP Format buffer" })
	end,
}
