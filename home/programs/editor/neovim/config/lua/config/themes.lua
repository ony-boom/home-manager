local list = {
  catppuccin = "catppuccin",
  gruvbox = "gruvbox-material",
  rosepine = "rose-pine",
}

local get_default_theme = function() return list.rosepine end

return { list = list, get_default = get_default_theme }
