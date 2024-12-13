---@type LazySpec
return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
      delay = 1000,
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
