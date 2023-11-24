local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "__pycache__/",
            "node_modules/",
            "bin/",
            "build/",
            "target/",
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close
            }
        }
    }
}
