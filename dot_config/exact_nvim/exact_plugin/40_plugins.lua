local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now
local now_if_args = Config.now_if_args

-- Tree-sitter ================================================================

now_if_args(function()
  add {
    source = 'nvim-treesitter/nvim-treesitter',
    -- Update tree-sitter parser after plugin is updated
    hooks = {
      post_checkout = function()
        vim.cmd 'TSUpdate'
      end,
    },
  }
  add 'nvim-treesitter/nvim-treesitter-textobjects'
  add 'nvim-treesitter/nvim-treesitter-context'

  -- Define languages which will have parsers installed and auto enabled
  -- After changing this, restart Neovim once to install necessary parsers. Wait
  -- for the installation to finish before opening a file for added language(s).
  local languages = {
    -- These are already pre-installed with Neovim. Used as an example.
    'lua',
    'vimdoc',
    'markdown',
    -- Additional parsers
    'bash',
    'html',
    'go',
    'templ',
    'gotmpl',
    'python',
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then
    require('nvim-treesitter').install(to_install)
  end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev)
    vim.treesitter.start(ev.buf)
  end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- Language servers ===========================================================

now_if_args(function()
  add 'b0o/schemastore.nvim'
  add 'neovim/nvim-lspconfig'

  -- Use `:h vim.lsp.enable()` to automatically enable language server based on
  -- the rules provided by 'nvim-lspconfig'.
  -- Use `:h vim.lsp.config()` or 'after/lsp/' directory to configure servers.
  -- Uncomment and tweak the following `vim.lsp.enable()` call to enable servers.
  vim.lsp.enable {
    'lua_ls',
    'gopls',
    'golangci_lint_ls',
    'templ',
    'superhtml',
    'ts_ls', -- typescript
    'taplo', -- toml
    'yamlls',
    'jsonls',
  }
end)

-- Formatting =================================================================

later(function()
  add 'stevearc/conform.nvim'

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
  add 'nmac427/guess-indent.nvim'
  require('guess-indent').setup()
end)

-- Snippets ===================================================================

later(function()
  add 'rafamadriz/friendly-snippets'
end)

now(function()
  -- Install only those that you need
  add { source = 'catppuccin/nvim', name = 'catppuccin' }

  -- Enable only one
  vim.cmd 'color catppuccin-mocha'
end)
