vim.keymap.set('n', '\\', '<cmd>vsplit<cr>')
vim.keymap.set('n', '|', '<cmd>split<cr>')

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>w', ':w<cr>')

-- Telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<c-p>', require('telescope.builtin').find_files, { desc = 'Search files' })
vim.keymap.set('n', '<c-g>', require('telescope.builtin').git_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find current word' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Find Grep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostics' })

vim.keymap.set('n', '<leader>e', "<cmd>Neotree toggle<cr>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })

-- Buffer navigation and harpoon
vim.keymap.set('n', '<leader>c', ':bd<cr>')
vim.keymap.set('n', '<leader>h', require('harpoon.mark').add_file)
vim.keymap.set('n', '<leader>`', require('harpoon.ui').toggle_quick_menu)
vim.keymap.set('n', '<leader>1', function() require('harpoon.ui').nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() require('harpoon.ui').nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() require('harpoon.ui').nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() require('harpoon.ui').nav_file(4) end)
vim.keymap.set('n', '<leader>5', function() require('harpoon.ui').nav_file(5) end)
vim.keymap.set('n', '<leader>6', function() require('harpoon.ui').nav_file(6) end)
vim.keymap.set('n', '<leader>7', function() require('harpoon.ui').nav_file(7) end)
vim.keymap.set('n', '<leader>8', function() require('harpoon.ui').nav_file(8) end)
vim.keymap.set('n', '<leader>9', function() require('harpoon.ui').nav_file(9) end)
vim.keymap.set('n', 'L', require('harpoon.ui').nav_next)
vim.keymap.set('n', 'H', require('harpoon.ui').nav_prev)

-- Session manager
vim.keymap.set('n', '<leader>ss', ':SessionManager save_current_session<cr>')
vim.keymap.set('n', '<leader>sl', ':SessionManager load_session<cr>')
vim.keymap.set('n', '<leader>sL', ':SessionManager load_last_session<cr>')
vim.keymap.set('n', '<leader>sd', ':SessionManager delete_session<cr>')

-- Undo tree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<cr>')

-- Neogit
vim.keymap.set('n', '<leader>gg', require('neogit').open)

-- Molten
vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>",
    { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>me", ":MoltenEvaluateOperator<CR>",
    { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>",
    { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>",
    { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { silent = true, desc = "evaluate visual selection" })
