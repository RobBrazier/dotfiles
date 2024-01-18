return {
  { "echasnovski/mini.surround", opts = {} },
  { "echasnovski/mini.pairs",    opts = {} },
  { "echasnovski/mini.move",     opts = {} },
  {
    "echasnovski/mini.files",
    opts = {},
    keys = {
      { '<space>fe', '<cmd>lua require("mini.files").open()<cr>', desc = "Toggle [F]ile [E]xplorer" },
    }
  }
}
