---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  {
    "nvim-mini/mini.surround",
    opts = {
      search_method = "cover_or_next",
      silent = true,
    },
  },
  -- {
  --   "kylechui/nvim-surround",
  --   event = "VeryLazy",
  --   opts = {
  --     move_cursor = false,
  --   },
  -- },
}
