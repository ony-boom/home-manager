return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  lazy = false,

  config = function()
    require("oil").setup {
      columns = {
        "icon",
      },
    }

    vim.keymap.set("n", "-", function() vim.cmd("Oil") end)
  end,
}
