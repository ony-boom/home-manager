return {
  "nvim-lualine/lualine.nvim",

  config = function()
    require("lualine").setup {
      options = {
        component_separators = "",
        section_separators = { right = "", left = "" },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "buffers" },
        lualine_c = {},
        lualine_x = { "searchcount" },
        lualine_y = { "diagnostics" },
        lualine_z = { "location" },
      },
    }
  end,
}
