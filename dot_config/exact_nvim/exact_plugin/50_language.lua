local add, now_if_args = Config.add, Config.now_if_args

-- Tree-sitter ================================================================

now_if_args(function()
  add {
    source = 'https://github.com/nvim-treesitter/nvim-treesitter',
    -- Update tree-sitter parser after plugin is updated
    hooks = {
      post_checkout = function()
        vim.cmd 'TSUpdate'
      end,
    },
  }
  add 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
  add 'https://github.com/nvim-treesitter/nvim-treesitter-context'

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
    'go',
    'gotmpl',
    'python',
    'terraform',
    'javascript',
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
  -- add 'b0o/schemastore.nvim'
  add 'https://github.com/neovim/nvim-lspconfig'

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
    -- 'taplo', -- toml
    -- 'yamlls',
    -- 'jsonls',
    'tofu_ls',
    'ruff',
    'basedpyright',
  }
end)
