local map = require("helpers.vim_api_alias").map

return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				deno_fmt = {
					command = "deno",
					args = { "fmt", "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "alejandra" },
				javascript = { "deno_fmt", "prettierd", "prettier", stop_after_first = true },
				typescript = { "deno_fmt", "prettierd", "prettier", stop_after_first = true },
			},
		})

		map({ "n", "v" }, "<leader>lf", conform.format, { desc = "LSP Format buffer" })
	end,
}
