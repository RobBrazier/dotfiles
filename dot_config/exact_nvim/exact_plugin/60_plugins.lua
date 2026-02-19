local add, later, on_event = Config.add, Config.later, Config.on_event

-- Formatting =================================================================

on_event('BufWritePre', function()
  add 'https://github.com/stevearc/conform.nvim'

  require('conform').setup {
    default_format_opts = {
      -- Allow formatting from LSP server if no dedicated formatter is available
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = function(bufnr)
        if require('conform').get_formatter_info('ruff_format', bufnr).available then
          return { 'ruff_format' }
        else
          return { 'isort', 'black' }
        end
      end,
      go = { 'gofumpt', 'golines' },
      templ = { 'templ' },
    },
  }

  Config.new_autocmd('BufWritePre', '*', function(args)
    require('conform').format { bufnr = args.buf }
  end, 'Format on Save')
end)

later(function()
  add 'https://github.com/nmac427/guess-indent.nvim'
  require('guess-indent').setup()
end)

-- Snippets ===================================================================

later(function()
  add 'https://github.com/rafamadriz/friendly-snippets'
end)
