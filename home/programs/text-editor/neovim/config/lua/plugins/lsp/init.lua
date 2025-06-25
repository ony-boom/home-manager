return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp", "b0o/schemastore.nvim" },
  config = function()
    local lspconfig = require "lspconfig"
    local getServers = require "plugins.lsp.servers"

    -- Servers with custom setup
    for name, config in pairs(getServers()) do
      lspconfig[name].setup(config)
    end

    require "plugins.lsp.lsp_attach"
  end,
}
