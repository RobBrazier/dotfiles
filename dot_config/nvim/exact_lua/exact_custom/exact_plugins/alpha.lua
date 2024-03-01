return {
  {
    'goolord/alpha-nvim',
    config = function()
      local dashboard = require 'alpha.themes.dashboard'
      local logo = {
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                                    ]],
      }
      dashboard.section.header.val = logo
      dashboard.section.buttons.val = {
        dashboard.button('f', ' ' .. ' Find file', '<cmd> Telescope find_files <cr>'),
        dashboard.button('n', ' ' .. ' New file', '<cmd> ene <BAR> startinsert <cr>'),
        dashboard.button('r', ' ' .. ' Recent files', '<cmd> Telescope oldfiles <cr>'),
        dashboard.button('g', ' ' .. ' Find text', '<cmd> Telescope live_grep <cr>'),
        dashboard.button('l', '󰒲 ' .. ' Lazy', '<cmd> Lazy <cr>'),
        dashboard.button('q', ' ' .. ' Quit NVIM', ':qa<CR>'),
      }
      require('alpha').setup(dashboard.opts)
      vim.api.nvim_create_autocmd('User', {
        once = true,
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
