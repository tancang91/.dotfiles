vim.g.mapleader = ","

-- Normal mode
vim.keymap.set("n", "<esc>", ":noh<CR><CR>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Insertion mode
vim.keymap.set("i", "jk", "<esc>")
-- Exact search
vim.keymap.set("n", "<leader>/", "/\\<\\><left><left>")
-- Minimize window splits
vim.keymap.set("n", "<C-k>", "<C-W>k<C-W>_")
vim.keymap.set("n", "<C-j>", "<C-W>j<C-W>_")

vim.keymap.set("n", "<A-UP>", ":m-2<CR>")
vim.keymap.set("n", "<A-DOWN>", ":m+1<CR>")
