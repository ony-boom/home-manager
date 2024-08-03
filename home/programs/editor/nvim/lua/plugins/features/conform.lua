local map = require("helpers.vim_api_alias").map

return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		local conform_util = require("conform.util")

		local formatters_by_ft = {
			lua = { "stylua" },
			nix = { "alejandra" },
			gleam = { "gleam" },
		}

		local web_stuff_ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json", "jsonc" }

		for _, ft in pairs(web_stuff_ft) do
			formatters_by_ft[ft] = { "deno_fmt", "prettierd", "prettier", stop_after_first = true }
		end

		conform.setup({
			formatters = {
				deno_fmt = {
					command = "deno",
					args = { "fmt", "$FILENAME" },
					stdin = false,
					require_cwd = true,
					cwd = conform_util.root_file({ "deno.jsonc", "deno.json" }),
				},
			},
			formatters_by_ft = formatters_by_ft,
		})

		map({ "n", "v" }, "<leader>lf", conform.format, { desc = "LSP Format buffer" })
	end,
}
