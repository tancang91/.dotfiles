vim.g.mapleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Keep cursor at middle
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Exact search
vim.keymap.set("n", "<leader>/", "/\\<\\><left><left>")

-- Minimize window splits
vim.keymap.set("n", "<C-k>", "<C-W>k<C-W>_")
vim.keymap.set("n", "<C-j>", "<C-W>j<C-W>_")

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- Greate remapping ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set("n", "<esc>", ":noh<CR>")

-- Hightlight, then move up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
