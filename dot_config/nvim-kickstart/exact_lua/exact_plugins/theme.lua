return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      transparent_background = false,
      compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
      default_integrations = false,
      auto_integrations = true,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      -- Load the colorscheme here
      vim.cmd.colorscheme 'catppuccin-mocha'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'

      if opts.transparent_background then
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      end
    end,
  },
}
