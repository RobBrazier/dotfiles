return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      'echasnovski/mini.nvim',
      {
        'Exafunction/windsurf.nvim',
        name = 'codeium.nvim',
        opts = {
          enable_cmp_source = false,
          enable_chat = false,
          virtual_text = false,
        },
      },
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
        ghost_text = {
          enabled = true,
        },
        documentation = {
          auto_show = false,
          auto_show_delay_ms = 500,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        },
      },
      snippets = { preset = 'mini_snippets' },
      fuzzy = { implementation = 'prefer_rust' },
      signature = { enabled = true },
    },
  },
}
