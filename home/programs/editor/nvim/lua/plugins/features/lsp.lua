local map = require("helpers.vim_api_alias").map

return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		-- setup servers
		lspconfig.lua_ls.setup({})
		lspconfig.nil_ls.setup({})

		-- keymaps
		map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
		map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
	end,
}
