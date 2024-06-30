---@type LazySpec
return {
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {
      fastwarp = {
        map = "<A-space>",
        rmap = "<A-bs>",
        cmap = "<A-space>",
        rcmap = "<A-bs>",
      },
    },
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   dependencies = { "RRethy/nvim-treesitter-endwise" },
  --   opts = {
  --     endwise = {
  --       enable = true,
  --     },
  --   },
  -- },
}
