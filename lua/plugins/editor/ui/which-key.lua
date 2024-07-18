---@type LazySpec
return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>z", group = "sundries" },
      },
      replace = {
        key = {},
        -- desc = {},
      },
      icons = {
        -- disable icons
        mappings = false,
        rules = false,
      },
    },
  },
}
