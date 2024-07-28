local map = require("helpers.vim_api_alias").map

return {
	"neovim/nvim-lspconfig",
	config = function()
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- keymaps
		map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
		map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
		map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename current symbol" })
		map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
		map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
	end,
}
