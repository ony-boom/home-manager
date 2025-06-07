local list = {
  catppuccin = "catppuccin",
  gruvbox = "gruvbox-material",
}

local get_default_theme = function() return list.gruvbox end

return { list = list, get_default = get_default_theme }
