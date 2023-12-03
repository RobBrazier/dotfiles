return {
	-- install catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					which_key = true,
					lsp_trouble = true,
					notifier = true,
					notify = true,
					fidget = true,
					noice = true,
					neotree = true,
					mason = true,
					gitsigns = true,
					neotest = true,
				},
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
