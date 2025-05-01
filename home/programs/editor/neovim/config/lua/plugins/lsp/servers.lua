local snippets_capabilities = vim.lsp.protocol.make_client_capabilities()
snippets_capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  lua_ls = {},
  nil_ls = {},
  rust_analyzer = {},
  gopls = {},
  cssls = {
    capabilities = snippets_capabilities,
  },
  astro = {},
  eslint = {},
  svelte = {},
  tailwindcss = {},

  html = {
    capabilities = snippets_capabilities,
  },

  ts_ls = function()
    return {
      root_dir = require("lspconfig").util.root_pattern { "package.json", "tsconfig.json" },
      single_file_support = false,
      settings = {},
    }
  end,

  denols = function()
    return {
      root_dir = require("lspconfig").util.root_pattern { "deno.json", "deno.jsonc" },
      single_file_support = false,
      settings = {},
    }
  end,

  jsonls = function()
    return {
      capabilities = snippets_capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end,
}
