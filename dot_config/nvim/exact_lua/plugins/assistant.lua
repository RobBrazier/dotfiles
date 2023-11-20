return {
	-- {
	-- 	"ExaFunction/codeium.vim",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		-- Change '<C-g>' here to any keycode you like.
	-- 		vim.keymap.set("i", "<C-g>", function()
	-- 			return vim.fn["codeium#Accept"]()
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<c-;>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<c-,>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](-1)
	-- 		end, { expr = true })
	-- 		vim.keymap.set("i", "<c-x>", function()
	-- 			return vim.fn["codeium#Clear"]()
	-- 		end, { expr = true })
	-- 	end,
	-- },
	{
		"github/copilot.vim",
		-- config = function()
		-- 	require("copilot").setup({
		-- 		suggestion = { enabled = false },
		-- 		panel = { enabled = false },
		-- 	})
		-- end,
	},
}
