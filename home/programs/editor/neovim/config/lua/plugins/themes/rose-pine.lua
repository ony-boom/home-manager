return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup {
      styles = {
        bold = true,
        transparency = true,
      },
    }
  end,
}
