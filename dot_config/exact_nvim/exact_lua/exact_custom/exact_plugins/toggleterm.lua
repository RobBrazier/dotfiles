return {
  {
    'akinsho/toggleterm.nvim',
    opts = {},
    config = function(_, opts)
      local toggleterm = require 'toggleterm'
      toggleterm.setup(opts)
      local keymaps = {
        { mode = 'n', key = '<leader>tt' },
        { mode = 't', key = '<leader>tt' },
        { mode = 'n', key = '<c-/>' },
        { mode = 't', key = '<c-/>' },
      }

      for _, map in ipairs(keymaps) do
        vim.keymap.set(map.mode, map.key, function()
          toggleterm.toggle()
        end, { desc = 'Toggle Terminal' })
      end
    end,
  },
}
