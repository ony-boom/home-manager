return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp", "b0o/schemastore.nvim" },
  config = function()
    local lspconfig = require "lspconfig"
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
      nushell = {},
      html = {
        capabilities = snippets_capabilities,
      },
      cssls = {
        capabilities = snippets_capabilities,
      },
      rust_analyzer = {},
      svelte = {},
      emmet_language_server = {},
      jsonls = {
        capabilities = snippets_capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      eslint = {},
      tailwindcss = {},
      denols = {
        root_dir = lspconfig.util.root_pattern { "deno.json", "deno.jsonc" },
      },
      ts_ls = {
        root_dir = lspconfig.util.root_pattern "package.json",
        single_file_support = false,
      },
    }

    -- Servers with custom setup
    for name, config in pairs(servers) do
      lspconfig[name].setup(config)
    end

    require "plugins.lsp.lsp_attach"
  end,
}
