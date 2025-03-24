return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
      },
    },
  },

  {
    'zbirenbaum/copilot.lua',
    opts = {
      panel = {
        enabled = false,
      },
      suggestions = {
        enabled = false,
      },
    },
  },
}
