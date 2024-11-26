return {
  formatters = {
    lua = { 'stylua' },
    -- Conform can also run multiple formatters sequentially
    python = { 'ruff' },
    --
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
    templ = { 'templ' },
    fish = { 'fish_indent' },
  },
}
