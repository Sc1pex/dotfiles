vim.keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')

vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>W', ':noa w<cr>')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>C', ':bd<cr>')

vim.keymap.set('n', '\\', '<cmd>vsplit<cr>')
vim.keymap.set('n', '|', '<cmd>split<cr>')

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

-- Harpoon
local harpoon = require 'harpoon'
vim.keymap.set('n', '<leader>h', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<leader>`', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set('n', '<leader>1', function() end)
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, function()
    harpoon:list():select(i)
  end)
end
vim.keymap.set('n', 'L', function()
  harpoon:list():next { ui_nav_wrap = true }
end)
vim.keymap.set('n', 'H', function()
  harpoon:list():prev { ui_nav_wrap = true }
end)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>')
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>')
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>')
vim.keymap.set('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>')
vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>')
vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>')

vim.keymap.set('n', '<leader>e', MiniFiles.open)

vim.keymap.set('n', '<leader><leader>', Snacks.picker.buffers)
vim.keymap.set('n', '<leader>/', function()
  Snacks.picker.grep {
    hidden = true,
    ignored = true,
  }
end)
vim.keymap.set('n', '<c-p>', Snacks.picker.files)
vim.keymap.set('n', '<a-p>', function()
  Snacks.picker.files {
    hidden = true,
    ignored = true,
  }
end)

vim.keymap.set('n', '<leader>ss', ':SessionManager save_current_session<cr>')
vim.keymap.set('n', '<leader>sl', ':SessionManager load_session<cr>')
vim.keymap.set('n', '<leader>sL', ':SessionManager load_last_session<cr>')
vim.keymap.set('n', '<leader>sd', ':SessionManager delete_session<cr>')

-- Debugging
vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end)
vim.keymap.set('n', '<F11>', function()
  require('dap').step_into()
end)
vim.keymap.set('n', '<F10>', function()
  require('dap').step_over()
end)
vim.keymap.set('n', '<F12>', function()
  require('dap').step_out()
end)
vim.keymap.set('n', '<leader>b', function()
  require('dap').toggle_breakpoint()
end)
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end)

vim.keymap.set('n', '<F7>', function()
  require('dapui').toggle()
end)

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>')
