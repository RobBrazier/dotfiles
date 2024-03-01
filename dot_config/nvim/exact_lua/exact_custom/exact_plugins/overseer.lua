return {
  {
    'stevearc/overseer.nvim',
    opts = {
      strategy = 'toggleterm',
    },
    cmd = 'OverseerRun',
    keys = {
      { '<leader>tr', '<cmd>OverseerRun<cr>', { desc = '[T]ask [R]unner' } },
      { '<leader>tt', '<cmd>OverseerToggle<cr>', { desc = '[T]ask [T]oggle' } },
    },
  },
}
