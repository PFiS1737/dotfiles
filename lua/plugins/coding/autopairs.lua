---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-mini/mini.pairs",
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
        no_filter_nodes = {
          "string",
          "raw_string",
          "char_literal",
          "string_literal",
          "string_literals",
          "character_literal",
        },
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
