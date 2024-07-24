-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- CTRL+S to save
map("n", "<C-S>", ":update<CR>", { silent = true, desc = "Save" })
