-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Save session on exit
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = config_group,
  callback = function()
    if vim.bo.filetype ~= 'git'
        and not vim.bo.filetype ~= 'gitcommit'
        and not vim.bo.filetype ~= 'gitrebase'
    then
      session_manager.save_current_session()
    end
  end
})
