return {
  -- Better Around/Inside textobjects
  --
  -- Examples:
  --  - va)  - [V]isually select [A]round [)]parenthen
  --  - yinq - [Y]ank [I]nside [N]ext [']quote
  --  - ci'  - [C]hange [I]nside [']quote
  {
    'echasnovski/mini.ai',
    opts = {
      n_lines = 500,
    },
  },
  -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --
  -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  -- - sd'   - [S]urround [D]elete [']quotes
  -- - sr)'  - [S]urround [R]eplace [)] [']
  {
    'echasnovski/mini.surround',
    opts = {},
  },
  -- Simple and easy statusline.
  --  You could remove this setup call if you don't like it,
  --  and try some other statusline plugin
  {
    'echasnovski/mini.statusline',
    opts = {},
  },
  -- Simple File Explorer
  {
    'echasnovski/mini.files',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      {
        '<leader>fe',
        function()
          require('mini.files').open()
        end,
        desc = '[F]ile [E]xplorer',
      },
    },
  },
  -- Simple Starter Page
  {
    'echasnovski/mini.starter',
    opts = {},
  },
}
