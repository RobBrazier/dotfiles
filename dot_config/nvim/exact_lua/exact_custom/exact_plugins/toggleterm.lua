return {
  {
    'akinsho/toggleterm.nvim',
    opts = {},
    config = function(_, opts)
      local toggleterm = require 'toggleterm'
      toggleterm.setup(opts)

      vim.keymap.set('n', '<C-/>', toggleterm.toggle, { desc = 'Toggle Terminal' })
      vim.keymap.set('t', '<C-/>', toggleterm.toggle, { desc = 'Toggle Terminal' })
      -- Windows mappings
      vim.keymap.set('n', '<C-_>', toggleterm.toggle, { desc = 'which_key_ignore' })
      vim.keymap.set('t', '<C-_>', toggleterm.toggle, { desc = 'which_key_ignore' })
    end,
  },
}
