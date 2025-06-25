return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },

      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },

  {
    'rcarriga/nvim-notify',
    opts = {
      top_down = false,
    },
  },

  {
    'Wordluc/in-your-face.nvim',
    config = function()
      vim.api.nvim_create_user_command('Try', function()
        local opt = {
          windows = {
            x = vim.fn.winwidth(0) - 128,
            y = 0,
          },
        }
        require('in-your-face').setup(opt)
      end, { bang = true, nargs = '*' })
      vim.api.nvim_create_user_command('DoomFaceKill', function()
        require('in-your-face').close()
      end, { bang = true, nargs = '*' })
    end,
  },
}
