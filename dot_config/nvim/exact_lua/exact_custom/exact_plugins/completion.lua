return {
  {
    'Saghen/blink.cmp',
    version = 'v0.*',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'echasnovski/mini.nvim',
    },
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
      },
      completion = {
        auto_brackets = {
          enabled = true,
        },
        menu = {
          draw = {
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
            treesitter = { 'lsp' },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = true,
        },
      },
      trigger = {
        signature_help = {
          enabled = true,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = {
      'sources.default',
      'sources.compat',
    },
  },
  {
    'saghen/blink.cmp',
    opts = {
      sources = {
        default = { 'lazydev' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
      },
    },
  },
  {
    'Saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
}
