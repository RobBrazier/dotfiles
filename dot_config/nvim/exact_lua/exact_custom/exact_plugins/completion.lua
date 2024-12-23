return {
  {
    'Saghen/blink.cmp',
    version = 'v0.*',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        kind_icons = {
          Copilot = '',
          Codeium = '',
          Supermaven = '',
        },
      },
      completion = {
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
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = {
      'sources.default',
      'sources.compat',
      'appearance.kind_icons',
    },
    config = function(_, opts)
      for _, provider in pairs(opts.sources.providers or {}) do
        ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
        if provider.kind then
          local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
          local kind_idx = #CompletionItemKind + 1

          CompletionItemKind[kind_idx] = provider.kind
          ---@diagnostic disable-next-line: no-unknown
          CompletionItemKind[provider.kind] = kind_idx

          ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
          local transform_items = provider.transform_items
          ---@param ctx blink.cmp.Context
          ---@param items blink.cmp.CompletionItem[]
          provider.transform_items = function(ctx, items)
            items = transform_items and transform_items(ctx, items) or items
            for _, item in ipairs(items) do
              item.kind = kind_idx or item.kind
            end
            return items
          end

          -- Unset custom prop to pass blink.cmp validation
          provider.kind = nil
        end
      end
      require('blink.cmp').setup(opts)
    end,
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
            async = true,
            score_offset = 100,
          },
        },
      },
    },
  },
  {
    'Saghen/blink.compat',
    version = '*',
    lazy = true,
    optional = true,
    opts = {},
  },
}
