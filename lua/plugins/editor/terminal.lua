---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        terminal = {
          wo = {
            -- disable winbar because it duplicates with shell prompt
            winbar = "",
          },
        },
      },
    },
  },
}
