return {
  formatters = {
    lua = { 'stylua' },
    -- Conform can also run multiple formatters sequentially
    python = function(bufnr)
      if require('conform').get_formatter_info('ruff_format', bufnr).available then
        return { 'ruff_format' }
      else
        return { 'isort', 'black' }
      end
    end,
    --
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
    templ = { 'templ' },
    terraform = { 'tofu_fmt' },
    tf = { 'tofu_fmt' },
    ['terraform-vars'] = { 'tofu_fmt' },
  },
}
