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
		local telescope = require("telescope.builtin") -- use telescope picker
		map("n", "gd", telescope.lsp_definitions, { desc = "Go to Definition" })
		map("n", "gr", telescope.lsp_references, { desc = "Go to References" })
		map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
		map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename current symbol" })
		map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
		map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
	end,
}
