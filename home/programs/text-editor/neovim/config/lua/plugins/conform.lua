return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function() require("conform").format { async = true } end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = function()
    local prettiers = { "prettier", "biome", stop_after_first = true }
    local sh_like = { "shfmt" }

    return {
      formatters_by_ft = {
        zsh = sh_like,
        sh = sh_like,
        lua = { "stylua" },
        nix = { "alejandra" },
        go = { "gofumpt", "goimports" },
        python = { "isort", "black" },
        javascript = prettiers,
        typescript = prettiers,
        javascriptreact = prettiers,
        typescriptreact = prettiers,
        html = prettiers,
        css = prettiers,
        sql = { "sleek" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters = {},
    }
  end,
}
