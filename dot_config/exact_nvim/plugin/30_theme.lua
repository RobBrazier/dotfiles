local add, now = MiniDeps.add, MiniDeps.now

now(function()
  -- Install only those that you need
  add { source = 'catppuccin/nvim', name = 'catppuccin' }

  -- Enable only one
  vim.cmd 'color catppuccin-mocha'
end)
