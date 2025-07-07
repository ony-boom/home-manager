return function()
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

  return {
    lua_ls = {},
    nil_ls = {},
    gopls = {},
    nushell = {},
    html = {
      capabilities = snippets_capabilities,
    },
    pyright = {},
    biome = {},
    cssls = {
      capabilities = snippets_capabilities,
    },
    sqls = {},
    tinymist = {},
    astro = {},
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
end
