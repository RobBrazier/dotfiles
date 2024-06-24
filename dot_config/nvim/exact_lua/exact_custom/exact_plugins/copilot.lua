local config = {
  -- service = 'copilot',
  -- service = 'codeium',
  service = 'supermaven',
  -- service = 'cody',
  -- service = 'none',
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
      {
        'supermaven-inc/supermaven-nvim',
        enabled = config.service == 'supermaven',
        opts = {
          disable_inline_completion = true,
          disable_keymaps = true,
        },
      },
      {
        'sourcegraph/sg.nvim',
        enabled = config.service == 'cody',
        opts = {},
      },
    },
    opts = function(_, opts)
      if config.service ~= 'none' then
        table.insert(opts.sources, { name = config.service, priority = 100 })
      end
      return opts
    end,
  },
}
