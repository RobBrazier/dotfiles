local config = {
  -- service = 'copilot',
  -- service = 'codeium',
  -- service = 'supermaven',
  -- service = 'cody',
  service = 'none',
}

return {
  {
    'Saghen/blink.cmp',
    dependencies = {
      'Saghen/blink.compat',
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
        opts = {
          enable_cmp_source = true,
          virtual_text = {
            enabled = false,
            key_bindings = {
              accept = false,
            },
          },
        },
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
        opts.sources.providers[config.service] = {
          name = config.service,
          score_offset = 100,
          async = true,
          module = 'blink.compat.source',
        }
        table.insert(opts.sources.default, config.service)
      end
      return opts
    end,
  },
}
