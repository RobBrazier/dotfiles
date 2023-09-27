return {
	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"tsx",
				"typescript",
				"svelte",
				"go",
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				ruff_lsp = {},
				gopls = {},
			},
		},
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
		config = true,
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	},
}
