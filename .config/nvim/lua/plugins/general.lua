return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {}

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  { 'nvim-tree/nvim-web-devicons' },

  { 'nmac427/guess-indent.nvim', opts = {} },

  { 'christoomey/vim-tmux-navigator' },

  { 'mbbill/undotree' },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },

  { 'folke/neoconf.nvim' },
}
