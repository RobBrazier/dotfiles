return {
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
