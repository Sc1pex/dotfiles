return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('snacks').setup {
        bigfile = { enabled = true },
        indent = {
          enabled = true,
          animate = {
            enabled = false,
          },
          scope = {
            enabled = false,
          },
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true },
      }
    end,
  },
}
