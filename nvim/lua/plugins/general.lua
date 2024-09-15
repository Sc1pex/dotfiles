return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                custom_highlights = function(colors)
                    return {
                        ['@variable.rust'] = { fg = colors.maroon },
                    }
                end,
            }

            vim.cmd.colorscheme 'catppuccin'
        end,
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            scope = {
                enabled = false,
            },
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- TODO: change mapping
    {
        'numToStr/Comment.nvim',
        opts = {},
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}, -- this is equalent to setup({}) function
    },

    { 'Shatur/neovim-session-manager' },
    { 'windwp/nvim-ts-autotag' },

    { 'mbbill/undotree' },

    {
        'ThePrimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },

    {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end,
    }
}
