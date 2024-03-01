local config = {
  -- service = 'copilot',
  service = 'codeium',
}

return {
  {
    'nvim-cmp',
    dependencies = {
      -- Copilot completion
      {
        'zbirenbaum/copilot-cmp',
        opts = {},
        enabled = config.service == 'copilot',
        dependencies = {
          'zbirenbaum/copilot.lua',
          cmd = 'Copilot',
          build = ':Copilot auth',
          opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
          },
        },
      },
      {
        'Exafunction/codeium.nvim',
        enabled = config.service == 'codeium',
        build = ':Codeium Auth',
        opts = {},
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = config.service })
      return opts
    end,
  },
}
