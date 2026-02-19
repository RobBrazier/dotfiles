local add, now = Config.add, Config.now

now(function()
  -- Install only those that you need
  add { source = 'catppuccin/nvim', name = 'catppuccin' }

  require('catppuccin').setup {
    compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
    default_integrations = false,
    auto_integrations = true,
  }

  -- Enable only one
  vim.cmd 'color catppuccin-mocha'
end)
