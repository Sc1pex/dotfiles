local map = vim.keymap.set

map('n', '<c-h>', '<cmd>NvimTmuxNavigateLeft<cr>')
map('n', '<c-j>', '<cmd>NvimTmuxNavigateDown<cr>')
map('n', '<c-k>', '<cmd>NvimTmuxNavigateUp<cr>')
map('n', '<c-l>', '<cmd>NvimTmuxNavigateRight<cr>')

map("n", "<leader>L", "<cmd>tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>H", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
map("n", "<leader>C", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>N", "<cmd>tabnew<CR>", { desc = "New tab" })

-- Smart close buffer without destroying the split window
map("n", "<leader>c", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
  
  if #listed_buffers > 1 then
    vim.cmd("bprevious")
  else
    vim.cmd("enew")
  end
  vim.cmd("bd " .. current_buf)
end, { desc = "Close buffer" })

map('n', '<leader>w', ':silent w<cr>')
map('n', '<leader>W', ':silent noa w<cr>')

map('n', '\\', '<cmd>vsplit<cr>')
map('n', '|', '<cmd>split<cr>')

local FzfLua = require 'fzf-lua'
-- Hijack Neovim's default UI menus (like Mason's filter) to use Fzf-lua's beautiful floating interface
FzfLua.register_ui_select()

-- Use Fzf-lua for vastly superior LSP navigation
map('n', 'gd', function() FzfLua.lsp_definitions({ jump1 = true }) end, { desc = "Go to Definition" })
map('n', 'gr', function() FzfLua.lsp_references({ jump1 = true }) end, { desc = "Go to References" })
map('n', 'gi', function() FzfLua.lsp_implementations({ jump1 = true }) end, { desc = "Go to Implementation" })
map('n', '<F4>', function() FzfLua.lsp_code_actions() end, { desc = "Code Actions" })

map('n', '<c-p>', function() FzfLua.files() end)
map('n', '<leader>p', function() FzfLua.files({hidden = true}) end)
map('n', '<leader>/', function() FzfLua.live_grep() end)
map('n', '<leader>b', function() FzfLua.buffers() end)

map("n", "<C-S-Up>", "<cmd>resize +5<CR>", { noremap = true, silent = true })
map("n", "<C-S-Down>", "<cmd>resize -5<CR>", { noremap = true, silent = true })
map("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", { noremap = true, silent = true })
map("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", { noremap = true, silent = true })

map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==")
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv")

map("n", "<A-h>", "^", { silent = true })
map("n", "<A-l>", "$", { silent = true })

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "gl", "$")
map("n", "gh", "^")

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

-- Harpoon
local harpoon = require 'harpoon'
harpoon:setup()

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

require('neogit').setup{}
vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>')

-- Cutlass (Sane Clipboard)
require('cutlass').setup({
  cut_key = 'x',
})

-- Oil.nvim (Dired-like File Explorer)
require("oil").setup({
  -- This transforms Oil from a minimal list into a feature-rich Dired view
  columns = {
    "icon",
  },
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
