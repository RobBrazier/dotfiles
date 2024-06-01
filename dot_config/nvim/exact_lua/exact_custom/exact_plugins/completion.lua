return {

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',

      'onsails/lspkind.nvim',
    },
    opts = function(_, opts)
      local cmp = require 'cmp'

      opts.completion = { completeopt = 'menu,menuone,noinsert' }
      -- `:help ins-completion`
      opts.mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},
      }
      local lspkind = require 'lspkind'

      opts.formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol_text',
          max_width = 50,
          ellipsis_char = '...',
          symbol_map = {
            Supermaven = '',
            Codeium = '',
            Copilot = '',
          },
        },
      }

      opts.sources = {
        { name = 'nvim_lsp', priority = 1 },
        { name = 'path', priority = 1 },
        { name = 'buffer', priority = 1 },
      }
      return opts
    end,
    config = function(_, opts)
      require('cmp').setup(opts)
    end,
  },
  { -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    build = (function()
      -- Build Step is needed for regex support in snippets
      -- This step is not supported in many windows environments
      -- Remove the below condition to re-enable on windows
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
    dependencies = {
      -- If you want to add a bunch of pre-configured snippets,
      --    you can use this plugin to help you. It even has snippets
      --    for various frameworks/libraries/etc. but you will have to
      --    set up the ones that are useful for you.
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
      {
        'nvim-cmp',
        dependencies = {
          'saadparwaiz1/cmp_luasnip',
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          }
          table.insert(opts.sources, { name = 'luasnip', priority = 1 })
          return opts
        end,
      },
    },
    keys = {
      -- Think of <c-l> as moving to the right of your snippet expansion.
      --  So if you have a snippet that's like:
      --  function $name($args)
      --    $body
      --  end
      --
      -- <c-l> will move you to the right of each of the expansion locations.
      -- <c-h> is similar, except moving you backwards.
      {
        '<C-l>',
        function()
          local luasnip = require 'luasnip'
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            luasnip.jump(1)
          end
        end,
        mode = { 'i', 's' },
      },
      {
        '<C-h>',
        function()
          local luasnip = require 'luasnip'
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end,
        mode = { 'i', 's' },
      },
    },
  },
}
