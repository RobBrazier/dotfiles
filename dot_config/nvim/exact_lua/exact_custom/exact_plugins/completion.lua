return {
  {
    'Saghen/blink.cmp',
    version = 'v0.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      signature = { enabled = true },
      sources = {
        default = { 'lazydev' },
        providers = {
          lsp = { fallback_for = { 'lazydev' } },
          lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
        },
      },
      completion = {
        menu = {
          draw = {
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
          },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'Saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
}
