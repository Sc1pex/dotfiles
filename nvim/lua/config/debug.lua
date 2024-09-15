local dap = require 'dap'
local dapui = require 'dapui'

require('mason-nvim-dap').setup {
    automatic_setup = true,
    handlers = {},
}

dapui.setup()
require("nvim-dap-virtual-text").setup()

vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F9>', dap.step_out)

vim.keymap.set('n', '<leader>du', dapui.toggle)

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

dap.configurations.c = {
    {
        name = "Launch file with args",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        args = function()
            return vim.split(vim.fn.input('Args: '), " ")
        end,

        stopAtEntry = true,
    },
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}
dap.configurations.rust = dap.configurations.c
dap.configurations.cpp = dap.configurations.c
