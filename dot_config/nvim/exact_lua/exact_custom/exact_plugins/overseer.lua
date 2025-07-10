return {
  {
    'stevearc/overseer.nvim',
    version = '*',
    enabled = false,
    opts = {},
    cmd = 'OverseerRun',
    keys = {
      { '<leader>tr', '<cmd>OverseerRun<cr>', desc = '[T]ask [R]unner' },
      { '<leader>tt', '<cmd>OverseerToggle<cr>', desc = '[T]ask [T]oggle' },
    },
  },
}
