---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "polirritmico/telescope-lazy-plugins.nvim" },
    },
    keys = {
      {
        "<leader>fC",
        "<cmd>Telescope lazy_plugins<cr>",
        desc = "Find Config Spec",
      },
    },
    opts = {
      extensions = {
        lazy_plugins = {
          mappings = {
            ["i"] = {
              ["<LeftMouse>"] = false,
            },
            ["n"] = {
              ["<LeftMouse>"] = false,
            },
          },
          picker_opts = {
            layout_strategy = "flex",
            layout_config = require("utils.telescope").get_layout_config(),
          },
        },
      },
    },
  },
}
