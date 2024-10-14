return {
    {
        'neovim/nvim-lspconfig'
    },
    {
        'williamboman/mason.nvim',
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = { "lua_ls" },
        }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    }
}
