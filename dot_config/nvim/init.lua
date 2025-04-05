require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

require('custom.lazy').setup({

  require 'kickstart.plugins.debug',

  { import = 'custom.plugins' },
}, {
  checker = { enabled = true }, -- automatically check for plugin updates
  concurrency = jit.os:find 'Windows' and 2 or nil,
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
    ui = {
      icons = {},
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
