return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      htmx = function(_, opts)
        opts.filetypes = { "html", "templ" }
      end,
    },
  },
}
