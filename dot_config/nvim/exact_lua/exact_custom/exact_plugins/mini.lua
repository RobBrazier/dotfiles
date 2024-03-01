return {
  {
    'echasnovski/mini.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.keymap.set('n', '<leader>fe', '<cmd>lua MiniFiles.open()<cr>', { desc = '[F]ile [E]xplorer' })
    end,
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]parenthen
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      require('mini.statusline').setup()

      -- Move lines and blocks of text up and down
      require('mini.move').setup()

      -- Simple file explorer
      require('mini.files').setup()
    end,
  },
}
