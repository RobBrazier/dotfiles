require 'options'
require 'keymaps'
require 'autocmds'

require('custom.lazy').setup({

  -- require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',

  { import = 'custom.plugins' },
}, {
  checker = { enabled = true }, -- automatically check for plugin updates
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
        -- 'tutor',
        'zipPlugin',
      },
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
