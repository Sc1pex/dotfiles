return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      display = {
        action_palette = {
          provider = 'default',
        },
      },
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
      },
      adapters = {
        http = {
          copilot = function()
            return require('codecompanion.adapters').extend('copilot', {
              schema = {
                model = {
                  default = 'claude-sonnet-4.5',
                },
              },
            })
          end,
        }
      },
      tools = {
        cmd = {
          continue_on_error = true,
          include_stderr = true,
        },
      },
    },
  },

  {
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = false,
          keymap = {
            accept = '<M-e>',
            next = '<M-]>',
            prev = '<M-[>',
            discard = '<M-d>',
          },
        },
      }
    end,
  },
}
