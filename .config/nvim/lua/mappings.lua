-- Tmux navigation
vim.keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')

-- NeoTree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>')

-- Telescope
vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')

-- General
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>c', ':bd<cr>')
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '\\', '<cmd>vsplit<cr>')
vim.keymap.set('n', '|', '<cmd>split<cr>')

-- Neogit
vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>')

-- Session management
vim.keymap.set('n', '<leader>ss', ':SessionManager save_current_session<cr>')
vim.keymap.set('n', '<leader>sl', ':SessionManager load_session<cr>')
vim.keymap.set('n', '<leader>sL', ':SessionManager load_last_session<cr>')
vim.keymap.set('n', '<leader>sd', ':SessionManager delete_session<cr>')

-- UndoTree
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

-- Harpoon
local harpoon = require('harpoon')
vim.keymap.set('n', '<leader>h', function() harpoon:list():add() end)
vim.keymap.set('n', '<leader>`', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)
vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end)
vim.keymap.set('n', '<leader>6', function() harpoon:list():select(6) end)
vim.keymap.set('n', 'L', function() harpoon:list():next() end)
vim.keymap.set('n', 'H', function() harpoon:list():prev() end)
