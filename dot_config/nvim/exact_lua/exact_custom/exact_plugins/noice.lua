return {
  'folke/noice.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    { 'MunifTanjim/nui.nvim', version = '*' },
  },
  opts = {
    lsp = {
      hover = {
        silent = true,
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
}
