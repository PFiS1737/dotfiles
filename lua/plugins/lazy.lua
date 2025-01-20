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
        },
      },
    },
  },
}
