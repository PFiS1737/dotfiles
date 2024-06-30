---@type LazySpec
return {
  {
    "Bekaboo/dropbar.nvim",
    enabled = false,
    event = "LazyFile",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {},
  },
  {
    "utilyre/barbecue.nvim",
    event = "LazyFile",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>ub",
        function()
          require("barbecue.ui").toggle()
        end,
        desc = "Toggle Breadcrumbs",
      },
    },
    opts = {
      -- show_dirname = false,
      -- show_basename = false
    },
  },
}
