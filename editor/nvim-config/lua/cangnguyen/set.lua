vim.o.encoding = "UTF-8"

vim.o.number = true
vim.o.relativenumber = true

vim.o.list = true
vim.o.listchars = "eol:¬,tab:␉·,trail:·"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.expandtab = true

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.updatetime = 50

vim.o.termguicolors = true
vim.o.signcolumn = "yes"

vim.o.foldmethod = "marker"

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.o.shell = "pwsh.exe"
end

if vim.g.neovide then
    vim.o.guifont = "Hack Nerd Font:h10"
    vim.g.neovide_transparency = 0.99
end
