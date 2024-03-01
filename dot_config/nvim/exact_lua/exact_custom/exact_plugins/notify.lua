local theme = require 'config.theme'
return {
  {
    'rcarriga/nvim-notify',
    opts = function(_, opts)
      if theme.transparent == true then
        opts.background_colour = '#000000'
      end
      return opts
    end,
    init = function()
      vim.notify = require 'notify'
    end,
  },
}
