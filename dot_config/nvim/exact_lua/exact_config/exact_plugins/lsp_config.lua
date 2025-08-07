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
  basedpyright = {
    settings = {
      basedpyright = {
        disableOrganizeImports = true, -- Using Ruff
        analysis = {
          typeCheckingMode = 'standard',
        },
      },
      analysis = {
        typeCheckingMode = 'standard',
      },
    },
  },
  ruff = {},
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
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  dockerls = {},
  terraformls = {},
  tflint = {},
  tinymist = {},
}

M.tools = {
  'stylua',
  'goimports',
}

return M
