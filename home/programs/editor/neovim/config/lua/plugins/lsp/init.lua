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
      html = {
        capabilities = snippets_capabilities,
      },
      cssls = {
        capabilities = snippets_capabilities,
      },
      astro = {},
      rust_analyzer = {},
      svelte = {},
      tailwindcss = {},
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
    }

    local servers_with_setup = {
      eslint = {},
      denols = {
        root_dir = lspconfig.util.root_pattern { "deno.json", "deno.jsonc" },
      },
      vtsls = {
        root_dir = lspconfig.util.root_pattern "package.json",
        single_file_support = false,
      },
    }

    -- Standard server setup
    for name, config in pairs(servers) do
      if next(config) ~= nil then vim.lsp.config(name, config) end
      vim.lsp.enable(name)
    end

    -- Servers with custom setup
    for name, config in pairs(servers_with_setup) do
      lspconfig[name].setup(config)
    end

    require "plugins.lsp.lsp_attach"
  end,
}
