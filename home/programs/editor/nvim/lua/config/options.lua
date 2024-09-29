local o = vim.opt

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

o.number = true
o.relativenumber = true

-- o.cursorline = true

o.tabstop = 2
o.shiftwidth = 2
vim.o.expandtab = true

o.termguicolors = true
o.fillchars = { eob = " " }

o.clipboard = "unnamedplus"

-- clear highlght on pressing <Esc>
o.hlsearch = true
o.pumheight = 20
o.undofile = true
