local themes = {
	catppuccin = "catppuccin",
	everforest = "everforest",
	rosepine = "rose-pine"
}
vim.cmd.colorscheme(themes.everforest)

vim.o.showtabline = 2
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])
