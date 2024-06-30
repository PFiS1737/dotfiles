---@type LazySpec
return {
  {
    "ckolkey/ts-node-action",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "NodeAction" },
    keys = {
      {
        "<leader>zt",
        "<cmd>NodeAction<cr>",
        desc = "Trigger Node Action",
      },
    },
    opts = {},
  },
}
