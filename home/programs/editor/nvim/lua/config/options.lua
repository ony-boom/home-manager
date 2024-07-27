local o = vim.opt

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = ","

o.number = true
o.relativenumber = true

o.shiftwidth = 2
o.tabstop = 2

o.termguicolors = true
o.fillchars = { eob = " " }

o.clipboard:append({ "unnamedplus" })

-- for aligning number
-- o.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '
