local o = vim.opt

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

o.number = true
o.relativenumber = true

-- o.cursorline = true

o.shiftwidth = 2
o.tabstop = 2

o.termguicolors = true
o.fillchars = { eob = " " }

o.clipboard = "unnamedplus"

-- clear highlght on pressing <Esc>
o.hlsearch = true
o.pumheight = 20
