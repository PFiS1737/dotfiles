---@module "lazy"
---@type LazySpec
return {
  {
    "kawre/leetcode.nvim",
    cmd = { "Leet" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "typescript",
    },
  },
}
