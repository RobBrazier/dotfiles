-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
vim.filetype.add { extension = { templ = 'templ' } }
vim.filetype.add { extension = { gotmpl = 'gohtml' } }
local M = {}
M.servers = {
  -- clangd = {},
  gopls = {},
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true, -- Using Ruff
      },
      python = {
        analysis = {
          ignore = { '*' }, -- Using Ruff
        },
      },
    },
  },
  ruff = {
    settings = {},
  },
  rust_analyzer = {},
  ts_ls = {},
  --
  templ = {},
  -- htmx = {},
  html = {},
  tailwindcss = {},

  astro = {},

  -- markup languages
  taplo = {},
  jsonls = {
    settings = function()
      return {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      }
    end,
  },
  yamlls = {
    settings = function()
      return {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          schemaStore = {
            enable = false,
            url = '',
          },
          format = {
            enable = true,
          },
          schemas = require('schemastore').yaml.schemas(),
          validate = true,
        },
      }
    end,
  },

  lua_ls = {
    -- cmd = {...},
    -- filetypes { ...},
    -- capabilities = {},
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
          -- If lua_ls is really slow on your computer, you can try this instead:
          -- library = { vim.env.VIMRUNTIME },
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  dockerls = {},
  terraformls = {},
  tflint = {},
}

M.tools = {
  'stylua',
  'goimports',
}

return M
