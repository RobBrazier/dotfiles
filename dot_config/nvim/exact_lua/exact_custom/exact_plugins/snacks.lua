return {
  'folke/snacks.nvim',
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = true },
    rename = { enabled = true },
    quickfile = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesActionRename',
      callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end,
    })
  end,
}
