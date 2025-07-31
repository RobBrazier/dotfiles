-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable MiniIndentScope for certain buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'help',
    'lazy',
    'mason',
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
