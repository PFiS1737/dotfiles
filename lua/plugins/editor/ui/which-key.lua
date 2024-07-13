---@type LazySpec
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>z", group = "sundries" },
      },

      -- disable icons
      replace = {
        key = {},
        desc = {},
      },
      icons = {
        rules = false,
      },
    },
  },
}
