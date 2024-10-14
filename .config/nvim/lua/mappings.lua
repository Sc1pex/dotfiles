-- Tmux navigation
vim.keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
vim.keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')

-- NeoTree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>')

-- General
vim.keymap.set('n', '<leader>w', ':w<cr>')

vim.keymap.set('n', '\\', '<cmd>vsplit<cr>')
vim.keymap.set('n', '|', '<cmd>split<cr>')
