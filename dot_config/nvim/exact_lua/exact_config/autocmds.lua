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

-- Rename file references using Snacks
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesActionRename',
  callback = function(event)
    require('snacks').rename.on_rename_file(event.data.from, event.data.to)
  end,
})
