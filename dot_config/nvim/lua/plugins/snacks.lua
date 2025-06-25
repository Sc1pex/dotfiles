return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('snacks').setup {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        indent = {
          enabled = true,
          scope = {
            enabled = false,
          },
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
      }
    end,
  },
}
