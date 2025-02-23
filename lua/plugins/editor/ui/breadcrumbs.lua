---@type LazySpec
return {
  {
    "Bekaboo/dropbar.nvim",
    event = "LazyFile",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "gB",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Pick Breadcrumbs",
      },
    },
    opts = {
      icons = {
        ui = {
          bar = {
            separator = "  ",
          },
        },
      },
      menu = {
        preview = false,
        quick_navigation = false,
        scrollbar = {
          enable = false,
        },
      },
    },
  },
}
