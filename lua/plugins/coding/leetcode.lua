---@type LazySpec
return {
  {
    "kawre/leetcode.nvim",
    -- enabled = false,
    build = ":TSUpdate html",
    cmd = { "Leet" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- arg = "leetcode",
      lang = "typescript",
    },
  },
}
