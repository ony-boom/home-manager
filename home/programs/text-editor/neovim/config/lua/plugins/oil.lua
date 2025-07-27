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

    vim.keymap.set("n", "<leader>e", function() vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil") end)
  end,
}
