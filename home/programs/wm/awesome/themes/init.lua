local utils = require("utils")
local gears = require("gears")
local theme = require("beautiful")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
theme.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")


theme.useless_gap = 8
-- I do not really like having border to windows
theme.border_width = 0
theme.icon_theme = "Colloid-Grey-Everforest"
theme.wallpaper = utils.path_from_home("/Pictures/Wallpapers/japanese_pedestrian_street.png")
