return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = { { 'filename', path = 1 } }
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1 } }
      }
    },
  },
}
