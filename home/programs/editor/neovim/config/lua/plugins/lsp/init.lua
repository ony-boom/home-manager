return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp", "b0o/schemastore.nvim" },

  config = function()
    local snippets_capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    }

    local servers = {
      lua_ls = {},
      nil_ls = {},
      gopls = {},
      html = {
        capabilities = snippets_capabilities,
      },
      cssls = {
        capabilities = snippets_capabilities,
      },
      astro = {},
      rust_analyzer = {},
      eslint = {},
      svelte = {},
      tailwindcss = {},
      emmet_language_server = {},
      vtsls = {},
      denols = {},
      jsonls = {
        capabilities = snippets_capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
    }

    for name, config in pairs(servers) do
      if next(config) ~= nil then vim.lsp.config(name, config) end
      vim.lsp.enable(name)
    end

    require "plugins.lsp.lsp_attach"
  end,
}
