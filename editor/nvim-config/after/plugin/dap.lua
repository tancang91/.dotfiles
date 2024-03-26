local dap = require('dap')
local dap_ui = require('dapui')

vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<Leader>dv', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>do', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)


-- {{{ python
local function get_python()
    local python_path = '/usr/bin/python3'
    local virtualenv = vim.fn.getenv('VIRTUAL_ENV')
    if virtualenv ~= vim.NIL and virtualenv ~= '' then
        python_path = virtualenv .. '/bin/python'
    end

    return python_path
end

dap.adapters.python = {
    type = 'executable',
    command = get_python(),
    args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = get_python()
    }
}
-- }}}

dap_ui.setup()
