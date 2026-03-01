local add, later = Config.add, Config.later

-- Formatting --

later(function()
  add 'https://github.com/stevearc/conform.nvim'

  require('conform').setup {
    default_format_opts = {
      -- Allow formatting from LSP server if no dedicated formatter is available
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format' },
      go = { 'gofumpt' },
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

-- Snippets --

later(function()
  add 'https://github.com/rafamadriz/friendly-snippets'
end)
