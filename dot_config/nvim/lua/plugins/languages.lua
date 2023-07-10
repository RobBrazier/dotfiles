return {
	-- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
	-- treesitter, mason and typescript.nvim. So instead of the above, you can use:
	{ import = "lazyvim.plugins.extras.lang.typescript" },

	{ import = "lazyvim.plugins.extras.formatting.prettier" },

	{ import = "lazyvim.plugins.extras.lang.tailwind" },

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"tsx",
				"typescript",
				"svelte",
			})
		end,
	},
}
