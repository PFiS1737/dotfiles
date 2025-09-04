---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "qmljs" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {},
      },
    },
  },
}
