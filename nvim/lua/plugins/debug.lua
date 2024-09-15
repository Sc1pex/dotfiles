return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
  },
  {
    'theHamsta/nvim-dap-virtual-text'
  },
  {
    "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" }
  }
}
