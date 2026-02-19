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
      local miniclue = require 'mini.clue'
      opts.clue = {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },
        window = {
          config = {
            width = 'auto',
          },
        },
        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      }
      opts.completion = {
        lsp_completion = {
          source_function = 'omnifunc',
        },
      }
      opts.diff = {}
      opts.extra = {}
      opts.files = {}
      opts.git = {}
      local hi_words = require('mini.extra').gen_highlighter.words
      opts.hipatterns = {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
          hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
          todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
          note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        },
      }
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
      opts.jump = {}
      opts.notify = {}
      opts.move = {}
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      opts.surround = {}
      opts.snippets = {}
      opts.statusline = {}
      opts.pick = {
        options = {
          use_cache = true,
        },
      }
      return opts
    end,
    config = function(_, opts)
      for key, value in pairs(opts) do
        require('mini.' .. key).setup(value)
      end
      require('mini.icons').mock_nvim_web_devicons()
      require('mini.icons').tweak_lsp_kind()

      vim.notify = MiniNotify.make_notify {
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
      }

      vim.ui.select = require('mini.pick').ui_select
    end,
  },
}
