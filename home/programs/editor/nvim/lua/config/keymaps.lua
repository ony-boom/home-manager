local map = require("helpers.vim_api_alias").map

-- CTRL+S to save
map("n", "<C-S>", ":update<CR>", { silent = true, desc = "Save" })

-- buffer
map("n", "<leader>c", ":bd<CR>", { desc = "Close current buffer", silent = true })
map("n", "]b", ":bn<CR>", { desc = "Next buffer", silent = true })
map("n", "[b", ":bp<CR>", { desc = "Previous buffer", silent = true })

-- remap
map("n", "<leader>/", "gcc", { desc = "Toggle comment line", remap = true })
map("x", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Split navigation
map("n", "<C-K>", "<C-w>k", { desc = "Focus window Up" })
map("n", "<C-L>", "<C-w>l", { desc = "Focus window right" })
map("n", "<C-J>", "<C-w>j", { desc = "Focus window down" })
map("n", "<C-H>", "<C-w>h", { desc = "Focus window left" })
map("n", "-", ":Oil<CR>", { desc = "Open parent directory", silent = true })
