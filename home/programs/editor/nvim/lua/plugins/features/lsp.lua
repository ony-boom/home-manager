return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		-- setup servers
		lspconfig.lua_ls.setup({})

		-- keymaps
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
	end,
}
