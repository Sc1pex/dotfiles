return {
    {
        'neovim/nvim-lspconfig'
    },
    {
        'williamboman/mason.nvim',
        config = true
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
        config = true
    }
}
