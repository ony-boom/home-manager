local o = vim.opt

o.number = true
o.relativenumber = true

o.shiftwidth = 2
o.tabstop = 2

o.termguicolors = true
o.fillchars = { eob = ' ' }

o.clipboard:append { 'unnamedplus' }

-- for aligning number
-- o.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '
