return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    build = ":Codeium Auth",
    cmd = "Codeium",
    opts = {}
  },
}
