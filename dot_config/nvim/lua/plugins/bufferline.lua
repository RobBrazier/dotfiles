return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {},
  config = function(_, opts)
    require('bufferline').setup(opts)
    vim.keymap.set('n', '<leader>bh', '<cmd>bprevious<cr>', { desc = '[B]uffer Previous' })
    vim.keymap.set('n', '<leader>bl', '<cmd>bnext<cr>', { desc = '[B]uffer Next' })
    vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = '[B]uffer [D]elete' })
  end
}
