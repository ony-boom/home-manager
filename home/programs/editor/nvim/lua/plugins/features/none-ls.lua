return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})

		-- null_ls mappings

		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format buffer" })
	end,
}
