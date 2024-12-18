return {
  {
    'Saghen/blink.cmp',
    version = 'v0.*',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      signature = { enabled = true },
      sources = {
        default = { 'lazydev' },
      },
      providers = {
        lsp = { fallback_for = { 'lazydev' } },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
      },
    },
    opts_extend = { 'sources.default' },
  },
}
