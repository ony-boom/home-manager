require("config.options")

require("config.lazy")

--  vim.opt that need lazy to be loaded first
require("config.options_extra")
require("config.autocommands")
require("config.keymaps")
