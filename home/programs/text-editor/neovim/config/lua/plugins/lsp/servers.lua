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
    html = { capabilities = snippets_capabilities },
    cssls = {
      capabilities = snippets_capabilities,
    },
    tinymist = {
      settings = {
        formatterMode = "typstyle",
      },
    },
    nimls = {},
    astro = {},
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
