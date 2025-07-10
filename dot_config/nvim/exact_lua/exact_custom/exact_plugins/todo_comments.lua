return {
  -- Highlight todo, notes, etc in comments
  'folke/todo-comments.nvim',
  enabled = false,
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
