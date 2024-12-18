return {
  {
    'akinsho/toggleterm.nvim',
    keys = {
      {
        '<C-/>',
        function()
          require('toggleterm').toggle()
        end,
        mode = { 'n', 't' },
        desc = 'Toggle Terminal',
      },
      {
        '<C-_>',
        function()
          require('toggleterm').toggle()
        end,
        mode = { 'n', 't' },
        desc = 'which_key_ignore',
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
    end,
  },
}
