return {
  {
    'echasnovski/mini.nvim',
    opts = function(_, opts)
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]parenthen
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      opts.ai = {
        n_lines = 500,
      }
      opts.comment = {}
      opts.files = {}
      opts.icons = {}
      opts.indentscope = {
        symbol = '│',
        draw = {
          delay = 50,
          animation = require('mini.indentscope').gen_animation.none(),
        },
        options = {
          try_as_border = true,
        },
      }
      opts.move = {}
      -- opts.pairs = {}
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      opts.surround = {}
      local starter = require 'mini.starter'
      opts.sessions = {}
      opts.starter = {
        evaluate_single = true,
        items = {
          function()
            return starter.sections.sessions(5, true)()
          end,
          {
            { name = 'File Explorer', action = 'lua MiniFiles.open()', section = 'Actions' },
            { name = 'Edit new buffer', action = 'enew', section = 'Actions' },
            { name = 'Quit Neovim', action = 'qall', section = 'Actions' },
            { name = 'Lazy', action = 'Lazy', section = 'Actions' },
          },
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning('center', 'center'),
          starter.gen_hook.indexing('all', { 'Actions' }),
          starter.gen_hook.padding(3, 2),
        },
      }
      opts.statusline = {}
      return opts
    end,
    config = function(_, opts)
      for key, value in pairs(opts) do
        require('mini.' .. key).setup(value)
      end

      vim.keymap.set('n', '<leader>fe', function()
        require('mini.files').open()
      end, { desc = '[F]ile [E]xplorer' })

      require('mini.icons').mock_nvim_web_devicons()
      require('mini.icons').tweak_lsp_kind()
    end,
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'toggleterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
