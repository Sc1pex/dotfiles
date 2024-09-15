require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim' },
  auto_install = true,

  highlight = { enable = true, disable = { "latex" } },
  indent = { enable = true },
  textobjects = {
    -- TODO: Add mappings for more actions
    swap = {
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      enable = true,
    },
  },

  autotag = {
    enable = true
  }
}
