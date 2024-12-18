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
      opts.notify = {
        lsp_process = {
          enable = false,
        },
      }
      opts.pairs = {}
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      opts.surround = {}
      opts.statusline = {}
      opts.trailspace = {}
      return opts
    end,
    config = function(_, opts)
      for key, value in pairs(opts) do
        require('mini.' .. key).setup(value)
      end

      vim.notify = require('mini.notify').make_notify()

      vim.keymap.set('n', '<leader>fe', function()
        require('mini.files').open()
      end, { desc = '[F]ile [E]xplorer' })
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
