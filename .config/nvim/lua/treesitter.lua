require('nvim-treesitter').setup()

-- In Neovim 0.12+, Treesitter highlighting is native!
-- This automatically starts it for every file you open.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    -- Disable for huge files to prevent freezing
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stats and stats.size > max_filesize then
      return
    end

    pcall(vim.treesitter.start)
  end,
})