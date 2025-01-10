local config = {
  -- service = 'copilot',
  -- service = 'codeium',
  -- service = 'supermaven',
  service = 'none',
}
local blink_config = {
  codeium = {
    kind = 'Codeium',
  },
  copilot = {
    module = 'blink-cmp-copilot',
    kind = 'Copilot',
  },
  supermaven = {
    kind = 'Supermaven',
  },
}

return {
  {
    'Saghen/blink.cmp',
    dependencies = {
      -- Copilot completion
      {
        'giuxtaposition/blink-cmp-copilot',
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
        dependencies = {
          'Saghen/blink.compat',
        },
        enabled = config.service == 'codeium',
        build = ':Codeium Auth',
        opts = {},
      },
      {
        'supermaven-inc/supermaven-nvim',
        dependencies = {
          'Saghen/blink.compat',
        },
        enabled = config.service == 'supermaven',
        opts = {
          disable_inline_completion = true,
          disable_keymaps = true,
        },
      },
    },
    opts = function(_, opts)
      if config.service ~= 'none' then
        local providers = opts.sources.providers
        providers[config.service] = {
          name = config.service,
          async = true,
          module = 'blink.compat.source',
          score_offset = -100,
        }
        if blink_config[config.service] ~= nil then
          providers[config.service] = vim.tbl_extend('force', providers[config.service], blink_config[config.service])
        end
        table.insert(opts.sources.default, config.service)
      end
      return opts
    end,
  },
}
