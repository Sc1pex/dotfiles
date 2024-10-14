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
