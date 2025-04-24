return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      'echasnovski/mini.nvim',
      'folke/lazydev.nvim',
    },
    opts = {
      keymap = {
        preset = 'default',
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = {
          auto_show = false,
          auto_show_delay_ms = 500,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'mini_snippets' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },
}
