return {
  -- Simple file explorer
  -- Separated out for lazy loading
  {
    'echasnovski/mini.files',
    opts = {},
    keys = {
      { '<leader>fe', '<cmd>lua MiniFiles.open()<cr>', desc = '[F]ile [E]xplorer' },
    },
  },
  {
    'echasnovski/mini.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
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
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      opts.surround = {}
      opts.statusline = {}
      opts.move = {}
      opts.comment = {}
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
      return opts
    end,
    config = function(_, opts)
      for key, value in pairs(opts) do
        require('mini.' .. key).setup(value)
      end
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
