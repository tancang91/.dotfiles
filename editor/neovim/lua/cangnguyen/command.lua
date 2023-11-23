local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight when entering the Insert mode
autocmd("InsertEnter", {
  pattern = "*",
  callback = function() vim.opt.cursorline = true end,
})
autocmd("InsertLeave", {
  pattern = "*",
  callback = function() vim.opt.cursorline = false end,
})
autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
  end,
})

-- Yank hightlight
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 120,
        })
    end,
})

