return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		opts = {},
		config = function()	
			vim.cmd.colorscheme 'catppuccin'
		end,
    	},
	{
		'christoomey/vim-tmux-navigator',
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
    		branch = "v3.x",
    		dependencies = {
      			"nvim-lua/plenary.nvim",
      			"nvim-tree/nvim-web-devicons",
      			"MunifTanjim/nui.nvim",
    		},
		opts = {
			close_if_last_window = true,
			window = {
				width = 25
			}
		}
	}
}
